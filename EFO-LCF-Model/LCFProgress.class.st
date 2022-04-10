Class {
	#name : #LCFProgress,
	#superclass : #PRCase,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFProgress class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFProgress class >> isValidIn: aContext [
	^ aContext isLoggedIn
]

{ #category : #'as yet unclassified' }
LCFProgress >> viewComponentClass [
	^ LCFProgressView
]
