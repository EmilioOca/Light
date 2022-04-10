Extension { #name : #PUUser }

{ #category : #'*efo-lcf-model' }
PUUser >> renderOn: html [
	html title: (self firstName ifNotNil: [self firstName, ' ', self lastName ] );
		with: self name.
	
]
