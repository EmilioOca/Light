Class {
	#name : #LCFSideGlosarios,
	#superclass : #PRWidget,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFSideGlosarios class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFSideGlosarios >> active [
	^ self context structure active.
]

{ #category : #'as yet unclassified' }
LCFSideGlosarios >> active: aGlosario [

	self context structure active: aGlosario.
]

{ #category : #'as yet unclassified' }
LCFSideGlosarios >> glosarios [
	^ self context structure glosarios.
]

{ #category : #'as yet unclassified' }
LCFSideGlosarios >> renderContentOn: html [

	html heading: 'Glosario por...'.
		
	self glosarios do: [ :glosario |
		glosario renderNodeOn: html using: self. 
	].
]
