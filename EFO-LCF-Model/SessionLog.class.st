Class {
	#name : #SessionLog,
	#superclass : #Object,
	#instVars : [
		'rol',
		'origen',
		'lastAction',
		'structure',
		'visits',
		'user'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
SessionLog class >> newOn: aSession [
	| sessionLog |

	sessionLog := self new.

	aSession presenter context user ifNil: [
		sessionLog user: '<anonimo>'.
		sessionLog rol: 'visitante'.
	]  ifNotNil: [
		sessionLog user: aSession presenter context user.
		sessionLog rol: sessionLog user group name.
	].
	sessionLog origen: aSession origen.
	sessionLog lastAction: aSession lastAction.	
	sessionLog structure: aSession presenter context structure.
	sessionLog visits: 0.
	
	^ sessionLog 
]

{ #category : #accessing }
SessionLog >> lastAction [
	^ lastAction
]

{ #category : #accessing }
SessionLog >> lastAction: anObject [
	lastAction := anObject
]

{ #category : #accessing }
SessionLog >> origen [
	^ origen
]

{ #category : #accessing }
SessionLog >> origen: anObject [
	origen := anObject
]

{ #category : #accessing }
SessionLog >> rol [
	^ rol
]

{ #category : #accessing }
SessionLog >> rol: anObject [
	rol := anObject
]

{ #category : #accessing }
SessionLog >> structure [
	^ structure
]

{ #category : #accessing }
SessionLog >> structure: anObject [
	structure := anObject
]

{ #category : #accessing }
SessionLog >> updateWith: aSession [

	self lastAction < aSession lastAction ifTrue: [
		self structure: aSession presenter context structure.
	].

	self visits: self visits + 1.
	

]

{ #category : #accessing }
SessionLog >> user [
	^ user
]

{ #category : #accessing }
SessionLog >> user: u [
	user := u
]

{ #category : #accessing }
SessionLog >> visits [
	^ visits
	

]

{ #category : #accessing }
SessionLog >> visits: number [
	visits := number.
	

]
