Class {
	#name : #LightUserTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #setup }
LightUserTest >> emilio [
	^ LightUser named: 'Emilio'
]

{ #category : #tests }
LightUserTest >> testAnonymous [

	| user |
	user := LightUser anonymous.
	
	self assert: (user grants includes: LightUserRole anonymous).
	self assert: user role equals: 'anonymous'.
	self assert: user name equals: 'Visitor'.
	
]

{ #category : #tests }
LightUserTest >> testNaming [

	| user |
	user := self emilio.
	
	self assert: (user grants includes: LightUserRole anonymous ).
	
]

{ #category : #tests }
LightUserTest >> testRole [

	| user |
	user := self emilio.
	
	self assert: user role equals: LightUserRole anonymous name.
	
]

{ #category : #tests }
LightUserTest >> testSecondRole [

	| user |
	user := self emilio.

	user grants add: LightUserRole admin.	
	self assert: user role equals: LightUserRole admin name.
	
]

{ #category : #tests }
LightUserTest >> testThirdRole [

	| user |
	user := self emilio.

	user grants add: LightUserRole admin.	
	user grants add: LightUserRole anonymous.
	self assert: user role equals: LightUserRole admin name.
	
]
