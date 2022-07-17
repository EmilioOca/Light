Class {
	#name : #LightUserRegistry,
	#superclass : #Object,
	#instVars : [
		'reg'
	],
	#category : #'Light-Model'
}

{ #category : #read }
LightUserRegistry class >> read: file [ 
	| line reg |
	
	reg := self new.
	[ (line := file nextLine) isNil ] whileFalse: [
		reg register: (LightUser read: line).
	].

	
	^ reg
	
]

{ #category : #fetching }
LightUserRegistry >> initialize [
	super initialize.
	reg := OrderedCollection new.
	
]

{ #category : #build }
LightUserRegistry >> register: newUser [ 
	reg add: newUser
]

{ #category : #fetching }
LightUserRegistry >> userFor: name pass: pass [ 
	^ reg detect: [ :each | 
			each fits: name pass: pass
		 ] 	ifNone: [ self default ]
]
