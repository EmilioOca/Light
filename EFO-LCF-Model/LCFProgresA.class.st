Class {
	#name : #LCFProgresA,
	#superclass : #PUChangeUser,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFProgresA class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFProgresA class >> isValidIn: aContext [
	^ true
]

{ #category : #'as yet unclassified' }
LCFProgresA class >> label [
	^ 'Libro sobre ciclo A'
]

{ #category : #testing }
LCFProgresA >> doExecute [
	super doExecute.
	self context root propertyAt: 'actualBook' put: (self context root childrenDecoration at: 'cicloa' )

]

{ #category : #testing }
LCFProgresA >> isQuick [
	^ true
]
