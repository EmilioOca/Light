Class {
	#name : #LCFProximoChapter,
	#superclass : #PRWidget,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFProximoChapter class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFProximoChapter class >> label [
	^ 'ProximoDomingo'
]

{ #category : #'as yet unclassified' }
LCFProximoChapter >> dateText [
	| current |
	"
	 self new dateText  
	"
 	current := Date current.

	^ (current dayOfWeek = 1ifTrue: [
		'Hoy, '
	] ifFalse: [
		current := current addDays: (8 - current dayOfWeek ).
		 'Próxima Fiesta, '
	]), current dayOfMonth printString,  ' del ', current monthIndex printString, ': '.
]

{ #category : #'as yet unclassified' }
LCFProximoChapter >> renderContentOn: html [
	| next current |

 	current := Date current.

	next := (((self context root propertyAt: 'distro') chapters select:[ :each | each moment date notNil ] )asSortedCollection: [ :a :b | a moment date < b moment date ] )
				detect: [ :each | each moment >= current ] ifNone: [ ^self ].

	html anchor
		goto: (context structure: next);
		title: next film spa;
		with: [ html heading with: [ html withLineBreaks: (next moment prettyHeadingFor: current), ': 
', next date spa ] ].

]
