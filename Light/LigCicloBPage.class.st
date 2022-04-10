Class {
	#name : #LigCicloBPage,
	#superclass : #LigBookPage,
	#category : #'Light-Pages'
}

{ #category : #accessing }
LigCicloBPage >> book [
	^ self app lightApp bookB
	 
]

{ #category : #accessing }
LigCicloBPage >> title [
	^ 'Ciclo B'
]
