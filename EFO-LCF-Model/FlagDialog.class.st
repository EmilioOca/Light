Class {
	#name : #FlagDialog,
	#superclass : #WAComponent,
	#instVars : [
		'target',
		'comm',
		'user'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #creation }
FlagDialog class >> on: aPair from: aUser [ 
	^ self new target: aPair; user: aUser; yourself.
]

{ #category : #'as yet unclassified' }
FlagDialog >> initialize [

	super initialize.
	comm := 'algo'.

]

{ #category : #'as yet unclassified' }
FlagDialog >> renderComments: html [

	self target comments reverseDo: [ :comment | 
		comment comment renderOn: (	html paragraph class: 'flag-comment-content').
		comment user renderOn: (html paragraph class: 'flag-comment-user').
	].

]

{ #category : #'as yet unclassified' }
FlagDialog >> renderContentOn: html [

	html paragraph: 'Que desea informar o sugerir al corrector?'.
	html form: [ 
	html div: [ 
	html textArea
			style: 'width: 405px; height: 100px;';
"			script: (html jQuery this triggerFocus);
			value: '';
			on: #comm of: self;
"			callback: [ :value | 
				self target comments add: (PairComment new: value from: self user )
				];
			yourself.
	html submitButton
			style: 'text-align: right;';
"			disabled: aChange isEnabled not;"
"			callback: [ Transcript show: ('<',self target printString, '>'); cr; flush];"
"			on: #accept of: self;"
			with: 'Agregar';
			yourself.
	].
	].
	html break.
	html div id: 'flag-dialog-comments';
		with: [ self renderComments: html ].
		
]

{ #category : #'as yet unclassified' }
FlagDialog >> selectors [
	^ #(initialize renderContentOn:)
]

{ #category : #'as yet unclassified' }
FlagDialog >> style [
	^ '#count { margin: 0 0.5em; }'
]

{ #category : #accessing }
FlagDialog >> target [
	^ target
]

{ #category : #accessing }
FlagDialog >> target: atarget [
	target := atarget
]

{ #category : #'as yet unclassified' }
FlagDialog >> title [
	^ 'Counting Up and Down'
]

{ #category : #'as yet unclassified' }
FlagDialog >> url [
	^ nil
]

{ #category : #accessing }
FlagDialog >> user [
	^ user
]

{ #category : #accessing }
FlagDialog >> user: aUser [
	user := aUser
]
