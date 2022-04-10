Class {
	#name : #LCFChanges,
	#superclass : #PRCase,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFChanges class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFChanges >> viewComponentClass [
	^ LCFChangesView
]
