Class {
	#name : #LightModelBook,
	#superclass : #PRCase,
	#instVars : [
		'filename',
		'times',
		'headTitle',
		'viewComponentClass',
		'chapters',
		'baseDir'
	],
	#category : #'Light-Model'
}

{ #category : #'instance creation' }
LightModelBook class >> newOn: baseDir named: aDescriptionName [
	^ self new initializeOn: baseDir named: aDescriptionName
]

{ #category : #uncategorized }
LightModelBook >> accept: aVisitor [
"	Transcript show: ('activado! ', self name, ' - ', aVisitor printString); 
		cr; flush."
	super accept: aVisitor.
]

{ #category : #proyectors }
LightModelBook >> changed [
	^ self chapters select: [ :chapter | chapter hasChanges ]
]

{ #category : #accessing }
LightModelBook >> chapters [
	^ chapters ifNil: [ chapters := OrderedCollection new ]
]

{ #category : #proyectors }
LightModelBook >> commented [
	^ self chapters select: [ :chapter | chapter hasComments ]
]

{ #category : #proyectors }
LightModelBook >> file [
	^ FileSystem root / baseDir / self filename
]

{ #category : #uncategorized }
LightModelBook >> fileTimeStamp [
	^ (((DateAndTime now utcOffset: -3 hours) printString replaceAll: $T with: $-) replaceAll: $: with: $-) truncateTo: 19
]

{ #category : #proyectors }
LightModelBook >> filename [
	^ headTitle asValidSelector, '.txt'
]

{ #category : #accessing }
LightModelBook >> headTitle [
	^ headTitle
]

{ #category : #accessing }
LightModelBook >> headTitle: anObject [
	headTitle := anObject
]

{ #category : #initialize }
LightModelBook >> initializeOn: aBaseDir named: aDescriptionName [
	baseDir := aBaseDir.
	headTitle := aDescriptionName
]

{ #category : #uncategorized }
LightModelBook >> itemContent: chapter [
	^chapter title
]

{ #category : #uncategorized }
LightModelBook >> itemTitle: chapter [
	^chapter date fineSpa
]

{ #category : #uncategorized }
LightModelBook >> latex [
"	self latexOn: 'LCF', FileDirectory pathNameDelimiter asString, self name, '.tex'."
	| file |
	[ 
		file  := MultiByteFileStream forceNewFileNamed: ( LightVariables rootPath ,'LCF/tex/',self filename, '.tex').
		file nextPutAll: self latexBookHeader.

		self chapters select: [ :each | 
			each translationProgress > 60.
		] thenDo: [ :each | 
			each latexOn: file.
		].
		
		file nextPutAll: '

\end{document}
'.

	] ensure: [file close].
]

{ #category : #uncategorized }
LightModelBook >> latexBookHeader [.
	^ '\documentclass[a4paper,spanish, 11pt]{book}
\usepackage[activeacute]{babel}
\usepackage{makeidx}
\usepackage{amsmath}
\usepackage{graphicx}
\usepackage{subfigure}
\usepackage{psfrag}
\usepackage{amsthm}
\usepackage{amssymb,latexsym}
\usepackage{hyperref}
\usepackage{here}
\usepackage{blindtext}
\usepackage{multicol}


\addtolength{\oddsidemargin}{-1cm}
\addtolength{\textwidth}{2cm}
\addtolength{\textheight}{1cm}
%\addtolength{\topmargin}{-2cm}
%\addtolength{\textheight}{4cm}

\makeindex

\begin{document}

\DeclareGraphicsExtensions{.eps}



%\frontmatter
%should be the very first command after \begin{document}
%It will switch page numbering to Roman numerals. It is common to
%use the starred sectioning commands (eg \chapter*{Preface}) for
%frontmatter as this stopps LATEX from enumerating them.

\pagestyle{headings}

%% TITULO %%

\title {
\Huge\textbf{Lights, Camera, Faith!}\\
\vspace{10mm}
\Large A Movie Lectionary Guide to Scripture series\\
\vspace{10mm}
%\vspace{10mm}
}

\author{traducci\''on organizada por miembros de la Comunidad Barat\\
\href{www.comunidadbarat.org}{www.comunidadbarat.org}
}

\maketitle

\tableofcontents

%\mainmatter
%comes after right befor the first chapter of the book. It turns
%on Arabic page numbering and restarts the page counter.

%\makeindex
%\MakeIndex{}

\hbadness = 10000
\tolerance = 10000

'.
]

{ #category : #uncategorized }
LightModelBook >> latexSingle [

		self chapters select: [ :each | 
			each translationProgress > 60.
		] thenDo: [ :each | 
			each latex
		].

]

{ #category : #initialize }
LightModelBook >> load [
	| stream |
	[ 
		stream := self file readStream.
		self loadFrom: stream
	] ensure: [ stream close].


]

{ #category : #initialize }
LightModelBook >> loadFrom: aStream [
	DateMoment resetMoment.
	

	[ aStream nextLine beginsWith: 'MOVY' ] whileTrue: [
		 self updateChild: (LightModelChapter readChapter: aStream )
	]
]

{ #category : #uncategorized }
LightModelBook >> reload [
	self write.
	LCFChapter manyFrom: self fullFilename on: self chapters
]

{ #category : #uncategorized }
LightModelBook >> render: chapter onTree: html link: link [

	html anchor
		goto: link;
		title: (chapter date spa, chapter moment prettyMoment );
		with: [ html html: chapter date eng ].
		
	html div
		class: 'summary';
		with: [ html html: '(', chapter film eng, ')' ]
]

{ #category : #accessing }
LightModelBook >> sectionsKeys [
	^ LightModelTiempoLiturgico sectionsKeys
]

{ #category : #initialize }
LightModelBook >> time: aLiturgicTimeKey [
	^ self times at: aLiturgicTimeKey ifAbsentPut: [ LightModelTiempoLiturgico new: aLiturgicTimeKey  ]

]

{ #category : #accessing }
LightModelBook >> times [ 
	^ times ifNil: [ times := Dictionary new ].

]

{ #category : #initialize }
LightModelBook >> updateChild: chap [
	( self time: chap tiempo) addChap: chap.
	chap book: self.
	chap poster initializeWith: chap.
	self chapters add: chap.

]

{ #category : #uncategorized }
LightModelBook >> viewComponentClass [
	^ viewComponentClass ifNil: [ viewComponentClass := LCFBookView ].
]

{ #category : #uncategorized }
LightModelBook >> write [
	self writeOn: 'LCF', FileDirectory pathNameDelimiter asString, 'back', FileDirectory pathNameDelimiter asString, self filename, '.', self fileTimeStamp , '.txt'.
	self writeOn: 'LCF', FileDirectory pathNameDelimiter asString, self filename, '.last.txt'.
]

{ #category : #initialize }
LightModelBook >> writeOn: aStream [
	self chapters do:	[ :each |
		each writeOn: aStream
	].

]
