Class {
	#name : #LightUserComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user'
	],
	#category : #'Light-Pages'
}

{ #category : #rendering }
LightUserComponent >> renderContentOn: html [
	html paragraph: user name.
	html paragraph: user role.
		
	html tbsForm beInline; with: [
		html tbsFormGroup: [ 
			html label for: 'exampleInputEmail1'; class: 'sr-only'; with: 'Email address'.
			html textInput tbsFormControl; id: 'exampleInputEmail1'; placeholder: 'Enter email'.
			html space].

		html tbsFormGroup: [ 
			html label for: 'exampleInputPassword2'; class: 'sr-only'; with: 'Password'.
			html passwordInput tbsFormControl id: 'exampleInputPassword2'; placeholder: 'Password'.
			html space]. 
		
		 ].


]

{ #category : #rendering }
LightUserComponent >> user: aUser [
	user := aUser
]
