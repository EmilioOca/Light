Class {
	#name : #LigCoverPage,
	#superclass : #LigPageComponent,
	#category : #'Light-Pages'
}

{ #category : #rendering }
LigCoverPage >> holder [
	^ self root
]

{ #category : #rendering }
LigCoverPage >> renderContentOn: html [
   html paragraph: [ 
		html text: 'A través de este sitio nos encontramos con la obra del padre '.
		html anchor callback: [ self root present: self peter ]; with: 'Peter Malone'.
   		html text: ' "¡Luz, Cámara, Fe!" editados en tres tomos correspondientes a los ciclos litúrgicos: '.
		html anchor callback: [ self root present: self cicloA ]; with: 'ciclo A'.
   		html text: ', '.
		html anchor callback: [ self root present: self cicloB ]; with: 'ciclo B'.
   		html text: ' y '.
		html anchor callback: [ self root present: self cicloC ]; with: 'ciclo C'.
   		html text: ' y un cuarto libro sobre los '.
		html anchor callback: [ self root present: self commandments ]; with: '10 mandamientos'.
   		html text: '.' 
	].
	
	html paragraph: 'Cada uno de los volúmenes cuenta con una amplia lista de películas que se sugieren una a una para cada domingo o momento especial del año, con la sinopsis del filme, un comentario a modo de reflexión y oración final entrando de este modo en un diálogo profundo entre la propuesta cinematográfica, la realidad que nos interpela y la Palabra de Dios.'.
    html paragraph: 'Los libros *(ver introducción)>introduccion* están escritos originalmente en inglés, siga estos enlaces para encontrarlos con su portada original.'.
	html orderedList with: [ 
		html listItem: [ 
			html anchor url: 'http://www.amazon.com/Lights-Camera-Faith-Lectionary-Scripture/dp/081984490X/*';
							with: '- *Lights, Camera, Faith!: A Movie Lectionary Guide to Scripture, Cycle A>' ].
		html listItem: [ 
	  		html anchor  url: 'http://www.amazon.com/Lights-Camera-Faith-Lectiomary-Scripture/dp/0819844926/*';
 	 		with: '- *Lights, Camera, Faith!: A Movie Lectionary Guide to Scripture, Cycle B>'].
		html listItem: [ 
			html anchor  url: 'http://www.amazon.com/Lights-Camera-Faith-Lectionary-Scripture/dp/0819845019/*';
					 with: '- *Lights, Camera, Faith!: A Movie Lectionary Guide to Scripture, Cycle C>'].
		html listItem: [ 
    		html anchor  url: 'http://www.amazon.com/Lights-Camera-Faith-The-Commandments/dp/0819845205/*';
	 		with: '- *Lights, Camera, Faith! - The Ten Commandments>'].
    	
	].
    html paragraph: [ 
		html anchor callback: [ self root present: self peter ]; with: 'MSC Peter Malone'.
		html text: ' ha cedido sus textos para que sean traducidos y compaginados en español a través de un trabajo colectivo de evangelización, con el objeto de que el producto final pueda ser descargado y distribuido en forma gratuita y sin fines de lucro.'. ].
    html paragraph: '¿Cómo puedo ayudar en la traducción?'.
    html paragraph: [ 
		html text: 'Por ejemplo, cada uno de los tres primeros libros se corresponde con un ciclo litúrgico ('.
		html anchor callback: [ self root present: self cicloA ]; with: 'ciclo A'.
   		html text: ', '.
		html anchor callback: [ self root present: self cicloB ]; with: 'ciclo B'.
   		html text: ' y '.
		html anchor callback: [ self root present: self cicloC ]; with: 'ciclo C'.
   		html text: ').'.
  ].
    html paragraph: 'En ellos hay un capítulo por cada fiesta, o tiempo durante el año. Al presionar sobre ese tiempo litúrgico, se expande un listado de las películas que corresponden a cada domingo de ese tiempo. Si nos posicionamos sobre una de las películas, hallaremos la ficha técnica, comentario, semblanza con la Palabra, oración y reflexión, separados en párrafos para que el texto pueda ser traducido en su totalidad o por párrafos, de modo que el colaborador pueda moderar su trabajo dentro de sus posibilidades reales de tiempo.'.
    html paragraph: 'Quien no pueda colaborar con la traducción puede consultar los textos ya traducidos o descargar documentos con esas versiones castellanas y aprovecharlos en su actividad diaria.'.
    html paragraph: [
		html text: 'Para poder colaborar ('.
		html anchor callback: [ self root present: self colaborate ]; with: 'cómo colaborar'. 
		html text: ') es necesario registrarse en el sitio a través de la página de '.
		html anchor callback: [ self root present: self contact ]; with: 'Contacto'.
		html text: ' y así obtener una cuenta que le permitirá inscribirse en el sitio y traducir los párrafos que se encuentren disponibles para dicha traducción.'.
	]
]

{ #category : #rendering }
LigCoverPage >> title [ 
	^ 'Portada'
]
