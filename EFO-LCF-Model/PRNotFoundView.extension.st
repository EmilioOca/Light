Extension { #name : #PRNotFoundView }

{ #category : #'*EFO-LCF-Model' }
PRNotFoundView >> renderErrorOn: html [
	html paragraph: [ 
		html 
			text: 'The objeto requerido '; 
			code: self requestContext request url;
			text: ' no se encuentra en este servidor.' ]
]
