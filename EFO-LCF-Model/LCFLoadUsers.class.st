Class {
	#name : #LCFLoadUsers,
	#superclass : #PUChangeUser,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFLoadUsers class >> buildUsers: kernel [
	| file line list usr registeredGroup role |
	
	registeredGroup := (kernel groupNamed: 'registered' ifNone: [] ).
	
	[ 
		file := FileStream readOnlyFileNamed: LightVariables rootPath, 'LCF/users.txt'.
		file nextLine.
		[ (line :=  file nextLine )isEmptyOrNil ] whileFalse: [
			list := line substrings: ','.
			usr := PUUser named: (list at: 1)  withBlanksCondensed .
			usr password: (list at: 2) withBlanksCondensed.
			usr firstName: (list at: 4) withBlanksCondensed.
			usr lastName: (list at: 5) withBlanksCondensed.
			usr email: (list at: 6) withBlanksCondensed.
			role := kernel groupNamed: (list at: 3) withBlanksCondensed ifNone: [].
			role users add: usr.
			registeredGroup users add: usr.
			usr groups add: role.
			usr groups add: registeredGroup.
			kernel users add: usr.
		].

	] ensure: [file close].

]

{ #category : #'as yet unclassified' }
LCFLoadUsers class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFLoadUsers class >> isValidIn: aContext [
"	^ aContext isLoggedIn and: [{'corrector'. 'admin' } includes: aContext user group name ]"
	^ aContext isLoggedIn and: [ aContext user name = 'emilio' ].
]

{ #category : #'as yet unclassified' }
LCFLoadUsers class >> label [
	^ '
Recargar Usuarios'
]

{ #category : #'as yet unclassified' }
LCFLoadUsers >> doExecute [

	super doExecute.
	self class buildUsers: self kernel
	
]

{ #category : #'as yet unclassified' }
LCFLoadUsers >> isQuick [
	^ true
]
