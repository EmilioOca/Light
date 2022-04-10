Class {
	#name : #TextPair,
	#superclass : #Object,
	#instVars : [
		'eng',
		'spa',
		'comments',
		'changes',
		'decorators'
	],
	#category : #'Light-Model'
}

{ #category : #constants }
TextPair class >> emptySpa [
	^ '<sin traducción>' 
]

{ #category : #'instance creation' }
TextPair class >> read: aStream [ 
	^ self new initializeWith: aStream nextLine and: aStream
]

{ #category : #'instance creation' }
TextPair class >> read: aLine and: aStream [ 
	^ self new initializeWith: aLine and: aStream
]

{ #category : #constants }
TextPair class >> undefinedContent [
	^ '<sin definir>'
]

{ #category : #changes }
TextPair >> change: aText to: newText for: user [
	self changes add: (TextPairUpdate user: user from: aText to: newText ).

]

{ #category : #accessing }
TextPair >> changes [
	^ changes ifNil: [ changes := OrderedCollection new ]
]

{ #category : #accessing }
TextPair >> changes: anObject [
	changes := anObject
]

{ #category : #accessing }
TextPair >> comments [
	^ comments
]

{ #category : #accessing }
TextPair >> comments: anObject [
	comments := anObject
]

{ #category : #accessing }
TextPair >> eng [
	^ eng
]

{ #category : #accessing }
TextPair >> eng: anObject [
	eng := anObject
]

{ #category : #accessing }
TextPair >> fineSpa [
	^ self spa ifEmpty: [ self class emptySpa ].
]

{ #category : #initalize }
TextPair >> initializeWith: firstLine and: aStream [ 
	| lastLine |
	eng := firstLine.
	self assert: eng notEmpty.
	spa := aStream nextLine.
	decorators := aStream nextLine substrings collect: [ :each | each asSymbol ].
	lastLine := aStream nextLine.
	( TextPairComment accepts: lastLine ) ifTrue: [ 
		comments := TextPairComment from: lastLine.
		lastLine := aStream nextLine.
	] ifFalse: [ 
		comments := OrderedCollection new 
	].
	self assert: lastLine isEmpty.
]

{ #category : #decorations }
TextPair >> isDecoratedWith: aSymbol [
	^ decorators includes: aSymbol
]

{ #category : #accessing }
TextPair >> isMissing [ 
	^ self eng = self class undefinedContent
]

{ #category : #accessing }
TextPair >> spa [
	^ spa
]

{ #category : #accessing }
TextPair >> spa: anObject [
	spa := anObject
]

{ #category : #projectors }
TextPair >> wordCount [
	^ self eng substrings size .
	

]

{ #category : #projectors }
TextPair >> wordsPendant [
	^ self spa isEmpty ifTrue: [ self wordCount ] ifFalse: [ 0 ].
	
]

{ #category : #storing }
TextPair >> writeOn: aWriteStream [ 
	aWriteStream 
		nextPutAll: eng; cr;
		nextPutAll: spa; cr.
		
	decorators do: [ :each | aWriteStream nextPutAll: each asString ]
				 separatedBy: [ aWriteStream nextPut: $  ].
	aWriteStream cr.
	TextPairComment write: comments on: aWriteStream.
	aWriteStream cr
	
]
