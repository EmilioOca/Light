Class {
	#name : #LCFBookCicle,
	#superclass : #LCFBook,
	#category : #'EFO-LCF-droped'
}

{ #category : #'as yet unclassified' }
LCFBookCicle class >> isAbstract [
	^ false
]

{ #category : #accessing }
LCFBookCicle >> sectionsKeys [
	^TiempoLiturgico sectionsKeys reject: [ :sec | sec = #Fija ].
]

{ #category : #accessing }
LCFBookCicle >> time: aLiturgicTime [
	^ self times at: aLiturgicTime ifAbsentPut: [ TiempoLiturgico new: aLiturgicTime  ]

]

{ #category : #accessing }
LCFBookCicle >> updateChild: chap [
	( self time: chap tiempo) addChap: chap on: self.
	chap book: self.
	chap poster initializeWith: chap.
	self chapters add: chap.

]
