Class {
	#name : #LCFComments,
	#superclass : #PRCase,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFComments class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFComments >> viewComponentClass [
	^ LCFCommentsView
]
