Class {
	#name : #TextUpdate,
	#superclass : #Object,
	#instVars : [
		'user',
		'from',
		'to',
		'time'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
TextUpdate class >> user: aUser from: oldText to: newText [
	^ self new
		user: aUser;
		from: oldText;
		to: newText;
		time: TimeStamp current;
		yourself.
]

{ #category : #accessing }
TextUpdate >> from [
	^ from
]

{ #category : #accessing }
TextUpdate >> from: anObject [
	from := anObject
]

{ #category : #accessing }
TextUpdate >> renderHtmlOn: html like: style [

	(html div) style: 'float: right;', style;
		with: [ html emphasis with: ( self time utcOffset: -3 hours ) printHttpFormat ].
	(html div) class: 'change-user';
		with: [ self user renderOn: html paragraph.].
	(html div) class: 'change-text';
		with: [ html emphasis with: self from ].
	 html break.
]

{ #category : #accessing }
TextUpdate >> time [
	^ time
]

{ #category : #accessing }
TextUpdate >> time: anObject [
	time := anObject
]

{ #category : #accessing }
TextUpdate >> to [
	^ to
]

{ #category : #accessing }
TextUpdate >> to: anObject [
	to := anObject
]

{ #category : #accessing }
TextUpdate >> user [
	^ user
]

{ #category : #accessing }
TextUpdate >> user: anObject [
	user := anObject
]
