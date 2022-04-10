Class {
	#name : #LightPairComponent,
	#superclass : #WAComponent,
	#instVars : [
		'pair'
	],
	#category : #'Light-Pages'
}

{ #category : #'instance creation' }
LightPairComponent class >> new: aTextPair [

	^ self new initialize: aTextPair
]

{ #category : #initialization }
LightPairComponent >> initialize: aTextPair [
	pair := aTextPair
]

{ #category : #initialization }
LightPairComponent >> renderContentOn: html [
	html paragraph: pair eng.
	html div with: [ html paragraph: pair fineSpa ].
]
