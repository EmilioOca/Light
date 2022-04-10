Class {
	#name : #LCFSave,
	#superclass : #PUChangeUser,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFSave class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFSave class >> isValidIn: aContext [
"	^ aContext isLoggedIn and: [{'corrector'. 'admin' } includes: aContext user group name ]"
	^ aContext isLoggedIn and: [ aContext user name = 'emilio' ].
]

{ #category : #'as yet unclassified' }
LCFSave class >> label [
	^ 'Salvar'
]

{ #category : #testing }
LCFSave >> doExecute [
"	LatexWriter new generateLaTeX: 'latexample'."
	super doExecute.
	self context root propertyAt: 'savedOn' put: DateAndTime current.
	self context root childrenDecoration children 
		select: [ :each | each isKindOf: LCFBook ] 
		thenDo: [ :book | book write ].
	
]

{ #category : #testing }
LCFSave >> isQuick [
	^ true
]
