Class {
	#name : #PRVisitorUserGroup,
	#superclass : #PRWidget,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
PRVisitorUserGroup class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
PRVisitorUserGroup >> renderContentOn: html [
	self renderUser: html.


]

{ #category : #'as yet unclassified' }
PRVisitorUserGroup >> renderUser: html [
	 self context isLoggedIn ifFalse: [ 
	 	html text: 'Visitante: '.
	].
]
