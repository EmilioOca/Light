Extension { #name : #String }

{ #category : #'*EFO-LCF-Model' }
String >> asLegalSelector [
	"'234znak 43 ) 2' asLegalSelector2"
	| toUse |
 	toUse := self select: [:char | char isAlphaNumeric].
	(toUse size = 0 or: [toUse first isLetter not])
		ifTrue: [toUse := 'v', toUse].
       ^ toUse uncapitalized

"'234znak 43 ) 2' asLegalSelector"
]

{ #category : #'*EFO-LCF-Model' }
String >> texScape [
	^ (((
(((((((((((( ' ', self 
			copyReplaceAll: 'á' with: '\''a')
			copyReplaceAll: 'é' with: '\''e')
			copyReplaceAll: 'í' with: '\''i')
			copyReplaceAll: 'ó' with: '\''o')
			copyReplaceAll: 'ú' with: '\''u')
			copyReplaceAll: 'Ú' with: '\''U')
			copyReplaceAll: ' ''' with: ' `')
			copyReplaceAll: 'ñ' with: '\~n')
			copyReplaceAll: '" ' with: '"\ ')
			copyReplaceAll: ' "' with: ' ``')
			copyReplaceAll: '¿' with: '?`')
			copyReplaceAll: '_' with: '\_')
			copyReplaceAll: '¡' with: '!`')
			copyReplaceAll: '$' with: '\$')
			copyReplaceAll: 'xx' with: 'xx')
.
]
