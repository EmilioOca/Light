Class {
	#name : #LightSessionTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #tests }
LightSessionTest >> testAnonUser [

	| sess |
	sess := LightSession new.
	self assert: sess user role equals: LightUserRole anonymous name.
	self deny: sess isLoggedIn.
]

{ #category : #tests }
LightSessionTest >> testIsLoggedIn [

	| sess |
	sess := LightSession new.
	self deny: sess isLoggedIn.
	sess login: (sess registry userFor: 'Emilio' pass: 'emilio' ).
	self assert: sess isLoggedIn.

]

{ #category : #tests }
LightSessionTest >> testLogin [

	| sess |
	sess := LightSession new.
	self deny: sess isLoggedIn.
	sess login:  (sess registry userFor: 'Emilio' pass: 'emilio' ).
	self assert: sess isLoggedIn
	
]

{ #category : #tests }
LightSessionTest >> testLogout [

	| sess |
	sess := LightSession new.
	self deny: sess isLoggedIn.
	sess login: (sess registry userFor: 'Emilio' pass: 'emilio' ).
	self assert: sess isLoggedIn.
	sess logout.
	self deny: sess isLoggedIn.

]

{ #category : #tests }
LightSessionTest >> testRegistry [

	| sess |
	sess := LightSession new.
	self assert: (sess registry userFor: 'Emilio' pass: 'emilio' ) name
		  equals: 'Emilio'.
	
]
