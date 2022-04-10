Class {
	#name : #LigBookContentComponent,
	#superclass : #WAComponent,
	#instVars : [
		'holder'
	],
	#category : #'Light-Pages'
}

{ #category : #'instance creation' }
LigBookContentComponent class >> newHolded: aBookPage [
	^ self new holder: aBookPage;
			yourself 
]

{ #category : #'as yet unclassified' }
LigBookContentComponent >> holder: aLigCicloPage [ 
	holder := aLigCicloPage
]

{ #category : #rendering }
LigBookContentComponent >> renderChapterOn: html [

	html div: [ 
		self renderNavHeadingOn: html.
		html div: [ 
			self renderSingle: holder present date on: html.
			self renderLecturesOn: html.
			self renderSingle: holder present crest on: html.
		].
	].
	self renderSingle: holder present film on: html.
	self renderFilmDataOn: html.
	
	self renderSection: holder present outline 	id: 'outline' with: 'Outline' on: html.
	self renderSection: holder present comment 	id: 'comment' with: 'Comment' on: html.
	self renderGospelSectionOn: html.
	self renderIndexedSection: holder present keySequences id: 'keysequences' with: 'Some key sequences' on: html.
	self renderSection: holder present reflection id: 'reflection' with: 'For reflection and conversation' on: html.
	self renderSection: { holder present prayer } id: 'prayer' with: 'Prayer:' on: html.
]

{ #category : #rendering }
LigBookContentComponent >> renderContentOn: html [
    html tbsPanel beSuccess 
		with: [ html tbsPanelHeading: holder present title, ', ', holder present date spa.
			     html tbsPanelBody: [ self renderChapterOn: html ] ].
]

{ #category : #rendering }
LigBookContentComponent >> renderFilmDataOn: html [
	
	html paragraph: [
		holder present filmData lines do: [ :each |
			html text: each; break
		]
	]
		
]

{ #category : #rendering }
LigBookContentComponent >> renderGospelSectionOn: html [
	
	self renderSectionHeading: 'gospel' with: 'Dialogue with the Gospel' on: html.
	html text: 'Focus:'.
	self renderSingle: holder present gospelFocus on: html.
	self renderMany: holder present gospel on: html.
]

{ #category : #rendering }
LigBookContentComponent >> renderIndexedSection: section id: id with: head on: html [

	self renderSectionHeading: id with: head on: html.
	section  doWithIndex: [ :paragraph :idx | 
		html div: [ html text: idx printString, '. ', paragraph eng; 	break ].
	].
]

{ #category : #rendering }
LigBookContentComponent >> renderLecturesOn: html [
	html paragraph: [
		holder present lectures lines do: [ :each |
			html text: each; break
		]
	]
		
]

{ #category : #rendering }
LigBookContentComponent >> renderMany: section on: html [
	section do: [ :each | self renderSingle: each  on: html ].
]

{ #category : #rendering }
LigBookContentComponent >> renderNavHeadingOn: html [
	html paragraph: 'Nav heading...'
]

{ #category : #rendering }
LigBookContentComponent >> renderSection: section id: id with: head on: html [

	self renderSectionHeading: id with: head on: html.
	self renderMany: section on: html.
]

{ #category : #rendering }
LigBookContentComponent >> renderSectionHeading: id with: text on: html [
	(html heading) level: 4; id: id; with: text.

]

{ #category : #rendering }
LigBookContentComponent >> renderSingle: pair on: html [.
	html render: ( LightPairComponent new: pair )

]
