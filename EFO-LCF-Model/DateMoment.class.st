Class {
	#name : #DateMoment,
	#superclass : #Object,
	#instVars : [
		'date',
		'expression'
	],
	#classInstVars : [
		'previousMoment'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
DateMoment class >> findDateOn: aLine [
	| matcher moment |
	
	moment := self new.
	
	matcher := RxMatcher forString: '.*(Date<(\d\d.\d\d.\d\d\d\d)>);.*'.
	(matcher matches: aLine) ifTrue: [
		moment date: (previousMoment := (matcher subexpression: 3) asDate).
		moment expression: (matcher subexpression: 2).
		^ moment.
	].

	matcher := RxMatcher forString: '.*(Date<(\d\d.\d\d)>);.*'.
	(matcher matches: aLine) ifTrue: [
		previousMoment :=  ((matcher subexpression: 3), '.', DateAndTime current year printString) asDate.
		previousMoment < DateAndTime current ifTrue: [ 
			previousMoment :=  ((matcher subexpression: 3), '.', (DateAndTime current year + 1) printString) asDate.
		].
		moment date: previousMoment.
		moment expression: (matcher subexpression: 2).
		^ moment.
	].

	matcher := RxMatcher forString: '.*(Date<\+(\d)>);.*'.
	(matcher matches: aLine) ifTrue: [
		moment date: (previousMoment := previousMoment addDays: (matcher subexpression: 3) asNumber).
		moment expression: (matcher subexpression: 2).
		^ moment.
	].

	previousMoment ifNotNil: [
		moment date: (previousMoment := previousMoment addDays: 7).
	].

	^ moment

	
]

{ #category : #'as yet unclassified' }
DateMoment class >> meses [
	^ { 'Ene'. 'Feb'. 'Mar'. 'Abr'. 'May'. 'Jun'. 'Jul'. 'Ago'. 'Sep'. 'Oct'. 'Nov'. 'Dic' }
	
	
]

{ #category : #'as yet unclassified' }
DateMoment class >> on: aLine [
	^ self findDateOn: aLine.
	
]

{ #category : #'as yet unclassified' }
DateMoment class >> resetMoment [
	previousMoment := nil.
	
	
]

{ #category : #comparing }
DateMoment >> >= aDate [ 
	^ self date ifNil: [
		false
	] ifNotNil: [
		self date >= aDate.
	]
]

{ #category : #'as yet unclassified' }
DateMoment >> date [
	^ date
]

{ #category : #'as yet unclassified' }
DateMoment >> date: aDate [
	date := aDate
]

{ #category : #'as yet unclassified' }
DateMoment >> expression [
	^ expression
]

{ #category : #'as yet unclassified' }
DateMoment >> expression: anExp [
	expression := anExp
]

{ #category : #comparing }
DateMoment >> prettyHeadingFor: current [
	^ (( current = self date ) ifTrue: [
		'Hoy '
	] ifFalse: [
		'Próxima Fiesta '
	]), self prettyMoment
]

{ #category : #'as yet unclassified' }
DateMoment >> prettyMoment [
	^ self date ifNil: [ ''
	] ifNotNil: [ 
		' (', self date dayOfMonth printString,  ' de ', ( self class meses at: self date monthIndex), ')'.
	]
]

{ #category : #'as yet unclassified' }
DateMoment >> writeOn: aStream [
	self expression ifNotNil: [
		aStream nextPutAll: ' ', self expression, ';'.
	].
]
