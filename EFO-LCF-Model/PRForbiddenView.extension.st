Extension { #name : #PRForbiddenView }

{ #category : #'*EFO-LCF-Model' }
PRForbiddenView >> renderErrorOn: html [
	html paragraph: [ 
		html text: 'No se permite su acceso a esta página'.
"		html text: (forbidden isNil
			ifTrue: [ 'view' ]
			ifFalse: [ forbidden command class label asLowercase ]).
		html text: ' this page.' "]
]

{ #category : #'*EFO-LCF-Model' }
PRForbiddenView >> renderOptionLoginOn: html [
	<option: 0>
	
	| loginContext |
	loginContext := self context
		structure: self context structure
		command: (PULogin new
			answer: forbidden;
			yourself).
	loginContext isValid ifTrue: [
		html listItem: [
			html anchor
				goto: loginContext;
				with: 'Authentíquese'.
			html text: ' nuevamente en el sitio.' ] ]
]
