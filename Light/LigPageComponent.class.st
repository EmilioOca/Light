Class {
	#name : #LigPageComponent,
	#superclass : #WAComponent,
	#instVars : [
		'app',
		'family'
	],
	#category : #'Light-Pages'
}

{ #category : #'instance creation' }
LigPageComponent class >> newOn: app [
	^ self new 
		app: app;
		yourself
]

{ #category : #accessing }
LigPageComponent >> about [
	^ self app about
]

{ #category : #accessing }
LigPageComponent >> app [
	^ app
]

{ #category : #accessing }
LigPageComponent >> app: anApp [
	app := anApp
]

{ #category : #actions }
LigPageComponent >> asCallbackOn: aBrush [
	"aBrush tbsNavItem beActiveIf: [ self isActive ]."
	aBrush anchor callback: [ self holder present: self ]; with: self title.
]

{ #category : #actions }
LigPageComponent >> asPillOn: html [
	"aBrush tbsNavItem beActiveIf: [ self isActive ]."
	html tbsNavItem 
		beActiveIf: [ self isActive ]; 
		with: [ self asCallbackOn: html ].
		
]

{ #category : #accessing }
LigPageComponent >> celebrations [
	^ self app celebrations
]

{ #category : #accessing }
LigPageComponent >> cicloA [
	^ self app cicloA
]

{ #category : #accessing }
LigPageComponent >> cicloB [
	^ self app cicloB
]

{ #category : #accessing }
LigPageComponent >> cicloC [
	^ self app cicloC
]

{ #category : #accessing }
LigPageComponent >> ciclos [
	^ self app ciclos
]

{ #category : #accessing }
LigPageComponent >> colaborate [
	^ self app colaborate
]

{ #category : #accessing }
LigPageComponent >> commandments [
	^ self app commandments
]

{ #category : #accessing }
LigPageComponent >> contact [
	^ self app contact
]

{ #category : #accessing }
LigPageComponent >> cover [
	^ self app cover
]

{ #category : #accessing }
LigPageComponent >> glosarios [
	^ self app glosarios
]

{ #category : #actions }
LigPageComponent >> isActive [ 
	^ self holder present = self 

]

{ #category : #accessing }
LigPageComponent >> menu [
	^ self app menu
]

{ #category : #accessing }
LigPageComponent >> menuCiclos [
	^ self app menuCiclos
]

{ #category : #accessing }
LigPageComponent >> peter [
	^ self app peter
]

{ #category : #accessing }
LigPageComponent >> project [
	^ self app project
]

{ #category : #accessing }
LigPageComponent >> root [
	^ self app root
]

{ #category : #actions }
LigPageComponent >> title [ 
	^ self className printString
]
