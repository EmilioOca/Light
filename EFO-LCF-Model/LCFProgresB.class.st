Class {
	#name : #LCFProgresB,
	#superclass : #PUChangeUser,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFProgresB class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFProgresB class >> isValidIn: aContext [
	^ true
]

{ #category : #'as yet unclassified' }
LCFProgresB class >> label [
	^ 'Libro sobre ciclo B'
]

{ #category : #testing }
LCFProgresB >> doExecute [
	super doExecute.
	self context root propertyAt: 'actualBook' put: (self context root childrenDecoration at: 'ciclob' )

]

{ #category : #testing }
LCFProgresB >> isQuick [
	^ true
]
