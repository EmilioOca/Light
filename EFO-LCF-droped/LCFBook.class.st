Class {
	#name : #LCFBook,
	#superclass : #PRCase,
	#instVars : [
		'filename',
		'times',
		'headTitle',
		'viewComponentClass',
		'chapters'
	],
	#category : #'EFO-LCF-droped'
}

{ #category : #'as yet unclassified' }
LCFBook class >> isAbstract [
	^ false
]

{ #category : #accessing }
LCFBook >> accept: aVisitor [
"	Transcript show: ('activado! ', self name, ' - ', aVisitor printString); 
		cr; flush."
	super accept: aVisitor.
]

{ #category : #accessing }
LCFBook >> changed [
	^ self chapters select: [ :chapter | chapter hasChanges ]
]

{ #category : #accessing }
LCFBook >> chapters [
	^ chapters ifNil: [ chapters := OrderedCollection new].
"	self childrenDecoration children select: [ :chapter | chapter class == LCFChapter ]."
]

{ #category : #accessing }
LCFBook >> commented [
	^ self chapters select: [ :chapter | chapter hasComments ]
]

{ #category : #accessing }
LCFBook >> fileTimeStamp [
	^ (((DateAndTime now utcOffset: -3 hours) printString replaceAll: $T with: $-) replaceAll: $: with: $-) truncateTo: 19
]

{ #category : #accessing }
LCFBook >> filename [
	^ filename
]

{ #category : #accessing }
LCFBook >> filename: aByteString [ 
	filename := aByteString.
]

{ #category : #accessing }
LCFBook >> fullFilename [
	^ self filename , '.txt'
]

{ #category : #accessing }
LCFBook >> headTitle [
	^ headTitle
]

{ #category : #accessing }
LCFBook >> headTitle: anObject [
	headTitle := anObject
]

{ #category : #render }
LCFBook >> itemContent: chapter [
	^chapter title
]

{ #category : #render }
LCFBook >> itemTitle: chapter [
	^chapter date fineSpa
]

{ #category : #accessing }
LCFBook >> latex [
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

{ #category : #render }
LCFBook >> latexBookHeader [.
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

{ #category : #accessing }
LCFBook >> latexSingle [

		self chapters select: [ :each | 
			each translationProgress > 60.
		] thenDo: [ :each | 
			each latex
		].

]

{ #category : #accessing }
LCFBook >> load [
	( LCFChapter manyFrom: self fullFilename ) 
		do: [ :chap | 
			chap name: self name, '_', chap date eng asLegalSelector .
			self updateChild: chap ].
]

{ #category : #accessing }
LCFBook >> reload [
	self write.
	LCFChapter manyFrom: self fullFilename on: self chapters
]

{ #category : #render }
LCFBook >> render: chapter onTree: html link: link [

	html anchor
		goto: link;
		title: (chapter date spa, chapter moment prettyMoment );
		with: [ html html: chapter date eng ].
		
	html div
		class: 'summary';
		with: [ html html: '(', chapter film eng, ')' ]
]

{ #category : #accessing }
LCFBook >> sectionsKeys [
	^TiempoLiturgico sectionsKeys
]

{ #category : #accessing }
LCFBook >> time: aLiturgicTime [
	^ self times at: aLiturgicTime ifAbsentPut: [ TiempoLiturgico new: aLiturgicTime  ]

]

{ #category : #accessing }
LCFBook >> times [ 
	^ times ifNil: [ times := Dictionary new ].

]

{ #category : #accessing }
LCFBook >> updateChild: chap [
	( self time: chap tiempo) addChap: chap on: self.
	chap book: self.
	chap poster initializeWith: chap.
	self chapters add: chap.

]

{ #category : #accessing }
LCFBook >> viewComponentClass [
	^ viewComponentClass ifNil: [ viewComponentClass := LCFBookView ].
]

{ #category : #accessing }
LCFBook >> write [
	self writeOn: 'LCF', FileDirectory pathNameDelimiter asString, 'back', FileDirectory pathNameDelimiter asString, self filename, '.', self fileTimeStamp , '.txt'.
	self writeOn: 'LCF', FileDirectory pathNameDelimiter asString, self filename, '.last.txt'.
]

{ #category : #accessing }
LCFBook >> writeOn: aFile [
	| newChaps file line |

	newChaps := OrderedCollection new.

	[ 
		file  := MultiByteFileStream forceNewFileNamed: aFile.
"            file lineEndConvention: #crlf."
		self chapters do: [ :each | 
			file nextPutAll: 'MOVY
'.
			each writeOn: file
		].
	
		file nextPutAll: 'FIN
'.

	] ensure: [file close].
]
