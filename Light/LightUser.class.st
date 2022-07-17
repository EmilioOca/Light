Class {
	#name : #LightUser,
	#superclass : #Object,
	#instVars : [
		'name',
		'grants',
		'pass'
	],
	#category : #'Light-Model'
}

{ #category : #'instance creation' }
LightUser class >> anonymous [ 
	^ self new name: 'Visitor'
		yourself
]

{ #category : #'instance creation' }
LightUser class >> named: aName [ 
	^ self new name: aName
		yourself
]

{ #category : #'instance creation' }
LightUser class >> named: aName pass: aPass [
	^ self new name: aName;
					pass: aPass;
		yourself
]

{ #category : #creation }
LightUser class >> read: userLine [ 
	| tokens user |
	tokens := userLine substrings.
	
	user := self named: (tokens at: 1)
			pass:  (tokens at: 2).
	3 to: tokens size do: [ :index |
		user grant: (LightUserRole for: (tokens at: index))
	].

	^ user.
	
]

{ #category : #path }
LightUser class >> usersFile [
	^ FileSystem root / LightUser usersPath / LightUser usersFilename
]

{ #category : #path }
LightUser class >> usersFilename [
	^ 'users.txt'
]

{ #category : #path }
LightUser class >> usersPath [
	^ LightVariables adminBase.
]

{ #category : #accesors }
LightUser >> fits: aKey pass: aPass [
	^ self name asSymbol = aKey and:[ aPass = self pass ]
]

{ #category : #build }
LightUser >> grant: aLightUserRole [ 
	grants add: aLightUserRole 
]

{ #category : #accessors }
LightUser >> grants [

	^ grants ifEmpty: [ SortedCollection with: LightUserRole anonymous ] 
]

{ #category : #accessors }
LightUser >> initialize [ 
	grants := SortedCollection new
]

{ #category : #access }
LightUser >> name [
	^ name
]

{ #category : #accesors }
LightUser >> name: aName [
	name := aName 
]

{ #category : #accesors }
LightUser >> pass [
	^ pass
]

{ #category : #accessors }
LightUser >> pass: aString [ 
	pass := aString
]

{ #category : #accesors }
LightUser >> role [
	^ self grants last name
]

{ #category : #path }
LightUser >> writeOn: aWriteStream [ 
	aWriteStream 
		nextPutAll: self name; space;
		nextPutAll: self pass.
		
	grants ifNotEmpty: [ 
		grants do: [ :each | 
			aWriteStream space;
		                nextPutAll: each name ] ]
]
