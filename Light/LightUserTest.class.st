Class {
	#name : #LightUserTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #setup }
LightUserTest >> emilio [
	^ LightUser named: 'Emilio' pass: 'emipass'
]

{ #category : #setUps }
LightUserTest >> regFile [
	^ self regFileAnonymousLine, '
', self regFileAdminLine
]

{ #category : #setUps }
LightUserTest >> regFileAdminLine [
	^ 'Martin marpass admin'
]

{ #category : #setUps }
LightUserTest >> regFileAnonymousLine [
	^ 'Emilio emi'
]

{ #category : #setUps }
LightUserTest >> registry [
	^ LightUserRegistry new 
]

{ #category : #tests }
LightUserTest >> testAdminUserRead [

	| user reg |
	user := LightUser read: self regFileAdminLine.
	
	self assert: user role equals: LightUserRole admin name.
	
]

{ #category : #tests }
LightUserTest >> testAdminUserwrite [

	| user |
	user := LightUser read: self regFileAdminLine.
	
	self assert: ( String streamContents: [ :stream | user writeOn: stream ] ) 
		  equals: self regFileAdminLine.
	
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
LightUserTest >> testAnonymousIsUnfit [
	self deny: (LightUser anonymous fits: 'Visitor' pass: 'any')
]

{ #category : #tests }
LightUserTest >> testEmtpyRegistry [

	| reg user |
	reg := self registry.

	user := reg userFor: 'any' pass: 'body'.
	self assert: user role equals: LightUser anonymous role.
	self assert: user name equals: LightUser anonymous name.
	
]

{ #category : #tests }
LightUserTest >> testNaming [

	| user |
	user := self emilio.
	
	self assert: (user grants includes: LightUserRole anonymous ).
	
]

{ #category : #tests }
LightUserTest >> testRegistryRead [

	| reg user |
	reg := LightUserRegistry read: self regFile readStream.

	user := reg userFor: self emilio name pass: 'emi'.
	self assert: user role equals: LightUser anonymous role.
	self assert: user name equals: self emilio name.
	
]

{ #category : #tests }
LightUserTest >> testRegistryReadWithGrants [

	| reg user |
	reg := LightUserRegistry read: self regFile readStream.

	user := reg userFor: 'Martin' pass: 'marpass'.
	self assert: user role equals: LightUserRole admin name.
	
]

{ #category : #tests }
LightUserTest >> testRegistrySeek [

	| reg user |
	reg := self registry.
	reg register: self emilio.

	user := reg userFor: self emilio name pass: 'emipass'.
	self assert: user role equals: LightUser anonymous role.
	self assert: user name equals: self emilio name.
	
]

{ #category : #tests }
LightUserTest >> testRegistrySeekFail [

	| reg user |
	reg := self registry.
	reg register: self emilio.

	user := reg userFor: self emilio name pass: 'body'.
	self assert: user role equals: LightUser anonymous role.
	self assert: user name equals: LightUser anonymous name.
	
]

{ #category : #tests }
LightUserTest >> testRole [

	| user |
	user := self emilio.
	
	self assert: user role equals: LightUserRole anonymous name.
	
]

{ #category : #tests }
LightUserTest >> testRoleForAdmin [

	self assert: (LightUserRole for: 'admin') name
			equals: LightUserRole admin name.
	
]

{ #category : #tests }
LightUserTest >> testRoleForAny [

	self assert: (LightUserRole for: 'any') name
			equals: LightUserRole anonymous name.
	
]

{ #category : #tests }
LightUserTest >> testRoleForEditor [

	self assert: (LightUserRole for: 'editor') name
			equals: LightUserRole editor name.
	
]

{ #category : #tests }
LightUserTest >> testSecondRole [

	| user |
	user := self emilio.

	user grant: LightUserRole admin.	
	self assert: user role equals: LightUserRole admin name.
	
]

{ #category : #tests }
LightUserTest >> testThirdRole [

	| user |
	user := self emilio.

	user grant: LightUserRole admin.	
	user grant: LightUserRole anonymous.
	self assert: user role equals: LightUserRole admin name.
	
]

{ #category : #tests }
LightUserTest >> testUserRead [

	| user |
	user := LightUser read: self regFileAnonymousLine.

	self assert: user role equals: LightUser anonymous role.
	self assert: user name equals: self emilio name.
	
]

{ #category : #tests }
LightUserTest >> testUsersFile [

	self assert: LightUser usersPath equals: LightVariables adminBase.
	self assert: LightUser usersFilename equals: 'users.txt'.

   self assert: (FileSystem root / LightUser usersPath / LightUser usersFilename) exists.
   self assert: (LightUser usersFile) exists.

]
