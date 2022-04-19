Class {
	#name : #LigBookChapterComponent,
	#superclass : #WAComponent,
	#instVars : [
		'holder'
	],
	#category : #'Light-Pages'
}

{ #category : #'instance creation' }
LigBookChapterComponent class >> newHolded: aBookPage [
	^ self new holder: aBookPage;
			yourself 
]

{ #category : #rendering }
LigBookChapterComponent >> chapter [
	^ holder present
]

{ #category : #'as yet unclassified' }
LigBookChapterComponent >> holder [
	^ holder
]

{ #category : #'as yet unclassified' }
LigBookChapterComponent >> holder: aLigCicloPage [ 
	holder := aLigCicloPage
]

{ #category : #rendering }
LigBookChapterComponent >> renderChapterOn: html [
	html
		div: [ self renderNavHeadingOn: html.
			html
				div: [ self renderSingle: self chapter date on: html.
					self renderLecturesOn: html.
					self renderSingle: self chapter crest on: html ] ].
	self renderSingle: self chapter film on: html.
	self renderFilmDataOn: html.
	self renderSection: self chapter outline
		id: 'outline'
		with: 'Outline'
		on: html.
	self renderSection: self chapter comment
		id: 'comment'
		with: 'Comment'
		on: html.
	self renderGospelSectionOn: html.
	self renderIndexedSection: self chapter keySequences
		id: 'keysequences'
		with: 'Some key sequences'
		on: html.
	self renderSection: self chapter reflection
		id: 'reflection'
		with: 'For reflection and conversation'
		on: html.
	self renderSection: {self chapter prayer}
		id: 'prayer'
		with: 'Prayer:'
		on: html
]

{ #category : #rendering }
LigBookChapterComponent >> renderContentOn: html [
    html tbsPanel beSuccess 
		with: [ html tbsPanelHeading: holder present title, ', ', holder present date spa.
			     html tbsPanelBody: [ self renderChapterOn: html ] ].
]

{ #category : #rendering }
LigBookChapterComponent >> renderFilmDataOn: html [
	
	html paragraph: [
		holder present filmData lines do: [ :each |
			html text: each; break
		]
	]
		
]

{ #category : #rendering }
LigBookChapterComponent >> renderGospelSectionOn: html [
	
	self renderSectionHeading: 'gospel' with: 'Dialogue with the Gospel' on: html.
	html text: 'Focus:'.
	self renderSingle: holder present gospelFocus on: html.
	self renderMany: holder present gospel on: html.
]

{ #category : #rendering }
LigBookChapterComponent >> renderIndexedSection: section id: id with: head on: html [

	self renderSectionHeading: id with: head on: html.
	section  doWithIndex: [ :paragraph :idx | 
		html div: [ html text: idx printString, '. ', paragraph eng; 	break ].
	].
]

{ #category : #rendering }
LigBookChapterComponent >> renderLecturesOn: html [
	html paragraph: [
		holder present lectures lines do: [ :each |
			html text: each; break
		]
	]
		
]

{ #category : #rendering }
LigBookChapterComponent >> renderMany: section on: html [
	section do: [ :each | self renderSingle: each  on: html ].
]

{ #category : #rendering }
LigBookChapterComponent >> renderNavHeadingOn: html [
	html paragraph: [ 
		self renderNavOn: html chapter: self holder present previousChapter like: '<<'.
		html text: ' '.
		self renderNavOn: html chapter: self holder present nextChapter like: '>>' 
	].

]

{ #category : #rendering }
LigBookChapterComponent >> renderNavOn: html chapter: prev like: arrows [
	^ html anchor
		callback: [ self holder present: prev ];
		with:
			arrows , prev date spa , ', ' , prev film eng
				, prev moment prettyMoment , arrows
]

{ #category : #rendering }
LigBookChapterComponent >> renderSection: section id: id with: head on: html [

	self renderSectionHeading: id with: head on: html.
	self renderMany: section on: html.
]

{ #category : #rendering }
LigBookChapterComponent >> renderSectionHeading: id with: text on: html [
	(html heading) level: 4; id: id; with: text.

]

{ #category : #rendering }
LigBookChapterComponent >> renderSingle: pair on: html [.
	html render: ( LightPairComponent new: pair )

]
