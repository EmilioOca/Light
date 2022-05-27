Class {
	#name : #LightHeadingPairComponent,
	#superclass : #LightPairComponent,
	#category : #'Light-Pages'
}

{ #category : #initialization }
LightHeadingPairComponent >> renderContentOn: html [
	html heading: [
		html render: pair eng.
		html render:  ' / '.
		html render: pair fineSpa.
	]
]
