Class {
	#name : #TransPair,
	#superclass : #Object,
	#instVars : [
		'eng',
		'spa',
		'freezed',
		'comments',
		'changes',
		'accurate',
		'anchored',
		'blind'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
TransPair class >> descriptionEng [
	^ MAStringDescription new
		parameterName: 'eng';
"		label: 'version en ingles: ';"
		accessor: #eng;
		beReadonly;
		yourself
]

{ #category : #'as yet unclassified' }
TransPair class >> descriptionSpa [
	^ MAMemoDescription new
		parameterName: 'spa';
"		label: 'castellana: ';"
		accessor: #googledSpa;
		yourself
]

{ #category : #'as yet unclassified' }
TransPair class >> on: engText and: spaText [
	self assert: engText isEmpty not.
	^ self new eng: engText; spa: spaText; yourself.
]

{ #category : #'as yet unclassified' }
TransPair class >> read: file [
	^ self read: file nextLine and: file.
]

{ #category : #'as yet unclassified' }
TransPair class >> read: firstLine and: file [
	| line me commands |

	me := self on: firstLine and: file nextLine.
					
	commands := file nextLine.
	me freezed: (commands includesSubstring: 'Locked;').
	me accurate: (commands includesSubstring: 'Accurate;').
	me comments: (PairComment from: commands).
	
	self assert: ( file nextLine isEmpty ).
	me anchored: true.
	^ me.
]

{ #category : #accessing }
TransPair >> accurate [
	^ accurate ifNil: [ accurate := false ]
]

{ #category : #accessing }
TransPair >> accurate: anObject [
	accurate := anObject
]

{ #category : #accessing }
TransPair >> accurateOn: aChapterView [
	^ self accurate or: [ aChapterView chapter freezed ]
]

{ #category : #accessing }
TransPair >> anchored [
	^ anchored
]

{ #category : #accessing }
TransPair >> anchored: anObject [
	anchored := anObject
]

{ #category : #accessing }
TransPair >> blind [
	^ blind ifNil: [ blind := false ]
]

{ #category : #accessing }
TransPair >> blind: anObject [
	blind := anObject
]

{ #category : #accessing }
TransPair >> change: aText to: newText for: user [
	self changes add: (TextUpdate user: user from: aText to: newText ).

]

{ #category : #accessing }
TransPair >> changes [
	^ changes ifNil: [ changes := OrderedCollection new ]
]

{ #category : #accessing }
TransPair >> comments [
	^ comments ifNil: [ comments := OrderedCollection new ]
]

{ #category : #accessing }
TransPair >> comments: someComments [
	comments := someComments
]

{ #category : #accessing }
TransPair >> correctores [
	^ { 'admin'. 'corrector' }.
]

{ #category : #accessing }
TransPair >> descriptionEngEdit [
	^ MAMemoDescription new
 		selectorAccessor: #eng;
 		label: 'Texto a ser traducido';
		lineCount: 5;
 		priority: 5;
		propertyAt: 'width' put: 10;
		yourself
]

{ #category : #accessing }
TransPair >> descriptionMyEdit [
	^ self description copy
 		add: (MAStringDescription new
 		selectorAccessor: #google;
 		label: 'google';
 		priority: 5;
 		beReadonly;
 		yourself);
 	yourself
]

{ #category : #accessing }
TransPair >> eng [
	^ eng
]

{ #category : #accessing }
TransPair >> eng: anObject [
	eng := anObject
]

{ #category : #accessing }
TransPair >> fineSpa [
	^ self spa ifEmpty: [ '<sin traducción>' ].

]

{ #category : #accessing }
TransPair >> freezed [
	^ freezed ifNil: [ freezed := false ]
]

{ #category : #accessing }
TransPair >> freezed: anObject [
	freezed := anObject
]

{ #category : #accessing }
TransPair >> freezedOn: aChapterView [
	^ self freezed or: [ aChapterView chapter freezed ]
]

{ #category : #accessing }
TransPair >> google [

	^ GoogleTranslate new translate: self eng   
]

{ #category : #accessing }
TransPair >> googledSpa [
	^ self spa ifEmpty: [ self google ].

]

{ #category : #accessing }
TransPair >> googledSpa: aText [
	self spa: aText

]

{ #category : #render }
TransPair >> isMissing [ 
	^ self eng = '<sin definir>'

]

{ #category : #render }
TransPair >> latex [
	^ self texSource texScape
]

{ #category : #render }
TransPair >> latexOn: aStream [
	self  isMissing ifFalse: [
		aStream nextPutAll: self latex; 
			nextPutAll: '\\'; cr; cr.
	].

]

{ #category : #render }
TransPair >> renderAccurateEditControlOn: chapterView with: html anchor: anchor [
	( chapterView shouldRenderControls and: [ (self accurateOn: chapterView) not ] ) ifTrue: [ 
		(html anchor)
			callback: [ | oldText |
				oldText := self eng.
				(chapterView call: ((MAContainer with: self descriptionEngEdit ) asComponentOn: self ) addValidatedForm)
					ifNotNil: [ self change: oldText to: self eng for: chapterView context user ].
				self anchored ifTrue: [ chapterView context session jumpToAnchor: anchor ]. 
			];
			with: [ 
				(html image)
					title: 'editar';
					height: 16;
					url: PRBlueprintLibrary / #correctPng ]
	].
]

{ #category : #render }
TransPair >> renderControlsOn: chapterView with: html anchor: anchor [
	(self isMissing not and: [ chapterView shouldRenderControls ])
		ifTrue: [ 
"			self renderEditControlOn: chapterView with: html anchor: anchor."
			self renderLockControlOn: chapterView with: html fragment: anchor.
			self renderFlagboxOn: chapterView with: html.
			html break ]
]

{ #category : #render }
TransPair >> renderEditControlOn: chapterView with: html anchor: anchor [
	( chapterView shouldRenderControls and: [ (self freezedOn: chapterView) not ] ) ifTrue: [ 
		(html anchor)
			callback: [ | oldText |
				oldText := self fineSpa.
				(chapterView call: (self descriptionMyEdit asComponentOn: self) addValidatedForm)
					ifNotNil: [ self change: oldText to: self spa for: chapterView context user ].
				self anchored ifTrue: [ chapterView context session jumpToAnchor: anchor ]. 
			];
			with: [ 
				(html image)
					title: 'editar';
					height: 16;
					url: PRBlueprintLibrary / #editPng ]
	].
]

{ #category : #render }
TransPair >> renderEng: html on: chapterView anchor: anchor [
	html div: [ html text: self eng, ' '.
			self renderAccurateEditControlOn: chapterView with: html anchor: anchor.
			html break].

]

{ #category : #render }
TransPair >> renderFlagboxOn: chapter with: html [
	| id |
	html div
		id: (id := html nextId);
		script: (html jQuery new dialog
			html: (FlagDialog on: self from: chapter context user) ;
			title: 'Comentarios al Corrector';
			resizable: true;
			closeOnEscape: true;
			modal: true;
			closeText: '';
			width: 500).
	html anchor
		onClick: (html jQuery id: id) dialog open;
		with: [ (html image)
					title: 'Comentarios al corrector';
"					height: 20;"
					url: PRBlueprintLibrary / #flagredPng ]
				
				"'Open Lightbox'"
]

{ #category : #render }
TransPair >> renderLockControlOn: chapterView with: html fragment: anchor [
	(self correctores includes: chapterView context user group name) ifTrue: [ 
		chapterView chapter freezed ifTrue: [
						(html image)
							title: 'edición deshabilitada para este capítulo';
							height: 20;
							url: PRBlueprintLibrary / #lockclosedgrayPng
		] ifFalse: [
			self freezed ifTrue: [ 
				(html anchor)
					callback: [ self freezed: false ];
					fragment: (self anchored ifTrue: [ anchor ] ifFalse: [ nil ] );
					with: [ 
						(html image)
							title: 'desbloquear edición';
							height: 20;
							url: PRBlueprintLibrary / #lockopenPng ]
			] ifFalse: [ 
				(html anchor)
					callback: [ self freezed: true ];
					fragment: (self anchored ifTrue: [ anchor ] ifFalse: [ nil ] );
					with: [ 
						(html image)
							title: 'bloquear edición';
							height: 20;
							url: PRBlueprintLibrary / #lockclosedPng ]
			]
		]
	]
]

{ #category : #render }
TransPair >> renderSpa: chapterView with: html anchor: anchor [ 
	self isMissing ifFalse: [ 
		(html div) class: 'change-text';
				with: [ html emphasis with: self fineSpa, ' '.
					self renderEditControlOn: chapterView with: html anchor: anchor ].
	].

]

{ #category : #render }
TransPair >> renderViewOn: html with: chapterView [
	| anchor |
	
	(self shouldHide: chapterView) ifTrue: [ ^self ].
	
	html div id: (anchor := html nextId);
		with: [ 
		self renderEng: html on: chapterView anchor: anchor.
		self renderSpa: chapterView with: html anchor: anchor.
		self renderControlsOn: chapterView with: html anchor: anchor.
		html break 
	].

]

{ #category : #render }
TransPair >> shouldHide: aChapter [
	^ self blind or: [ 
		self isMissing and: [ aChapter context isLoggedIn not ]  ].
	

]

{ #category : #accessing }
TransPair >> spa [
	^ spa
]

{ #category : #accessing }
TransPair >> spa: anObject [
	spa := anObject inline.

]

{ #category : #render }
TransPair >> texSource [
	^ self spa ifEmpty: [ self eng ]
]

{ #category : #accessing }
TransPair >> unanchored [
	anchored := false
]

{ #category : #accessing }
TransPair >> wordCount [
	^ self eng subStrings  size .
	

]

{ #category : #accessing }
TransPair >> wordsPendant [
	^ self spa isEmpty ifTrue: [ self wordCount ] ifFalse: [ 0 ].
	

]

{ #category : #render }
TransPair >> writeOn: file [ 
	file nextPutAll: self eng.
	file nextPutAll: '
'.
	file nextPutAll: self spa.
	file nextPutAll: '
'.
	self freezed ifTrue: [ 
		file nextPutAll: 'Locked;'.
	].
	self accurate ifTrue: [ 
		file nextPutAll: 'Accurate;'.
	].
	PairComment write: self comments on: file.
	
	file nextPutAll: '

'.

]
