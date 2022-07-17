Class {
	#name : #LightVariables,
	#superclass : #Object,
	#classInstVars : [
		'rootPath'
	],
	#category : #Light
}

{ #category : #'as yet unclassified' }
LightVariables class >> adminBase [
	"self resourceBase "
	| path |
	path := FileSystem root / self rootPath / 'admin'.
	path exists ifFalse: [  	path createDirectory   ].
  ^ path pathString


]

{ #category : #'as yet unclassified' }
LightVariables class >> resourceBase [
	"self resourceBase "
	| path |
	path := FileSystem root / self rootPath / 'res'.
	path exists ifFalse: [  	path createDirectory   ].
  ^ path pathString


]

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
