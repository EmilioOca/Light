Class {
	#name : #LCFSideChapterTree,
	#superclass : #PRWidget,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFSideChapterTree class >> descriptionBook [
	^ PRStructureDescription new
"		addCondition: (MACondition selector: #isBlog)
			labelled: 'Select a blog as source';
"		accessor: #book;
		label: 'Source';
		priority: 100;
		yourself
]

{ #category : #'as yet unclassified' }
LCFSideChapterTree class >> descriptionBookA [
	^ PRStructureDescription new
"		addCondition: (MACondition selector: #isBlog)
			labelled: 'Select a blog as source';
"		accessor: #bookA;
		label: 'Source';
		priority: 100;
		yourself
]

{ #category : #'as yet unclassified' }
LCFSideChapterTree class >> descriptionBookB [
	^ PRStructureDescription new
"		addCondition: (MACondition selector: #isBlog)
			labelled: 'Select a blog as source';
"		accessor: #bookB;
		label: 'Source';
		priority: 100;
		yourself
]

{ #category : #'as yet unclassified' }
LCFSideChapterTree class >> groupLabel [
	^ 'Pier Chapter Tree'
]

{ #category : #'as yet unclassified' }
LCFSideChapterTree class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFSideChapterTree class >> label [
	^ 'Chapter tree'
]

{ #category : #'as yet unclassified' }
LCFSideChapterTree >> Echapters [
	| items |
	items := self book chapters.
"	self numberOfPosts isNil
		ifFalse: [ items := items last: (self numberOfPosts min: items size) ].
"	^ items "reversed"
]

{ #category : #'as yet unclassified' }
LCFSideChapterTree >> book [

"	self context structure class == LCFBook ifTrue: [
		self context propertyAt: 'actualBook' put: self context structure.
	].
	"
	
"	self context user ifNil: ["
		^ ( self context structure  isKindOf: LCFBook ) ifTrue: [
			self context structure.
		] ifFalse: [
			self context structure class == LCFChapter ifTrue: [
			 	self context structure parent.
			] ifFalse: [
       			self context root childrenDecoration at: 'cicloc'.
			] 
		].
"	]."
"
	^ self context root propertyAt: 'actualBook' ifAbsent: [ self context root childrenDecoration at: 'ciclob'. ]."
]

{ #category : #accessing }
LCFSideChapterTree >> correctores [
	^ { 'admin'. 'corrector' }.
]

{ #category : #'as yet unclassified' }
LCFSideChapterTree >> effects [
	^ #( slideDown slideUp)
]

{ #category : #'as yet unclassified' }
LCFSideChapterTree >> renderContentOn: html [
	| book |
	html heading: 'Tiempos Litúrgicos'.
	html html: (book := self book) headTitle; break.
		
	book sectionsKeys do: [ :key |
		book times at: key ifPresent: [ :tiempos |
			tiempos renderContentOn: html using: self. ]
	].
]
