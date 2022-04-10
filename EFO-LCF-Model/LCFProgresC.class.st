Class {
	#name : #LCFProgresC,
	#superclass : #PUChangeUser,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFProgresC class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFProgresC class >> isValidIn: aContext [
	^ true
]

{ #category : #'as yet unclassified' }
LCFProgresC class >> label [
	^ 'Libro sobre ciclo C'
]

{ #category : #testing }
LCFProgresC >> doExecute [
	super doExecute.
	self context root propertyAt: 'actualBook' put: (self context root childrenDecoration at: 'cicloc' )

]

{ #category : #testing }
LCFProgresC >> isQuick [
	^ true
]
