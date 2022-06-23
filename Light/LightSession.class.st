Class {
	#name : #LightSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #Light
}

{ #category : #'as yet unclassified' }
LightSession >> initialize [ 
	super initialize.
	user := LightUser anonymous 
]

{ #category : #'as yet unclassified' }
LightSession >> isLoggedIn [
    ^ user isNil not
]

{ #category : #'as yet unclassified' }
LightSession >> login: aUser [
    user := aUser
]

{ #category : #'as yet unclassified' }
LightSession >> logout [
    user := LightUser anonymous 
]

{ #category : #'as yet unclassified' }
LightSession >> user [
    ^ user
]
