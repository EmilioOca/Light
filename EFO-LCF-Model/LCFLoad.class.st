Class {
	#name : #LCFLoad,
	#superclass : #PUChangeUser,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFLoad class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFLoad class >> isValidIn: aContext [
"	^ aContext isLoggedIn and: [{'corrector'. 'admin' } includes: aContext user group name ]"
	^ aContext isLoggedIn and: [ aContext user name = 'emilio' ].
]

{ #category : #'as yet unclassified' }
LCFLoad class >> label [
	^ 'Recargar'
]

{ #category : #'as yet unclassified' }
LCFLoad >> doExecute [

	super doExecute.
	self context root childrenDecoration children 
		select: [ :each | each isKindOf: LCFBook ] 
		thenDo: [ :book | book reload ].
	
"celebs is ok...			loadFrom: self books;"
]

{ #category : #'as yet unclassified' }
LCFLoad >> isQuick [
	^ true
]
