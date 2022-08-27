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
	self session ifLoggedIn: [ 
		(html image)
					title: 'editar';
					height: 16;
					url: LightLibrary / #editPng  ].
	html div with: [ html paragraph: pair fineSpa ].
]
