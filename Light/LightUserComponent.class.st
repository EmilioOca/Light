Class {
	#name : #LightUserComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'userName',
		'userPass'
	],
	#category : #'Light-Pages'
}

{ #category : #rendering }
LightUserComponent >> renderContentOn: html [

	html form: [
		html label: [ 	html text: 'Usuario: '.
							html textInput on: #userName of: self ].
		html break.
		html label: [ 	html text: 'Password '.
							html passwordInput on: #userPass of: self ].
		html break.
		html submitButton callback: [
			self answer: (self session registry userFor: self userName pass: self userPass ) ];
								text: 'Ingresar'.
	].		

]

{ #category : #rendering }
LightUserComponent >> user: aUser [
	user := aUser
]

{ #category : #rendering }
LightUserComponent >> userName [
	^ userName
]

{ #category : #rendering }
LightUserComponent >> userName: aUserName [
	userName := aUserName
]

{ #category : #rendering }
LightUserComponent >> userPass [
	^ userPass
]

{ #category : #rendering }
LightUserComponent >> userPass: aPass [
	userPass := aPass
]
