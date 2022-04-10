Class {
	#name : #TextPairUpdate,
	#superclass : #Object,
	#instVars : [
		'user',
		'from',
		'to',
		'time'
	],
	#category : #'Light-Model'
}

{ #category : #'as yet unclassified' }
TextPairUpdate class >> user: aUser from: oldText to: newText [
	^ self new
		user: aUser;
		from: oldText;
		to: newText;
		time: DateAndTime current;
		yourself.
		
]

{ #category : #accessing }
TextPairUpdate >> from [
	^ from
]

{ #category : #accessing }
TextPairUpdate >> from: anObject [
	from := anObject
]

{ #category : #accessing }
TextPairUpdate >> time [
	^ time
]

{ #category : #accessing }
TextPairUpdate >> time: anObject [
	time := anObject
]

{ #category : #accessing }
TextPairUpdate >> to [
	^ to
]

{ #category : #accessing }
TextPairUpdate >> to: anObject [
	to := anObject
]

{ #category : #accessing }
TextPairUpdate >> user [
	^ user
]

{ #category : #accessing }
TextPairUpdate >> user: anObject [
	user := anObject
]
