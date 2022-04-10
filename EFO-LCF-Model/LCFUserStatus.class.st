Class {
	#name : #LCFUserStatus,
	#superclass : #PRWidget,
	#category : #'EFO-LCF-Model'
}

{ #category : #accessing }
LCFUserStatus class >> descriptionBook [
	^ PRStructureDescription new
"		addCondition: (MACondition selector: #isBlog)
			labelled: 'Select a blog as source';
"		accessor: #book;
		label: 'Source';
		priority: 100;
		yourself
]

{ #category : #accessing }
LCFUserStatus class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFUserStatus >> renderContentOn: html [
	self renderUser: html.


]

{ #category : #'as yet unclassified' }
LCFUserStatus >> renderUser: html [
	html text: ( 
		self context isLoggedIn 
			ifTrue: [ self context user name, ' (', self context user group name, ')' ]
			ifFalse: [ 'Visitante' ] )

]
