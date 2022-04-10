Class {
	#name : #LCFSession,
	#superclass : #WASession,
	#instVars : [
		'origen',
		'lastAction'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #accessing }
LCFSession >> handleFiltered: aRequestContext [
	self lastAction: DateAndTime current.
	super handleFiltered: aRequestContext.

]

{ #category : #accessing }
LCFSession >> lastAction [
	^ lastAction

]

{ #category : #accessing }
LCFSession >> lastAction: time [ 
	lastAction := time.

]

{ #category : #accessing }
LCFSession >> origen [
	^ origen
]

{ #category : #accessing }
LCFSession >> origen: anObject [
	origen := anObject
]

{ #category : #accessing }
LCFSession >> start [
	self origen: ( self requestContext request headers at: 'x-forwarded-for' ifAbsent: 'local').
	super start.

"
	self origen: (self requestContext request headers at: 'x-forwarded-for' ifAbsent: '').
"

]
