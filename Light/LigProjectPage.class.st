Class {
	#name : #LigProjectPage,
	#superclass : #LigPageComponent,
	#category : #'Light-Pages'
}

{ #category : #accessing }
LigProjectPage >> holder [
	^ self root
]

{ #category : #rendering }
LigProjectPage >> renderContentOn: html [
    html paragraph: 'Este proyecto surge en el seno de la *Comunidad Barat>http://www.comunidadbarat.org/* con la intención de acercar a sus miembros el anuncio de la Palabra desde los medios audio visuales.'.
    html paragraph: 'Colaborando desinteresadamente logramos desarrollar este espacio, que ahora abrimos a todas las comunidades, y tiene como finalidad la traducion de los textos y su compilación final en español en un docuemto electrónico que pueda ser descargado libremente y sin fines de lucro.'.
    html paragraph: 'Peter Malone, sacerdote, crítico de cine y autor de los tres libros, cedió generosamente los textos originales y dió su autorización para la publicacion final en español.'.

    html paragraph: [ 
		html text: 'Para poder colaborar es necesario registrase, por favor siga los pasos indicados en '.
		html anchor callback: [ self root present: self contact ]; with: 'Contacto'.
		html text: '.'.
	]


]

{ #category : #accessing }
LigProjectPage >> title [ 
	^ 'Projecto'
]
