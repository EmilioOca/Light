Class {
	#name : #LightModelPoster,
	#superclass : #Object,
	#instVars : [
		'changes',
		'accurate',
		'link',
		'chapter'
	],
	#category : #'Light-Model'
}

{ #category : #'as yet unclassified' }
LightModelPoster class >> read: file [
	|  poster |
	
	poster := self new.
	
	poster link: file nextLine.
	poster accurate: (file nextLine includesSubstring: 'Accurate;').

	self assert: ( file nextLine isEmpty ).
	
	^ poster.
]

{ #category : #accessing }
LightModelPoster >> accurate [
	^ accurate ifNil: [ accurate := false ]
]

{ #category : #accessing }
LightModelPoster >> accurate: anObject [
	accurate := anObject
]

{ #category : #accessing }
LightModelPoster >> assurePosterImage [
	| file fd |
	
	( ( fd := FileDirectory uri: path ) fileExists: filename ) ifFalse: [
		[ 
			file  := fd fileNamed: filename.
			file binary.	
			file nextPutAll: (HTTPSocket httpGet: self link) contents. 
		] ensure: [file close].
	].
]

{ #category : #accessing }
LightModelPoster >> change: aText to: newText for: user [
	self changes add: (TextUpdate user: user from: aText to: newText ).

]

{ #category : #accessing }
LightModelPoster >> changes [
	^ changes ifNil: [ changes := OrderedCollection new ]
]

{ #category : #accessing }
LightModelPoster >> comments [
	^ OrderedCollection new.
]

{ #category : #accessing }
LightModelPoster >> filename [
	^ chapter chapterFileName, '.jpg'.


]

{ #category : #accessing }
LightModelPoster >> initializeWith: aChapter [
	chapter := aChapter

]

{ #category : #accessing }
LightModelPoster >> isMissing [
	^ self link = self missingText
]

{ #category : #accessing }
LightModelPoster >> latexOn: html [

	self isMissing ifFalse: [ 
		self assurePosterImage.
		html nextPutAll: '\begin{figure}[H]'; cr.
		html nextPutAll: '\centering'; cr.
		html nextPutAll: '\includegraphics[width=0.4\textwidth]{V:/LigthCameraFaith/Seaside-3.0.5-final/', self path, self filename,'}'; cr.
		html nextPutAll: '\label{fig:cicloa.christmasday}'; cr.
		html nextPutAll: '\end{figure}'; cr; cr.
	].
]

{ #category : #accessing }
LightModelPoster >> link [
	^ link ifNil: [ link := self missingText  ].
]

{ #category : #accessing }
LightModelPoster >> link: anObject [
	link := anObject
]

{ #category : #accessing }
LightModelPoster >> missingText [
	^ '<sin definir>'
]

{ #category : #accessing }
LightModelPoster >> path [
	| path |
	path := FileSystem root / chapter book path / 'jpg'.
	path exists ifFalse: [  	path createDirectory   ].
  ^ path pathString


]

{ #category : #accessing }
LightModelPoster >> renderEditControlOn: chapterView with: html [
	( chapterView shouldRenderControls and: [ self accurate not ] ) ifTrue: [ 
		(html anchor)
			callback: [ | oldText |
				oldText := self link.
				(chapterView call: ((MAContainer with: self descriptionEdit ) asComponentOn: self ) addValidatedForm)
					ifNotNil: [ self change: oldText to: self link for: chapterView context user ] ];
			with: [ 
				(html image)
					title: 'cambiar imagen';
					height: 16;
					url: LightLibrary / #editPng ]
	].
]

{ #category : #accessing }
LightModelPoster >> renderPosterOn: html with: chapterView [
	| links file chapter |

	self isMissing ifFalse: [
		chapterView class = LCFChapterHtmlView  ifTrue: [
			self assurePosterImage.
			html image altText: 'poster'; url: 'http://lcf.seasidehosting.st/', self path, self filename.
		] ifFalse: [
			html text: self link.
		]
	] ifTrue: [
		html text: '<Poster sin definir>'
	].

]

{ #category : #accessing }
LightModelPoster >> renderViewOn: html with: chapterView [

	(self shouldHide: chapterView) ifTrue: [ ^self ].
	
	html div: [ 
		self renderPosterOn: html with: chapterView.
		self renderEditControlOn: chapterView with: html.
		html break; break.
	].

]

{ #category : #accessing }
LightModelPoster >> shouldHide: aChapter [
	^ self isMissing and: [ aChapter context isLoggedIn not ] .

]

{ #category : #accessing }
LightModelPoster >> writeOn: html [.
	html nextPutAll: self link; cr. 
	self accurate ifTrue: [ 
		html nextPutAll: 'Accurate;'.
	].
	html cr; cr.

]
