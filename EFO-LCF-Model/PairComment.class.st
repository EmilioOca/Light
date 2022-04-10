Class {
	#name : #PairComment,
	#superclass : #Object,
	#instVars : [
		'comment',
		'user'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
PairComment class >> from: aLine [
"	^ self sectionsKeys detect: [ :section | aLine includesSubString: section ] ifNone: [ #Unknown ]."
	| matcher |
	matcher := RxMatcher forString: '.*Comment<((<[^<>]+\|[^<>]+>)+)>;.*'.
	^ (matcher matches: aLine)
		ifTrue: [ self fromTokens: (matcher subexpression: 2) ]  
		ifFalse: [ OrderedCollection new ] 



]

{ #category : #'as yet unclassified' }
PairComment class >> fromTokens: aLine [
	| matcher comments |
	
	comments := OrderedCollection new.
	matcher := RxMatcher forString: '<([^<>]+)\|([^<>]+)>'.
	
	matcher matchesIn: aLine do: [ :match | 
		comments add: (PairComment new: (matcher subexpression: 2) from: (matcher subexpression: 3) ).
	].

	^ comments.



]

{ #category : #'as yet unclassified' }
PairComment class >> new: comment from: user [

	^ self new 
		comment: comment; 
		user: user; yourself



]

{ #category : #'as yet unclassified' }
PairComment class >> write: comments on: file [

	comments isEmpty ifFalse: [
		file nextPutAll: 'Comment<'.
		comments  do: [ :each| 
			each writeOn: file.
		].
		file nextPutAll: '>;'
	].

]

{ #category : #'as yet unclassified' }
PairComment >> comment [
	^ comment
]

{ #category : #'as yet unclassified' }
PairComment >> comment: aComment [
	comment := aComment inline
]

{ #category : #'as yet unclassified' }
PairComment >> user [
	^ user
]

{ #category : #'as yet unclassified' }
PairComment >> user: aUser [
	user := aUser isString ifTrue: [
		(PRKernel instanceNamed: 'pier' )userNamed: aUser ifNone: [].
	] ifFalse: [
		aUser.
	]

]

{ #category : #'as yet unclassified' }
PairComment >> writeOn: file [
	file nextPut: $<;
		nextPutAll: self comment;
		nextPut: $|;
		nextPutAll: self user name;
		nextPut: $>.
]
