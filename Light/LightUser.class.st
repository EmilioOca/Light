Class {
	#name : #LightUser,
	#superclass : #Object,
	#instVars : [
		'name',
		'grants'
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

{ #category : #accessors }
LightUser >> grants [
	^ grants
]

{ #category : #accessors }
LightUser >> initialize [ 
	grants := SortedCollection with: LightUserRole anonymous
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
LightUser >> role [
	^ self grants last name
]
