Class {
	#name : #LigGlosariosPage,
	#superclass : #LigPageComponent,
	#category : #'Light-Pages'
}

{ #category : #rendering }
LigGlosariosPage >> holder [
	^ self root
]

{ #category : #rendering }
LigGlosariosPage >> renderContentOn: html [
   html paragraph: '...'.
]

{ #category : #rendering }
LigGlosariosPage >> title [ 
	^ 'Glosarios'
]
