Class {
	#name : #LigColaboratePage,
	#superclass : #LigPageComponent,
	#category : #'Light-Pages'
}

{ #category : #rendering }
LigColaboratePage >> holder [
	^ self root
]

{ #category : #rendering }
LigColaboratePage >> renderContentOn: html [
   html paragraph: [ 
		html text: 'Para poder colaborar es necesario registrase, por favor siga los pasos indicados en '.
		html anchor callback: [ self root present: self contact ]; with: 'Contacto'.
		html text: '.'.
	].
   html paragraph: 'Una vez obtenido un usuario y habiéndose logeado en el sitio podrá observar controles al lado de cada párrafo editable.
'.
   html paragraph: [
		(html image) 
			title: 'cambiar imagen';
			height: 16;
			url: LightLibrary / #editPng.
		html text: ' para acceder al diálogo de edición del párrafo adyacente.'
	].
   html paragraph: 'El diálogo le ofrecerá el texto del párrafo en inglés, una tradución automática aproximada del texto realizada por el traductor de google y un cuadro de edición en el que introducir el texto en castellano correspondiente.'.
   html paragraph: 'Luego puede aceptar o cancelar.'.
   html paragraph: [
		(html image) 
			title: 'cambiar imagen';
			height: 16;
			url: LightLibrary / #flagredPng.
		html text: ' para asentar un comentario para el corrector.'
	].
   html paragraph: 'Se ofrecerá un cuadro de texto en el que ingresar el comentario y un panel con la historia de comentarios anteriores y sus autores.'.
   html paragraph: 'Puede usar el boton "Agregar" para incluir su comentario en la historia o presionar la tecla Esc para abandonar el diálogo.
'.
]

{ #category : #rendering }
LigColaboratePage >> title [ 
	^ 'Colaborar'
]
