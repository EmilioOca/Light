Class {
	#name : #TextPairCommentTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #tests }
TextPairCommentTest class >> badLine1 [
   ^ TextPairComment logStart, '<un comentarioyo><otro comentario|vos>', TextPairComment logEnd
]

{ #category : #tests }
TextPairCommentTest class >> badLine2 [
   ^ TextPairComment logStart, '', TextPairComment logEnd
]

{ #category : #tests }
TextPairCommentTest class >> badLine3 [
   ^ TextPairComment logStart, 'un comentarioyo><otro comentario|vos>', TextPairComment logEnd
]

{ #category : #tests }
TextPairCommentTest class >> badLine4 [
   ^ TextPairComment logStart, '<un comentarioyo><otro comentario|vos>' 
]

{ #category : #tests }
TextPairCommentTest class >> niceComentsLine [
   ^ TextPairComment logStart, '<un comentario|yo><otro comentario|vos>', TextPairComment logEnd
]

{ #category : #tests }
TextPairCommentTest >> testAccpetsALine [
	
	self assert: ( TextPairComment accepts: self class niceComentsLine ).
	self deny: ( TextPairComment accepts: self class badLine1 ).
	self deny: ( TextPairComment accepts: self class badLine2 ).
	self deny: ( TextPairComment accepts: self class badLine3 ).
	self deny: ( TextPairComment accepts: self class badLine4 ).
	
]

{ #category : #tests }
TextPairCommentTest >> testFailsOnSpoiledLine [
	
	self should: [ TextPairComment from: self class badLine1 ] raise: Error.
	self should: [ TextPairComment from: self class badLine2 ] raise: Error.
	self should: [ TextPairComment from: self class badLine3 ] raise: Error.
	self should: [ TextPairComment from: self class badLine4 ] raise: Error.
]

{ #category : #tests }
TextPairCommentTest >> testLoadALine [
	| comments line |
	line := TextPairComment logStart, '<un comentario|yo><otro comentario|vos>', TextPairComment logEnd.
	comments := TextPairComment from: line.
	self assert: comments first user equals: 'yo'.
	self assert: comments last user equals: 'vos'.
]

{ #category : #tests }
TextPairCommentTest >> testLoadAndWrite [
	| comment text |
	text := '<un comentario|yo>'.
	comment := ( TextPairComment fromTokens: text ) first.
	self assert: ( String streamContents: [ :stream | comment writeOn: stream ] ) 
		  equals: text.
]

{ #category : #tests }
TextPairCommentTest >> testLoadAndWriteALine [
	| comments line |
	
	line := TextPairComment logStart, '<un comentario|yo><otro comentario|vos>', TextPairComment logEnd.
	comments := TextPairComment from: line.
	
	self assert: ( String streamContents: [ :stream | TextPairComment write: comments on: stream ] ) 
		  equals: line, Character cr asString
]

{ #category : #tests }
TextPairCommentTest >> testLoadAndWriteTwice [
	| comments text1 text2 |
	text1 := '<un comentario|yo>'.
	text2 := '<otro comentario|vos>'.
	comments := TextPairComment fromTokens: text1, text2.
	self assert: ( String streamContents: [ :stream | comments first writeOn: stream ] ) 
		  equals: text1.
	self assert: ( String streamContents: [ :stream | comments last writeOn: stream ] ) 
		  equals: text2.
]

{ #category : #tests }
TextPairCommentTest >> testWrite [
	| comment text |
	text := '<un comentario|yo>'.
	comment := TextPairComment new comment: 'un 
	comentario'; user: 'yo'; yourself.
	self assert: ( String streamContents: [ :stream | comment writeOn: stream ] ) 
		  equals: text
]
