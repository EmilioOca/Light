Class {
	#name : #LightSession,
	#superclass : #WASession,
	#instVars : [
		'user',
		'registry'
	],
	#category : #Light
}

{ #category : #'as yet unclassified' }
LightSession >> ifLoggedIn: loggedAction [ 
    ^ self isLoggedIn ifTrue: loggedAction 
]

{ #category : #'as yet unclassified' }
LightSession >> ifLoggedIn: loggedAction ifNot: notLoggedAction [
    ^ self isLoggedIn ifTrue: loggedAction ifFalse: notLoggedAction
]

{ #category : #'as yet unclassified' }
LightSession >> initialize [ 
	super initialize.
	user := LightUser anonymous.
	registry := LightUserRegistry read: LightUser usersFile readStream.
]

{ #category : #'as yet unclassified' }
LightSession >> isLoggedIn [
    ^ user isNil not and: [ user name ~= LightUser anonymous name ]
]

{ #category : #'as yet unclassified' }
LightSession >> login: aUser [
Transcript show: aUser name.
    user := aUser
]

{ #category : #'as yet unclassified' }
LightSession >> logout [
    user := LightUser anonymous 
]

{ #category : #'as yet unclassified' }
LightSession >> registry [
	^ registry
]

{ #category : #'as yet unclassified' }
LightSession >> user [
    ^ user
]
