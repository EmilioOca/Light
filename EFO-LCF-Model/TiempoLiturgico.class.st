Class {
	#name : #TiempoLiturgico,
	#superclass : #PRWidget,
	#instVars : [
		'chapters',
		'key',
		'collapsed'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #creation }
TiempoLiturgico class >> isAbstract [
	^ false
]

{ #category : #accessing }
TiempoLiturgico class >> keyFrom: aLine [
"	^ self sectionsKeys detect: [ :section | aLine includesSubString: section ] ifNone: [ #Unknown ]."
	| matcher |
		matcher := RxMatcher forString: '.*(Tiempo<(\w+)>);.*'.
	^ ( (matcher matches: aLine) and: [
		(self sectionsKeys includes: (matcher subexpression: 3) asSymbol) ] ) 
		ifTrue: [ (matcher subexpression: 3) asSymbol. ] 
		ifFalse: [ #Unknown ] 



]

{ #category : #creation }
TiempoLiturgico class >> label [
	^ 'liturgic time'
]

{ #category : #accessing }
TiempoLiturgico class >> new: aKey [
	^ (self new) key: aKey.


]

{ #category : #accessing }
TiempoLiturgico class >> on: aLine [
	^ self sections detect: [ :section | aLine includesSubString: section ] ifNone: [ #Unknown ].


]

{ #category : #creation }
TiempoLiturgico class >> sections [
	^ {  #Adviento -> 'Adviento'. 
		#Navidad -> 'Navidad'. 
		#Cuaresma -> 'Cuaresma'.
		#Triduo -> 'Semana Santa'.
		#Pascua -> 'Pascua'.
		#Ordinario -> 'Tiempo Ordinario'. 
		#Fija -> 'Otras Celebraciones'.
		#January -> 'Enero'.
		#February -> 'Febrero'.
		#March -> 'Marzo'.
		#April -> 'Abril'.
		#May -> 'Mayo'.
		#June -> 'Junio'.
		#July -> 'Julio'.
		#August -> 'Agosto'.
		#September -> 'Septiembre'.
		#October -> 'Octubre'.
		#November -> 'Noviembre'.
		#December -> 'Diciembre'.
		#IntroTC -> 'Introducción'.
		#Command1 -> '1er Mandamiento'.
		#Command2 -> '2do Mandamiento'.
		#Command3 -> '3er Mandamiento'.
		#Command4 -> '4to Mandamiento'.
		#Command5 -> '5to Mandamiento'.
		#Command6 -> '6to Mandamiento'.
		#Command7 -> '7mo Mandamiento'.
		#Command8 -> '8vo Mandamiento'.
		#Command9 -> '9no Mandamiento'.
		#Command10 -> '10mo Mandamiento'
		 } asDictionary
]

{ #category : #creation }
TiempoLiturgico class >> sectionsKeys [
	^ { #Adviento. #Navidad. #Cuaresma. #Triduo. #Pascua. #Ordinario. #Fija. #Unknown. #IntroTC. #Command1. #Command2. #Command3. #Command4. #Command5. #Command6. #Command7. #Command8. #Command9. #Command10   }
]

{ #category : #accessing }
TiempoLiturgico >> addChap: aLCFChapter [ 
	self chapters add: aLCFChapter 
]

{ #category : #accessing }
TiempoLiturgico >> addChap: aLCFChapter on: aStructure [

	self chapters add: aLCFChapter.
	
	self key ~= #Fija  ifTrue: [
		aStructure addChild: aLCFChapter.
	]
]

{ #category : #accessing }
TiempoLiturgico >> chapters [ 
	^ chapters ifNil: [ chapters := OrderedCollection new ].
]

{ #category : #accessing }
TiempoLiturgico >> chapters: coll [
	chapters := coll
]

{ #category : #accessing }
TiempoLiturgico >> collapse [
	self collapsed: true

]

{ #category : #accessing }
TiempoLiturgico >> collapsed [
	^ collapsed
]

{ #category : #accessing }
TiempoLiturgico >> collapsed: aBolean [
	collapsed := aBolean.
]

{ #category : #accessing }
TiempoLiturgico >> description [ 
	^ self class sections at: self key ifAbsent: [ key ].
]

{ #category : #accessing }
TiempoLiturgico >> expand [
	self collapsed: false

]

{ #category : #accessing }
TiempoLiturgico >> initialize [
	super initialize.
	self collapsed: true.
]

{ #category : #accessing }
TiempoLiturgico >> key [
	^ key
]

{ #category : #accessing }
TiempoLiturgico >> key: aByteSymbol [ 
	key := aByteSymbol 
]

{ #category : #accessing }
TiempoLiturgico >> name [
	^ self key
]

{ #category : #accessing }
TiempoLiturgico >> renderBox: aString chapters: chaps on: html using: view [
	html div id: aString; 
			class: 'lcfbox'; 
			style: ('overflow: visible; ',  (self collapsed ifTrue: ['display: none;'] ifFalse: ['']) ); 
			with: [
		chaps do: [ :each |
			html listItem: [
				self renderChapter: each on: html using: view] ]
"		html div
			class: 'content';
			with: 'Smalltalk Enterprise Aubergines' "]
]

{ #category : #accessing }
TiempoLiturgico >> renderChapter: aPost on: html [
 
	(self context user notNil and: [self correctores includes: self context user group name]) 	ifTrue: [ 
		aPost freezed ifTrue: [ 
			(html anchor)
				callback: [ aPost freezed: false ];
				with: [ html image title: 'desbloquear edición'; height: 20; url: (PRBlueprintLibrary  / #lockopenPng).] ]
		ifFalse: [ (html anchor)
				callback: [ aPost freezed: true ];
				with: [ html image title: 'bloquear edición'; height: 20; url: (PRBlueprintLibrary  / #lockclosedPng).
					] ] 
	] .
	
	html anchor
		goto: (self context structure: aPost);
		with: [ html html: aPost title ].
	html div
		class: 'summary';
		with: [ html html: '(', aPost film eng, ')' ]
]

{ #category : #accessing }
TiempoLiturgico >> renderChapter: aPost on: html using: view [
 
	(view context user notNil and: [view correctores includes: view context user group name]) 	ifTrue: [ 
		aPost freezed ifTrue: [ 
			(html anchor)
				callback: [ aPost freezed: false ];
				with: [ html image title: 'desbloquear edición para todo el capítulo'; height: 20; url: (PRBlueprintLibrary  / #lockopenPng).] ]
		ifFalse: [ (html anchor)
				callback: [ aPost freezed: true ];
				with: [ html image title: 'bloquear edición para todo el capítulo'; height: 20; url: (PRBlueprintLibrary  / #lockclosedPng).
					] ] 
	] .
	
	aPost renderOnTree: html link: (view context structure: aPost)
]

{ #category : #accessing }
TiempoLiturgico >> renderContentOn: html using: view [
		self collapsed ifTrue: [
			html anchor onClick: (html scriptaculous effect id: self key; perform: #blindDown);
						callback: [ self expand ];
						with: '+ ', self description. 
		] ifFalse: [
			html anchor onClick: (html scriptaculous effect id: self key; perform: #blindUp);
						callback: [ self collapse ];
						with: '- ', self description.
		].
		html break.
		self renderBox: self key chapters: self chapters on: html using: view.

]

{ #category : #accessing }
TiempoLiturgico >> title [
	^ self key
]
