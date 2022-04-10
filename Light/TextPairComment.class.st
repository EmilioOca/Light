Class {
	#name : #TextPairComment,
	#superclass : #Object,
	#instVars : [
		'comment',
		'user'
	],
	#category : #'Light-Model'
}

{ #category : #regex }
TextPairComment class >> accepts: aLine [
	^ self lineMatcher matches: aLine
]

{ #category : #'instance creation' }
TextPairComment class >> from: aLine [
	| matcher |
	matcher := self lineMatcher.
	^ (matcher matches: aLine)
		ifTrue: [ self fromTokens: (matcher subexpression: 2) ]  
		ifFalse: [ self signal ] 



]

{ #category : #'instance creation' }
TextPairComment class >> fromTokens: aLine [
	| matcher |
	
	matcher := RxMatcher forString: self tokenRegex.
	
	^ matcher matchesIn: aLine collect: [ :match | 
		self new comment: (matcher subexpression: 2);
						user: (matcher subexpression: 3);
						yourself
	].

]

{ #category : #regex }
TextPairComment class >> lineMatcher [
	^ RxMatcher forString: self logStart, '((', self tokenRegex, ')+)', self logEnd.


]

{ #category : #regex }
TextPairComment class >> logEnd [
	^ '>'
]

{ #category : #regex }
TextPairComment class >> logStart [
	^ 'Comments<'
]

{ #category : #regex }
TextPairComment class >> tokenRegex [
	^ '<([^<>]+)\|([^<>]+)>'.

]

{ #category : #'instance creation' }
TextPairComment class >> write: comments on: aStream [

	comments ifNotEmpty: [
		aStream nextPutAll: self logStart .
		comments  do: [ :each | 
			each writeOn: aStream.
		].
		aStream nextPutAll: self logEnd.
		aStream cr.
	].

]

{ #category : #'as yet unclassified' }
TextPairComment >> comment [
	^ comment
]

{ #category : #'as yet unclassified' }
TextPairComment >> comment: aComment [
	comment := aComment inline
]

{ #category : #'as yet unclassified' }
TextPairComment >> user [
	^ user
]

{ #category : #'as yet unclassified' }
TextPairComment >> user: aUser [
	user := aUser

]

{ #category : #'as yet unclassified' }
TextPairComment >> writeOn: aStream [
	aStream nextPut: $<;
		nextPutAll: self comment;
		nextPut: $|;
		nextPutAll: self user;
		nextPut: $>.
]
