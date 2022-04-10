Class {
	#name : #FilmData,
	#superclass : #Object,
	#instVars : [
		'lines'
	],
	#category : #'Light-Model'
}

{ #category : #'as yet unclassified' }
FilmData class >> read: file [
	| data line |
	
	data := self new.

	"info"
	data lines add: file nextLine.

	"Actors"
	data lines add: file nextLine.

	"Writer"
	data lines add: file nextLine.

	"Director"
	data lines add: file nextLine.

	(line := file nextLine) isEmpty ifFalse: [
		"info"
		data lines add: line.

		"Actors"
		data lines add: file nextLine.

		"Writer"
		data lines add: file nextLine.

		"Director"
		data lines add: file nextLine.
		
		file nextLine.
	].


	^ data.
]

{ #category : #glosarios }
FilmData >> actors [

	^ self crewsFrom: (
		(self lines size > 4 ) ifTrue: [ 
			(lines at: 2), ', ',  (lines at: 6)
		] ifFalse: [
			(lines at: 2)
		] ).
	

]

{ #category : #glosarios }
FilmData >> countrys [
"
'Australia-Canada, 1991, 101minutes' subStrings: ','
"
	^ ( (lines at: 1) subStrings: ',') first subStrings: '/'.

]

{ #category : #glosarios }
FilmData >> crewsFrom: line [

	^ ( line subStrings: ',') collect: [ :actor |
		CrewMate from: actor.
	].

]

{ #category : #glosarios }
FilmData >> directors [

	^ self crewsFrom: (
		(self lines size > 4 ) ifTrue: [ 
			(lines at: 4), ', ',  (lines at: 8)
		] ifFalse: [
			(lines at: 4)
		] ).
	

]

{ #category : #accessing }
FilmData >> latexOn: aStream [

	aStream nextPutAll: '\noindent ',(lines at: 1),'\\'; cr.
	self renderAsLatexLink: (lines at: 2) on: aStream with: 'Actors:'.
	self renderAsLatexLink: (lines at: 3) on: aStream with: 'Writer:'.
	self renderAsLatexLink: (lines at: 4) on: aStream with: 'Director:'.
	
	(self lines size > 4 ) ifTrue: [ 
		aStream cr; cr.
		aStream nextPutAll: '\noindent ',(lines at: 5); cr; cr..
		self renderAsLatexLink: (lines at: 6) on: aStream with: 'Actors:'.
		self renderAsLatexLink: (lines at: 7) on: aStream with: 'Writer:'.
		self renderAsLatexLink: (lines at: 8) on: aStream with: 'Director:'.
	].

	aStream cr;  cr..
]

{ #category : #accessing }
FilmData >> lines [
	^ lines ifNil: [ lines := OrderedCollection new ].
]

{ #category : #accessing }
FilmData >> renderAsImdbLink: aString on: html with: label [

	html strong: (label, ': ').
	(self crewsFrom: aString) do: [ :actor |
		actor renderHtml: html.
	] separatedBy: [
		html text: ', '
	].
	html break.

]

{ #category : #accessing }
FilmData >> renderAsLatexLink: line on: aStream with: label [

	aStream nextPutAll: '\noindent \emph{', label, ' } '; cr.

	(self crewsFrom: line) do: [ :actor |
		actor renderLatex: aStream. 
	] separatedBy: [
		aStream nextPutAll: ', '; cr.
	].
	aStream  nextPutAll: '\\'; cr.
]

{ #category : #accessing }
FilmData >> renderViewOn: html with: chapterView [
"	html anchor target: 'imdbpage';
				url: 'http://www.imdb.com/find?s=all&q=', self eng asHTMLString;
				with: [ html image altText: 'buscar en IMDB'; height: 20; url: (PRBlueprintLibrary  / #imdbJpg).].
"
	html text: (lines at: 1); break.
	self renderAsImdbLink: (lines at: 2) on: html with:  'Actors'.
	self renderAsImdbLink: (lines at: 3) on: html with:  'Writer'.
	self renderAsImdbLink: (lines at: 4) on: html with:  'Director'.
		
	(self lines size > 4 ) ifTrue: [ 
		html break.
		html text: (lines at: 5); break.
		self renderAsImdbLink: (lines at: 6) on: html with:  'Actors'.
		self renderAsImdbLink: (lines at: 7) on: html with:  'Writer'.
		self renderAsImdbLink: (lines at: 8) on: html with:  'Director'.
	].

	html break.	
]

{ #category : #accessing }
FilmData >> writeOn: html [.
	html nextPutAll: (lines at: 1); cr.
	((lines at: 2) endsWith: '.') ifTrue:[ 
	html nextPutAll: ((lines at: 2) allButLast); cr.
		] ifFalse: [
	html nextPutAll: (lines at: 2); cr.
		].
	 
	((lines at: 3) endsWith: '.') ifTrue:[ 
	html nextPutAll: ((lines at: 3) allButLast); cr.
		] ifFalse: [
	html nextPutAll: (lines at: 3); cr.
	].

	((lines at: 4) endsWith: '.') ifTrue:[ 
	html nextPutAll: ((lines at: 4) allButLast); cr.
		] ifFalse: [
	html nextPutAll: (lines at: 4); cr.
	].
		
	(self lines size > 4 ) ifTrue: [ 
		html nextPutAll: (lines at: 5); cr.
		html nextPutAll: (lines at: 6); cr.
		html nextPutAll: (lines at: 7); cr.
		html nextPutAll: (lines at: 8); cr.
	].

	html cr.

]

{ #category : #glosarios }
FilmData >> writers [

	^ self crewsFrom: (
		(self lines size > 4 ) ifTrue: [ 
			(lines at: 3), ', ',  (lines at: 7)
		] ifFalse: [
			(lines at: 3)
		] ).
	

]
