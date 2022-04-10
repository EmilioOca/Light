Class {
	#name : #LigMenuCiclosPage,
	#superclass : #LigPageComponent,
	#category : #'Light-Pages'
}

{ #category : #rendering }
LigMenuCiclosPage >> renderContentOn: html [
	html tbsNav beTabs; with: [ 
		self cicloA asPillOn: html.
		self cicloB asPillOn: html.
		self cicloC asPillOn: html.
		self celebrations asPillOn: html.
		self commandments asPillOn: html.
	]
]
