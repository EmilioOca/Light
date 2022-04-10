Class {
	#name : #LCFBookView,
	#superclass : #PRDefaultView,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFBookView >> renderContentOn: html [
"	Transcript show: ('render! ', self context structure name, ', user: ', self context user printString); 
		cr; flush."
	self context user ifNotNil: [
		self context user propertyAt: 'actualBook' put: self context structure.
	].

	super renderContentOn: html
]
