Class {
	#name : #LightModelBookCicle,
	#superclass : #LightModelBook,
	#category : #'Light-Model'
}

{ #category : #accessing }
LightModelBookCicle >> sectionsKeys [
	^ LightModelTiempoLiturgico sectionsKeys reject: [ :sec | sec = #Fija ].
]
