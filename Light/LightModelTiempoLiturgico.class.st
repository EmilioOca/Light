Class {
	#name : #LightModelTiempoLiturgico,
	#superclass : #Object,
	#instVars : [
		'chapters',
		'key',
		'collapsed'
	],
	#category : #'Light-Model'
}

{ #category : #'instance creation' }
LightModelTiempoLiturgico class >> keyFor: aLine [
"	^ self sectionsKeys detect: [ :section | aLine includesSubString: section ] ifNone: [ #Unknown ]."
	| matcher |
		matcher := RxMatcher forString: '.*(Tiempo<(\w+)>);.*'.
	^ ( (matcher matches: aLine) and: [
		(self sectionsKeys includes: (matcher subexpression: 3) asSymbol) ] ) 
		ifTrue: [ (matcher subexpression: 3) asSymbol. ] 
		ifFalse: [ self signal "#Unknown" ] 



]

{ #category : #obsolete }
LightModelTiempoLiturgico class >> keyFrom: aLine [
"	^ self sectionsKeys detect: [ :section | aLine includesSubString: section ] ifNone: [ #Unknown ]."
	| matcher |
		matcher := RxMatcher forString: '.*(Tiempo<(\w+)>);.*'.
	^ ( (matcher matches: aLine) and: [
		(self sectionsKeys includes: (matcher subexpression: 3) asSymbol) ] ) 
		ifTrue: [ (matcher subexpression: 3) asSymbol. ] 
		ifFalse: [ #Unknown ] 



]

{ #category : #obsolete }
LightModelTiempoLiturgico class >> label [
	^ 'liturgic time'
]

{ #category : #'instance creation' }
LightModelTiempoLiturgico class >> new: aKey [
	^ self new 
		key: aKey
		yourself.


]

{ #category : #obsolete }
LightModelTiempoLiturgico class >> on: aLine [
	^ self sections detect: [ :section | aLine includesSubString: section ] ifNone: [ #Unknown ].


]

{ #category : #constants }
LightModelTiempoLiturgico class >> sections [
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

{ #category : #constants }
LightModelTiempoLiturgico class >> sectionsKeys [
	^ { #Adviento. #Navidad. #Cuaresma. #Triduo. #Pascua. #Ordinario. #Fija. #Unknown. #IntroTC. #Command1. #Command2. #Command3. #Command4. #Command5. #Command6. #Command7. #Command8. #Command9. #Command10   }
]

{ #category : #obsolete }
LightModelTiempoLiturgico >> Einitialize [
	super initialize.
	self collapsed: true.
]

{ #category : #initialize }
LightModelTiempoLiturgico >> addChap: aLCFChapter [ 
	self chapters add: aLCFChapter 
]

{ #category : #obsolete }
LightModelTiempoLiturgico >> addChap: aLCFChapter on: aStructure [

	self chapters add: aLCFChapter.
	
	self key ~= #Fija  ifTrue: [
		aStructure addChild: aLCFChapter.
	]
]

{ #category : #accessing }
LightModelTiempoLiturgico >> chapters [ 
	^ chapters ifNil: [ chapters := OrderedCollection new ].
]

{ #category : #accessing }
LightModelTiempoLiturgico >> chapters: coll [
	chapters := coll
]

{ #category : #obsolete }
LightModelTiempoLiturgico >> collapse [
	self collapsed: true

]

{ #category : #obsolete }
LightModelTiempoLiturgico >> collapsed [
	^ collapsed
]

{ #category : #obsolete }
LightModelTiempoLiturgico >> collapsed: aBolean [
	collapsed := aBolean.
]

{ #category : #obsolete }
LightModelTiempoLiturgico >> description [ 
	^ self class sections at: self key ifAbsent: [ key ].
]

{ #category : #obsolete }
LightModelTiempoLiturgico >> expand [
	self collapsed: false

]

{ #category : #accessing }
LightModelTiempoLiturgico >> key [
	^ key
]

{ #category : #accessing }
LightModelTiempoLiturgico >> key: aByteSymbol [ 
	key := aByteSymbol 
]

{ #category : #obsolete }
LightModelTiempoLiturgico >> name [
	^ self key
]

{ #category : #obsolete }
LightModelTiempoLiturgico >> renderBox: aString chapters: chaps on: html using: view [
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

{ #category : #obsolete }
LightModelTiempoLiturgico >> renderChapter: aPost on: html [
 
	(self context user notNil and: [self correctores includes: self context user group name]) 	ifTrue: [ 
		aPost freezed ifTrue: [ 
			(html anchor)
				callback: [ aPost freezed: false ];
				with: [ html image title: 'desbloquear edición'; height: 20; url: (LightLibrary  / #lockopenPng).] ]
		ifFalse: [ (html anchor)
				callback: [ aPost freezed: true ];
				with: [ html image title: 'bloquear edición'; height: 20; url: (LightLibrary  / #lockclosedPng).
					] ] 
	] .
	
	html anchor
		goto: (self context structure: aPost);
		with: [ html html: aPost title ].
	html div
		class: 'summary';
		with: [ html html: '(', aPost film eng, ')' ]
]

{ #category : #obsolete }
LightModelTiempoLiturgico >> renderChapter: aPost on: html using: view [
 
	(view context user notNil and: [view correctores includes: view context user group name]) 	ifTrue: [ 
		aPost freezed ifTrue: [ 
			(html anchor)
				callback: [ aPost freezed: false ];
				with: [ html image title: 'desbloquear edición para todo el capítulo'; height: 20; url: (LightLibrary  / #lockopenPng).] ]
		ifFalse: [ (html anchor)
				callback: [ aPost freezed: true ];
				with: [ html image title: 'bloquear edición para todo el capítulo'; height: 20; url: (LightLibrary  / #lockclosedPng).
					] ] 
	] .
	
	aPost renderOnTree: html link: (view context structure: aPost)
]

{ #category : #obsolete }
LightModelTiempoLiturgico >> renderContentOn: html using: view [
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

{ #category : #obsolete }
LightModelTiempoLiturgico >> title [
	^ self key
]
