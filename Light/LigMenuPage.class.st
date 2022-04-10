Class {
	#name : #LigMenuPage,
	#superclass : #LigPageComponent,
	#category : #'Light-Pages'
}

{ #category : #rendering }
LigMenuPage >> renderContentOn: html [

	html tbsNav bePills; with: [ 
		self cover asPillOn: html.
		self ciclos asPillOn: html.
		html tbsNavItem: [ html anchor: 'Glosarios' ].
		html tbsNavItem: [ html anchor: 'Avance>/progress' ].
		html tbsNavItem: [ html anchor: 'royecto>/proyecto' ].
		self colaborate asPillOn: html.
		self contact asPillOn: html. 
		"html tbsNavItem: [ html text: '- *Cambios>/changes*' ]."
		html tbsNavItem: [ html anchor: 'Comentarios>/comments' ]."
		html tbsNavItem: [ html text: '- *Usuarios>/sessions*' ]."
		html tbsNavItem: [ html anchor: 'About>/about' ].	
	]
]
