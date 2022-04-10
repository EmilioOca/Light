Class {
	#name : #LCFSessions,
	#superclass : #PRCase,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFSessions class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFSessions >> viewComponentClass [
	^ LCFSessionsView
]
