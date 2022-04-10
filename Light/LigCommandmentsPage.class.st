Class {
	#name : #LigCommandmentsPage,
	#superclass : #LigBookPage,
	#category : #'Light-Pages'
}

{ #category : #accessing }
LigCommandmentsPage >> book [
	^ self app lightApp commandments
	 
]

{ #category : #accessing }
LigCommandmentsPage >> title [
	^ '10 Mandamientos'
]
