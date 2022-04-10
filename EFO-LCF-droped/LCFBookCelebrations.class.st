Class {
	#name : #LCFBookCelebrations,
	#superclass : #LCFBook,
	#pools : [
		'ChronologyConstants'
	],
	#category : #'EFO-LCF-droped'
}

{ #category : #'as yet unclassified' }
LCFBookCelebrations class >> isAbstract [
	^ false
]

{ #category : #accessing }
LCFBookCelebrations >> chapters [
	^ chapters ifNil: [ chapters := SortedCollection sortBlock: [ :a :b |  a title < b title ] ].
]

{ #category : #accessing }
LCFBookCelebrations >> children [
	^ self chapters
]

{ #category : #accessing }
LCFBookCelebrations >> loadFrom: books [

	books do: [ :book |
		book times at: #Fija ifPresent: [ :tiempos |
			tiempos chapters do: [ :chap | 
				self updateChild: chap.
			]
		]
	]

]

{ #category : #accessing }
LCFBookCelebrations >> reload [
	"Do nothing..."
]

{ #category : #accessing }
LCFBookCelebrations >> sectionsKeys [
	^MonthNames.
]

{ #category : #accessing }
LCFBookCelebrations >> time: aLiturgicTime [

	^ self times at: aLiturgicTime ifAbsentPut: [ (TiempoLiturgico new: aLiturgicTime) chapters: (SortedCollection sortBlock: [ :a :b |  a title < b title ] ); yourself ]

]

{ #category : #accessing }
LCFBookCelebrations >> updateChild: chap [
	( self time: chap moment date monthName) addChap: chap.

	self addChild: chap.
]

{ #category : #accessing }
LCFBookCelebrations >> write [
	"Do nothing..."
]
