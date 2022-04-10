Extension { #name : #PRErrorView }

{ #category : #'*EFO-LCF-Model' }
PRErrorView >> renderOptionExternalOn: html [
	"<option: 400>"
	
	| referer |
	referer := self requestContext request referer.
	referer isNil ifFalse: [
		html listItem: [
			html text: 'If you clicked a link from an external page '.
			html anchor
				url: referer;
				with: referer.
			html text: ', please inform the webmaster of this site of his mistake.' ] ]
]

{ #category : #'*EFO-LCF-Model' }
PRErrorView >> renderOptionLinkOn: html [
	<option: 100>
	
	html listItem: 'Haga click en otro enlace de esta página.'
]

{ #category : #'*EFO-LCF-Model' }
PRErrorView >> renderOptionRootOn: html [
"	<option: 200>"
	
	| rootContext |
	rootContext := self context structure: self context root.
	rootContext isValid ifTrue: [
		html listItem: [
			html text: 'Jump to the '.
			html anchor
				goto: rootContext;
				with: rootContext structure title.
			html text: ' homepage.' ] ]
]

{ #category : #'*EFO-LCF-Model' }
PRErrorView >> renderOptionSpellingOn: html [
	"<option: 300>"
	
	html listItem: 'If you typed the page address, make sure that it is spelled correctly.'
]

{ #category : #'*EFO-LCF-Model' }
PRErrorView >> renderSolutionsOn: html [
	html paragraph: 'Puede intentar estas opciones'.
	html unorderedList: [ self renderOptionsOn: html ]
]
