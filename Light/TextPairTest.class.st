Class {
	#name : #TextPairTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #setup }
TextPairTest >> emptyStream [
	^ '

Locked Accurate

<nextPair>' readStream
]

{ #category : #setup }
TextPairTest >> helloHolaCommentedStream [
	^ ('Hello
Hola

', TextPairCommentTest niceComentsLine, '

') readStream
]

{ #category : #setup }
TextPairTest >> helloHolaStream [
	^ 'Hello
Hola


' readStream
]

{ #category : #setup }
TextPairTest >> helloStream [
	^ 'Hello

Locked Accurate

<nextPair>' readStream
]

{ #category : #setup }
TextPairTest >> shortStream [
	^ 'Hello

Locked Accurate
<nextPair>' readStream
]

{ #category : #tests }
TextPairTest >> testLoadDecorators [
	| pair |
	pair := TextPair read: self helloStream.
	self assert: ( pair isDecoratedWith: #Locked ).
	self assert: ( pair isDecoratedWith: #Accurate ).
]

{ #category : #tests }
TextPairTest >> testLoadEnglish [
	| pair |
	pair := TextPair read: self helloHolaStream.
	self assert: pair eng equals: 'Hello'.
	self assert: pair spa equals: 'Hola'.
	self assert: pair fineSpa equals: 'Hola'
]

{ #category : #tests }
TextPairTest >> testLoadFailsOnEmpty [
	| pair |
	self should: [ pair := TextPair read: self emptyStream ]
         raise: Error.
]

{ #category : #tests }
TextPairTest >> testLoadFailsOnNotSeparatingLine [
	| pair |
	self should: [ pair := TextPair read: self shortStream ]
         raise: Error.
]

{ #category : #tests }
TextPairTest >> testLoadJustEnglish [
	| pair |
	pair := TextPair read: self helloStream.
	self assert: pair eng equals: 'Hello'.
	self assert: pair spa equals: ''.
	self assert: pair fineSpa equals: TextPair emptySpa
]

{ #category : #tests }
TextPairTest >> testLoadJustTheRequiredLines [
	| stream |
	stream := self helloStream.
	TextPair read: stream.
	self assert: stream nextLine equals: '<nextPair>'

]

{ #category : #tests }
TextPairTest >> testLoadWithCommentsLines [
	| stream pair |
	stream := self helloHolaCommentedStream.
	pair := TextPair read: stream.
	self assert: pair comments size equals: 2.
	self assert: pair comments first user equals: 'yo'.

]

{ #category : #tests }
TextPairTest >> testWordCounting [
	| pair |
	pair := TextPair read: self helloHolaStream.
	self assert: pair wordCount equals: 1.
	self assert: pair wordsPendant equals: 0.
	
	pair := TextPair read: self helloStream.
	self assert: pair wordCount equals: 1.
	self assert: pair wordsPendant equals: 1.
]

{ #category : #tests }
TextPairTest >> testWrite [
	| pair text |
	text := 'Hey!
ey!
Aaa Bbb

'.
	pair := TextPair read: text readStream.
	self assert: ( String streamContents: [ :stream | pair writeOn: stream ] ) 
		  equals: text
]

{ #category : #tests }
TextPairTest >> testWriteWithComments [
	| pair text |
	text := self helloHolaCommentedStream.
	pair := TextPair read: text.
	self assert: ( String streamContents: [ :stream | pair writeOn: stream ] ) 
		  equals: text contents
]
