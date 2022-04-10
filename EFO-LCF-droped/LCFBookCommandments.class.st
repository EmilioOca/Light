Class {
	#name : #LCFBookCommandments,
	#superclass : #LCFBook,
	#category : #'EFO-LCF-droped'
}

{ #category : #'as yet unclassified' }
LCFBookCommandments class >> isAbstract [
	^ false
]

{ #category : #render }
LCFBookCommandments >> itemContent: chapter [
	^ TiempoLiturgico sections at: chapter tiempo
		

]

{ #category : #render }
LCFBookCommandments >> itemTitle: chapter [
	^ chapter film eng.

]

{ #category : #render }
LCFBookCommandments >> render: chapter onTree: html link: link [

	html anchor
		goto: link;
		title: chapter film eng;
		with: [ html html: chapter film eng ].
		

]

{ #category : #accessing }
LCFBookCommandments >> sectionsKeys [
	^{  #IntroTC. #Command1. #Command2. #Command3. #Command4. #Command5. #Command6. #Command7. #Command8. #Command9. #Command10 }
]

{ #category : #accessing }
LCFBookCommandments >> time: aLiturgicTime [
	^ self times at: aLiturgicTime ifAbsentPut: [ TiempoLiturgico new: aLiturgicTime  ]

]

{ #category : #accessing }
LCFBookCommandments >> updateChild: chap [
	chap date:  (TransPairCommand from: chap date and: chap tiempo).
	chap title: ( TiempoLiturgico sections at: chap tiempo), ' (', chap film eng, ')'.

	( self time: chap tiempo) addChap: chap on: self.
	chap book: self.
	chap poster initializeWith: chap.
	self chapters add: chap.

]
