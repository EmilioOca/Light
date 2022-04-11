Class {
	#name : #LightVariables,
	#superclass : #Object,
	#classInstVars : [
		'rootPath'
	],
	#category : #Light
}

{ #category : #'as yet unclassified' }
LightVariables class >> rootPath [
 ^ rootPath ifNil: [ '/home/emilio/develop/lcf' ]
]

{ #category : #'as yet unclassified' }
LightVariables class >> rootPath: aPath [
 ^ rootPath := aPath.
]

{ #category : #'as yet unclassified' }
LightVariables class >> sourceBase [
 ^ self rootPath, '/texts'
]
