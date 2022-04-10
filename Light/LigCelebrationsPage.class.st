Class {
	#name : #LigCelebrationsPage,
	#superclass : #LigBookPage,
	#category : #'Light-Pages'
}

{ #category : #rendering }
LigCelebrationsPage >> book [
	^ self app lightApp celebrations
	 
]

{ #category : #rendering }
LigCelebrationsPage >> title [
	^ 'Celebraciones'
]
