Class {
	#name : #LightUserRole,
	#superclass : #Object,
	#instVars : [
		'name',
		'priority'
	],
	#category : #'Light-Model'
}

{ #category : #'as yet unclassified' }
LightUserRole class >> admin [
	^ self new priority: 7 name: 'Admin'
]

{ #category : #'as yet unclassified' }
LightUserRole class >> anonymous [
	^ self new priority: 1 name: 'anonymous'
]

{ #category : #'as yet unclassified' }
LightUserRole class >> editor [
	^ self new priority: 2 name: 'Editor'
]

{ #category : #accesors }
LightUserRole >> < another [ 
	 ^ self priority < another priority 
	
]

{ #category : #accesors }
LightUserRole >> <= another [ 
	 ^ self priority <= another priority 
	
]

{ #category : #accesors }
LightUserRole >> = another [ 
	 ^ self priority = another priority 
	
]

{ #category : #accesors }
LightUserRole >> hash [
	^ self priority hash
]

{ #category : #accesors }
LightUserRole >> name [
	^ name
]

{ #category : #access }
LightUserRole >> priority [
	^ priority 
]

{ #category : #initalize }
LightUserRole >> priority: aPriority name: aName [ 
	priority := aPriority .
	name := aName
]
