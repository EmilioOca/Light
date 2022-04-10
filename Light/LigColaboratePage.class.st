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
    html paragraph: 'Para poder colaborar es necesario registrarse, por favor siga los pasos indicados en *Contacto>/contacto*.'.
    html paragraph: 'Una vez obtenido un usuario y habiéndose logeado en el sitio podrá observar controles al lado de cada párrafo editable.
'.
    html paragraph: '|Use|+http://lcf.seasidehosting.st/resources/edit.png+|para acceder al diálogo de edición del párrafo adyacente.'.
    html paragraph: 'El diálogo le ofrecerá el texto del párrafo en inglés, una tradución automática aproximada del texto realizada por el traductor de google y un cuadro de edición en el que introducir el texto en castellano correspondiente.'.
    html paragraph: 'Luego puede aceptar o cancelar.'.
    html paragraph: '|Use|+http://lcf.seasidehosting.st/resources/flag_red.png+|para asentar un comentario para el corrector.'.
    html paragraph: 'Se ofrecerá un cuadro de texto en el que ingresar el comentario y un panel con la historia de comentarios anteriores y sus autores.'.
    html paragraph: 'Puede usar el boton "Agregar" para incluir su comentario en la historia o presionar la tecla Esc para abandonar el diálogo.
'.
]

{ #category : #rendering }
LigColaboratePage >> title [ 
	^ 'Colaborar'
]
