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
		"html tbsNavItem: [ html anchor: 'Glosarios' ]."
		"html tbsNavItem: [ html anchor: 'Avance<proximamente>' ]." 
		self project asPillOn: html.
		self colaborate asPillOn: html.
		self contact asPillOn: html. 
		"html tbsNavItem: [ html text: '- *Cambios>/changes*' ]."
		"html tbsNavItem: [ html anchor: 'Comentarios>/comments' ]."
		"html tbsNavItem: [ html text: '- *Usuarios>/sessions*' ]."
		self about asPillOn: html. 
	]
]
