Class {
	#name : #LigContactPage,
	#superclass : #LigPageComponent,
	#category : #'Light-Pages'
}

{ #category : #accessing }
LigContactPage >> holder [
	^ self root
]

{ #category : #rendering }
LigContactPage >> renderContentOn: html [
    html paragraph: 'La *Comunidad Barat>http://www.comunidadbarat.org/* le da la bienvenida a este emprendimiento comunitario.'.
    html paragraph: 'Para poder colaborar es necesario registrase gestionando una cuenta que le permita interactuar en el sitio.'.
    html paragraph: 'Una vez logeado podrá navegar los capítulos e ir traduciendo los párrafos.'.
    html paragraph: 'Para poder realizar esta operación y obtener un usuario por favor escriba a emilioOca@gmail.com'.
]

{ #category : #accessing }
LigContactPage >> title [ 
	^ 'Contacto'
]
