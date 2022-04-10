Class {
	#name : #GoogleTranslate,
	#superclass : #Object,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
GoogleTranslate >> doPost: text [

"	GoogleTranslate new translate: 'open the door' "
	"'open the door' asHtmlString"
	
	 ^ ( HTTPSocket httpGet: 'http://translate.google.com/translate_a/t?client=t&text=', text encodeForHTTP, '&hl=es&sl=en&tl=es' ) 
]

{ #category : #'as yet unclassified' }
GoogleTranslate >> find: text [

"	GoogleTranslate new find: 'open the door' "
	"'open the door' asHtmlString"
	
	 
 	( self doPost: text ) contents
			 regex: '\[\[\[\"([[:alnum:][:space:][:punct:]¿\\]+)\"]\]*' matchesDo: [ :var | ^self split: var ].
			
	^  '<hay problemas para procesar parte de la respuesta de google>'
]

{ #category : #'as yet unclassified' }
GoogleTranslate >> split: text [

"	GoogleTranslate new find: 'open the door'   "

	| idx |
	idx := text findString: '","' startingAt: 0 caseSensitive: false.
 	^ (  ( ( ( ( text copyFrom: 5 to: ( idx -1 )) 
			copyReplaceAll: ' , ' with: ', ')
			copyReplaceAll: ' : ' with: ': ' )
			copyReplaceAll: '\"' with: '"' )
			copyReplaceAll: ' '' ' with: ' ''' )
]

{ #category : #'as yet unclassified' }
GoogleTranslate >> translate: text [
	| res |

 	[ [
		res := ''.
		( text subStrings: '.' ) do: [ :each |
			res := res, ' ', (self find: each ) , '.' .
		].
		
		^ (text last = $.) ifTrue: [ 
			res allButFirst.
		] ifFalse: [ 
			res allButFirst allButLast.
		].

		
	] on: Error do: [^'<hay problemas para acceder a google>'. ] 
	] valueWithin: (Duration seconds: 2) onTimeout: [^'<hay demoras para acceder a google>'. ] 
]
