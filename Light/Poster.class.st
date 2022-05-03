Class {
	#name : #Poster,
	#superclass : #Object,
	#instVars : [
		'changes',
		'accurate',
		'link',
		'path',
		'filename'
	],
	#category : #'Light-Model'
}

{ #category : #'as yet unclassified' }
Poster class >> read: file [
	|  poster |
	
	poster := self new.
	
	poster link: file nextLine.
	poster accurate: (file nextLine includesSubstring: 'Accurate;').

	self assert: ( file nextLine isEmpty ).
	
	^ poster.
]

{ #category : #accessing }
Poster >> accurate [
	^ accurate ifNil: [ accurate := false ]
]

{ #category : #accessing }
Poster >> accurate: anObject [
	accurate := anObject
]

{ #category : #accessing }
Poster >> assurePosterImage [
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
Poster >> change: aText to: newText for: user [
	self changes add: (TextUpdate user: user from: aText to: newText ).

]

{ #category : #accessing }
Poster >> changes [
	^ changes ifNil: [ changes := OrderedCollection new ]
]

{ #category : #accessing }
Poster >> comments [
	^ OrderedCollection new.
]

{ #category : #accessing }
Poster >> descriptionEdit [
	^ MAStringDescription new
 		selectorAccessor: #link;
 		label: 'link a la imagen';
 		priority: 5;
		yourself
]

{ #category : #accessing }
Poster >> filename [
	^ filename
]

{ #category : #accessing }
Poster >> filename: anObject [
	filename := anObject
]

{ #category : #accessing }
Poster >> initializeWith: chapter [
	path := 'resources/', chapter chapterPath, '/jpg/'.

	filename := chapter chapterFileName, '.jpg'.

]

{ #category : #accessing }
Poster >> isMissing [
	^ self link = self missingText
]

{ #category : #accessing }
Poster >> latexOn: html [

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
Poster >> link [
	^ link ifNil: [ link := self missingText  ].
]

{ #category : #accessing }
Poster >> link: anObject [
	link := anObject
]

{ #category : #accessing }
Poster >> missingText [
	^ '<sin definir>'
]

{ #category : #accessing }
Poster >> path [
	^ path
]

{ #category : #accessing }
Poster >> path: anObject [
	path := anObject
]

{ #category : #accessing }
Poster >> renderEditControlOn: chapterView with: html [
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
Poster >> renderPosterOn: html with: chapterView [
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
Poster >> renderViewOn: html with: chapterView [

	(self shouldHide: chapterView) ifTrue: [ ^self ].
	
	html div: [ 
		self renderPosterOn: html with: chapterView.
		self renderEditControlOn: chapterView with: html.
		html break; break.
	].

]

{ #category : #accessing }
Poster >> shouldHide: aChapter [
	^ self isMissing and: [ aChapter context isLoggedIn not ] .

]

{ #category : #accessing }
Poster >> writeOn: html [.
	html nextPutAll: self link; cr. 
	self accurate ifTrue: [ 
		html nextPutAll: 'Accurate;'.
	].
	html cr; cr.

]
