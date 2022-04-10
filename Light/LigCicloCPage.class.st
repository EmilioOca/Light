Class {
	#name : #LigCicloCPage,
	#superclass : #LigBookPage,
	#category : #'Light-Pages'
}

{ #category : #accessing }
LigCicloCPage >> book [
	^ self app lightApp bookC
	 
]

{ #category : #accessing }
LigCicloCPage >> title [
	^ 'Ciclo C'
]
