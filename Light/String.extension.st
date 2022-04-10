Extension { #name : #String }

{ #category : #'*Light' }
String >> inline [
	"the inverse of #lines"
 	^ ' ' join: self withBlanksCondensed lines

]
