Class {
	#name : #LCFProgres10C,
	#superclass : #PUChangeUser,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFProgres10C class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFProgres10C class >> isValidIn: aContext [
	^ true
]

{ #category : #'as yet unclassified' }
LCFProgres10C class >> label [
	^ 'Los 10 Mandamientos'
]

{ #category : #testing }
LCFProgres10C >> doExecute [
	super doExecute.
	self context root propertyAt: 'actualBook' put: (self context root childrenDecoration at: 'mandamientos' )

]

{ #category : #testing }
LCFProgres10C >> isQuick [
	^ true
]
