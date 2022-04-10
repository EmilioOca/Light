Class {
	#name : #LightModelBookCommandments,
	#superclass : #LightModelBook,
	#category : #'Light-Model'
}

{ #category : #'as yet unclassified' }
LightModelBookCommandments class >> isAbstract [
	^ false
]

{ #category : #accessing }
LightModelBookCommandments >> EupdateChild: chap [
	chap date:  (TransPairCommand from: chap date and: chap tiempo).
	chap title: ( LightModelTiempoLiturgico sections at: chap tiempo), ' (', chap film eng, ')'.

	( self time: chap tiempo) addChap: chap on: self.
	chap book: self.
	chap poster initializeWith: chap.
	self chapters add: chap.

]

{ #category : #render }
LightModelBookCommandments >> itemContent: chapter [
	^ LightModelTiempoLiturgico sections at: chapter tiempo
		

]

{ #category : #render }
LightModelBookCommandments >> itemTitle: chapter [
	^ chapter film eng.

]

{ #category : #render }
LightModelBookCommandments >> render: chapter onTree: html link: link [

	html anchor
		goto: link;
		title: chapter film eng;
		with: [ html html: chapter film eng ].
		

]

{ #category : #accessing }
LightModelBookCommandments >> sectionsKeys [
	^{  #IntroTC. #Command1. #Command2. #Command3. #Command4. #Command5. #Command6. #Command7. #Command8. #Command9. #Command10 }
]

{ #category : #accessing }
LightModelBookCommandments >> time: aLiturgicTime [
	^ self times at: aLiturgicTime ifAbsentPut: [ LightModelTiempoLiturgico new: aLiturgicTime  ]

]
