Class {
	#name : #LigCiclosPage,
	#superclass : #LigPageComponent,
	#instVars : [
		'present'
	],
	#category : #'Light-Pages'
}

{ #category : #rendering }
LigCiclosPage >> children [ 
	^ { self cicloA. self cicloB. self cicloC. self celebrations , self commandments }
]

{ #category : #accessing }
LigCiclosPage >> holder [
	^ self root
]

{ #category : #accessing }
LigCiclosPage >> present [
	^ present ifNil: [ present := self cicloA ]
]

{ #category : #accessing }
LigCiclosPage >> present: anObject [
	present := anObject
]

{ #category : #rendering }
LigCiclosPage >> renderContentOn: html [
	html render: self menuCiclos.
	html break.
   html render: self present.
   
]

{ #category : #accessing }
LigCiclosPage >> title [ 
	^ 'Libros'
]
