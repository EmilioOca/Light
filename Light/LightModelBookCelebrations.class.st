Class {
	#name : #LightModelBookCelebrations,
	#superclass : #LightModelBook,
	#pools : [
		'ChronologyConstants'
	],
	#category : #'Light-Model'
}

{ #category : #'as yet unclassified' }
LightModelBookCelebrations class >> isAbstract [
	^ false
]

{ #category : #accessing }
LightModelBookCelebrations >> chapters [
	^ chapters ifNil: [ chapters := SortedCollection sortBlock: [ :a :b |  a title < b title ] ].
]

{ #category : #accessing }
LightModelBookCelebrations >> children [
	^ self chapters
]

{ #category : #accessing }
LightModelBookCelebrations >> loadFrom: books [
   self shouldNotImplement 

]

{ #category : #accessing }
LightModelBookCelebrations >> loadFromBooks: books [

	books do: [ :book |
		book times at: #Fija ifPresent: [ :tiempos |
			tiempos chapters do: [ :chap | 
				self updateChild: chap.
			]
		]
	]

]

{ #category : #accessing }
LightModelBookCelebrations >> reload [
	"Do nothing..."
]

{ #category : #accessing }
LightModelBookCelebrations >> sectionsKeys [
	^MonthNames.
]

{ #category : #accessing }
LightModelBookCelebrations >> time: aLiturgicTime [

	^ self times at: aLiturgicTime ifAbsentPut: [ (LightModelTiempoLiturgico new: aLiturgicTime) chapters: (SortedCollection sortBlock: [ :a :b |  a title < b title ] ); yourself ]

]

{ #category : #accessing }
LightModelBookCelebrations >> updateChild: chap [
	( self time: chap moment date monthName) addChap: chap.

	self chapters add: chap.
]

{ #category : #accessing }
LightModelBookCelebrations >> write [
	"Do nothing..."
]
