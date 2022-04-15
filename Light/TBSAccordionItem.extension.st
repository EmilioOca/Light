Extension { #name : #TBSAccordionItem }

{ #category : #'*Light' }
TBSAccordionItem class >> on: aComponentOrOneArgumentBlock title: aString in: anAccordion [

	^(self new)
		componentOrBlock: aComponentOrOneArgumentBlock;
		title: aString;
		accordion: anAccordion;
		isCollapsed: true;
		yourself
]
