Class {
	#name : #LigAboutPage,
	#superclass : #LigPageComponent,
	#category : #'Light-Pages'
}

{ #category : #rendering }
LigAboutPage >> holder [
	^ self root
]

{ #category : #rendering }
LigAboutPage >> renderContentOn: html [
   html paragraph: '...'.
]

{ #category : #rendering }
LigAboutPage >> title [ 
	^ 'Acerca de ...'
]
