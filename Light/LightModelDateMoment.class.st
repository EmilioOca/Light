Class {
	#name : #LightModelDateMoment,
	#superclass : #Object,
	#instVars : [
		'date',
		'expression'
	],
	#classInstVars : [
		'previousMoment'
	],
	#category : #'Light-Model'
}

{ #category : #'instance creation' }
LightModelDateMoment class >> findMomentOn: aLine [
	| matcher |
	
	matcher := RxMatcher forString: '.*(Date<(\d\d.\d\d.\d\d\d\d)>);.*'.
	(matcher matches: aLine) ifTrue: [
		^ self new: (matcher subexpression: 3) asDate
			    and: (matcher subexpression: 2).
	].

	matcher := RxMatcher forString: '.*(Date<(\d\d.\d\d)>);.*'.
	(matcher matches: aLine) ifTrue: [ | nextDate |
		nextDate := ((matcher subexpression: 3), '.', Date current year printString) asDate.
		nextDate < Date current ifTrue: [ 
			nextDate := nextDate addMonths: 12.
		].
		^ self new: nextDate and: (matcher subexpression: 2).
	].

	matcher := RxMatcher forString: '.*(Date<\+(\d)>);.*'.
	(matcher matches: aLine) ifTrue: [
		^ self new: ( previousMoment addDays: (matcher subexpression: 3) asNumber)
				and: (matcher subexpression: 2).
	].

	(aLine includesSubstring: 'Date<') ifTrue: [  
		self signal.
	].

	previousMoment ifNil: [ 
		self signal.
	].

	^ self new: (previousMoment addDays: 7) and: ''.



	
]

{ #category : #'as yet unclassified' }
LightModelDateMoment class >> meses [
	^ { 'Ene'. 'Feb'. 'Mar'. 'Abr'. 'May'. 'Jun'. 'Jul'. 'Ago'. 'Sep'. 'Oct'. 'Nov'. 'Dic' }
	
	
]

{ #category : #'instance creation' }
LightModelDateMoment class >> new: aDate and: aToken [
	^ self new 
		date: aDate;
		expression: aToken;
		yourself 

	
]

{ #category : #'instance creation' }
LightModelDateMoment class >> on: aLine [
	| newMoment |
	newMoment := self findMomentOn: aLine.
	previousMoment := newMoment date.
	^ newMoment
	
	
]

{ #category : #'as yet unclassified' }
LightModelDateMoment class >> resetMoment [
	previousMoment := nil.
	
	
]

{ #category : #comparing }
LightModelDateMoment >> >= aDate [ 
	^ self date ifNil: [
		false
	] ifNotNil: [
		self date >= aDate.
	]
]

{ #category : #'as yet unclassified' }
LightModelDateMoment >> date [
	^ date
]

{ #category : #'as yet unclassified' }
LightModelDateMoment >> date: aDate [
	date := aDate
]

{ #category : #'as yet unclassified' }
LightModelDateMoment >> expression [
	^ expression
]

{ #category : #'as yet unclassified' }
LightModelDateMoment >> expression: anExp [
	expression := anExp
]

{ #category : #comparing }
LightModelDateMoment >> prettyHeadingFor: current [
	^ (( current = self date ) ifTrue: [
		'Hoy '
	] ifFalse: [
		'Próxima Fiesta '
	]), self prettyMoment
]

{ #category : #'as yet unclassified' }
LightModelDateMoment >> prettyMoment [
	^ self date ifNil: [ ''
	] ifNotNil: [ 
		' (', self date dayOfMonth printString,  ' de ', ( self class meses at: self date monthIndex), ')'.
	]
]

{ #category : #'as yet unclassified' }
LightModelDateMoment >> writeOn: aStream [
	self expression ifNotEmpty: [
		aStream nextPutAll: ' ', self expression, ';'.
	].
]
