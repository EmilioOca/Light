Class {
	#name : #LigSideTreeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'holder',
		'timeTree'
	],
	#category : #'Light-Pages'
}

{ #category : #'instance creation' }
LigSideTreeComponent class >> newHolded: aBookPage [
	^ self new holder: aBookPage;
			yourself 
]

{ #category : #'as yet unclassified' }
LigSideTreeComponent >> holder [
	^ holder
]

{ #category : #rendering }
LigSideTreeComponent >> holder: aLigCicloPage [ 
	holder := aLigCicloPage
]

{ #category : #rendering }
LigSideTreeComponent >> renderChapter: chapter on: html [ 
	html text: chapter title.
	html break.
	html anchor callback:[ holder present: chapter ];
		title: (chapter date spa, chapter moment prettyMoment );
		with: [ html html: chapter date spa, chapter moment prettyMoment ].
	html div
		class: 'summary';
		with: [ html html: '(', chapter film eng, ')' ]
						
]

{ #category : #rendering }
LigSideTreeComponent >> renderContentOn: html [
 	html render: self timeTree.   

]

{ #category : #rendering }
LigSideTreeComponent >> timeTree [
	
"	^ timeTree ifNil: [ "
		timeTree := TBSAccordion new.
		holder book times keysAndValuesDo: [ :section :time |
			timeTree add: [ :html | 
				html orderedList with: [ 
					time chapters do: [ :chapter | 
						html listItem: [ self renderChapter: chapter on: html ]
					]
				]
			] 
			title: time key
		].
"	]"
	^ timeTree
 
]
