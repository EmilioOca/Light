Class {
	#name : #LigCicloAPage,
	#superclass : #LigBookPage,
	#category : #'Light-Pages'
}

{ #category : #accessing }
LigCicloAPage >> book [
	^ self app lightApp bookA
	 
]

{ #category : #accessing }
LigCicloAPage >> title [
	^ 'Ciclo A'
]
