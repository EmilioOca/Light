Class {
	#name : #LCFChapter,
	#superclass : #PRCase,
	#instVars : [
		'date',
		'lectures',
		'crest',
		'film',
		'filmData',
		'poster',
		'outline',
		'comment',
		'gospelFocus',
		'gospel',
		'keySequences',
		'reflection',
		'prayer',
		'freezed',
		'tiempo',
		'moment',
		'book'
	],
	#classInstVars : [
		'previousMoment'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFChapter class >> descriptionText [
	^ MAMemoDescription new
		"default: self defaultText;
		parameterName: 'text';
		"accessor: #text;
		priority: 100;
		label: 'Text';
		yourself
"	^ PRDocumentDescription new
		default: self defaultDocument;
		parameterName: 'text';
		accessor: #text;
		label: 'El Texto';
		beRequired;
		yourself"
]

{ #category : #'as yet unclassified' }
LCFChapter class >> from: aFile [
	| file |

	[ 
		file := FileStream readOnlyFileNamed: 'LCF\', aFile.
		^ self readChapter: file.

	] ensure: [file close].
		

]

{ #category : #'as yet unclassified' }
LCFChapter class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFChapter class >> manyFrom: aFile [
	| newChaps file line |

	newChaps := OrderedCollection new.
	DateMoment resetMoment.

	[ 
		file := FileStream readOnlyFileNamed: LightVariables rootPath, 'LCF/', aFile.
		[ file nextLine beginsWith: 'MOVY' ] whileTrue: [

			newChaps add: ( self readChapter:  file ).
		].

	^ newChaps.

	] ensure: [file close].

]

{ #category : #'as yet unclassified' }
LCFChapter class >> manyFrom: aFile on: newChaps [
	| file line stream |

	DateMoment resetMoment.

	[ 
		stream := newChaps readStream.
		file := FileStream readOnlyFileNamed: 'LCF', FileDirectory pathNameDelimiter asString, aFile.
		file ifNotNil: [ 		
			[ file nextLine beginsWith: 'MOVY' ] whileTrue: [
				( self readChapter:  file into: stream next).
			].
		].

	^ newChaps.

	] ensure: [file close].

]

{ #category : #'as yet unclassified' }
LCFChapter class >> readAttrs: newChap on: line [	
	| matcher |
	newChap freezed: (line includesSubstring: 'Locked;').
	newChap tiempo: (TiempoLiturgico keyFrom: line).
	newChap moment: (DateMoment on: line).

]

{ #category : #'as yet unclassified' }
LCFChapter class >> readChapter: file [
	"PRLCFDistribution new register"
	^ self readChapter: file into: self new.
	
]

{ #category : #'as yet unclassified' }
LCFChapter class >> readChapter: file into: newChap [
	"PRLCFDistribution new register"
	| line |

	self readAttrs: newChap on: file nextLine.
	
	newChap date: ((TransPairDate read: file ) level: 1; yourself ).
"Transcript show: newChap date eng; cr;flush."
	newChap lectures: (Lectures read: file).

	newChap crest: (TransPair read: file nextLine and: file) unanchored.

	newChap film: ((TransPairTitle read: file) level: 2; yourself).

	newChap filmData: (FilmData read: file).

	newChap poster: (Poster read: file).

	self assert: ( file nextLine = 'Outline' ).
	self assert: ( file nextLine isEmpty ).

	newChap outline: (self readSection: file stop: 'Comment').

	newChap comment: (self readSection: file stop: 'Dialogue with the Gospel').

	self assert: (file nextLine beginsWith: 'Focus:').
	self assert: file nextLine isEmpty.
	
	newChap gospelFocus: (TransPair read: file).
	newChap gospel: (self readSection: file stop: 'Some key sequences.').
	newChap keySequences: (self readSection: file stop: 'For reflection and conversation' with: TransPairKeySeq).
	newChap reflection: (self readSection: file stop: 'Prayer' with: TransPair).
	newChap prayer: (TransPair read: file).
	
	^ newChap .
]

{ #category : #'as yet unclassified' }
LCFChapter class >> readSection: file stop: stop [
	^ self readSection: file stop: stop with: TransPair
]

{ #category : #'as yet unclassified' }
LCFChapter class >> readSection: file stop: stop with:  transPair [
	| line section |
	section := OrderedCollection new.
	
	[ (line := file nextLine) beginsWith: stop ] whileFalse: [
		section add: (transPair read: line and: file ).
	].
	self assert: ( file nextLine isEmpty ).

	^ section.
]

{ #category : #comments }
LCFChapter >> allPairs [ 
	| pairs |
	pairs := OrderedCollection new.
	pairs add: self date;
		add: self lectures;
		add: self crest;
		add: self film;
		add: self poster;
		addAll: self outline;
		addAll: self comment;
		add: self gospelFocus;
		addAll: self gospel;
		addAll: self keySequences ;
		add: self prayer.

	^  pairs.
]

{ #category : #accessing }
LCFChapter >> book [
	^ book
]

{ #category : #accessing }
LCFChapter >> book: aBook [
	book := aBook
]

{ #category : #latex }
LCFChapter >> chapterFileName [ 
"	^ self parent name, '_', self name."
	^  self name.
]

{ #category : #latex }
LCFChapter >> chapterPath [
	^ self book name
]

{ #category : #accessing }
LCFChapter >> comment [
	^ comment ifNil: [ comment := OrderedCollection new ].
]

{ #category : #accessing }
LCFChapter >> comment: anObject [
	comment := anObject
]

{ #category : #accessing }
LCFChapter >> crest [
	^ crest
]

{ #category : #accessing }
LCFChapter >> crest: aPair [
	crest := aPair
]

{ #category : #accessing }
LCFChapter >> date [
	^ date
]

{ #category : #accessing }
LCFChapter >> date: aByteString [ 
	date := aByteString.
	self title: date eng.
]

{ #category : #accessing }
LCFChapter >> film [
	^ film
]

{ #category : #accessing }
LCFChapter >> film: aByteString [ 
	film := aByteString
]

{ #category : #accessing }
LCFChapter >> filmData [
	^ filmData.
]

{ #category : #accessing }
LCFChapter >> filmData: aFilmData [
	filmData := aFilmData.
]

{ #category : #accessing }
LCFChapter >> freezed [
	^ freezed ifNil: [ freezed := false ].
]

{ #category : #accessing }
LCFChapter >> freezed: lock [
	freezed := lock.
]

{ #category : #accessing }
LCFChapter >> gospel [
	^ gospel  ifNil: [ gospel := OrderedCollection new ].
]

{ #category : #accessing }
LCFChapter >> gospel: anObject [
	gospel := anObject
]

{ #category : #accessing }
LCFChapter >> gospelFocus [
	^ gospelFocus
]

{ #category : #accessing }
LCFChapter >> gospelFocus: anObject [
	gospelFocus := anObject
]

{ #category : #comments }
LCFChapter >> hasChanges [

    ^ (self allPairs select: [ :pair | pair changes isEmpty not ]) isEmpty not
]

{ #category : #comments }
LCFChapter >> hasComments [

    ^ (self allPairs select: [ :pair | pair comments isEmpty not ]) isEmpty not
]

{ #category : #render }
LCFChapter >> itemContent [
	^ self book itemContent: self
]

{ #category : #render }
LCFChapter >> itemTitle [
	^ self book itemTitle: self
]

{ #category : #accessing }
LCFChapter >> keySequences [
	^ keySequences  ifNil: [ keySequences := OrderedCollection new ].
]

{ #category : #accessing }
LCFChapter >> keySequences: anObject [
	keySequences := anObject
]

{ #category : #latex }
LCFChapter >> latex [
"	self latexOn: 'LCF', FileDirectory pathNameDelimiter asString, self name, '.tex'."
	| file |
	[ 
		file  := MultiByteFileStream forceNewFileNamed: ( LightVariables rootPath,'LCF/tex/', self chapterFileName, '.tex').
		file nextPutAll: self latexSingleChapterHeader.

		self latexOn: file.
		
		file nextPutAll: '

\end{document}
'.

	] ensure: [file close].
]

{ #category : #latex }
LCFChapter >> latexOn: html [
	| tp |
	
	self date latexOn: html with: self.

	html nextPutAll: '{\Large';cr.
	self crest isMissing ifFalse: [ 
		html nextPutAll: '\emph{'.
		html nextPutAll: self crest latex; nextPutAll: '}'; cr; cr. 
	].

	self film latexOn: html with: self.
	
	html nextPutAll: '\begin{multicols}{2}'; cr;  cr.
		
	self lectures latexOn: html.

	self filmData latexOn: html.

	self poster latexOn: html.

	html nextPutAll: '\end{multicols}'; cr;  cr.
	

	html nextPutAll: '\section*{Sinopsis}'; cr;  cr.
	self outline do: [ :line | line latexOn: html ].
	
	html nextPutAll: '\section*{Discusi\''on}'; cr;  cr..
	self comment do: [ :line | line latexOn: html ].
	
	html nextPutAll: '\section*{Di\''alogo con el evangelio}'; cr; cr.
	html nextPutAll: '\textbf{Foco:} '.
	self gospelFocus latexOn: html.

	self gospel do: [ :line | line latexOn: html ].

	html nextPutAll: '\section*{Algunas secuencias clave}'; cr; cr.
	html nextPutAll: '\begin{enumerate}'; cr; cr.
	self keySequences doWithIndex: [ :line :idx | 
		html nextPutAll: '\item ', line latex; cr; cr.
	].
	html nextPutAll: '\end{enumerate}'; nextPut: Character cr; nextPut: Character cr.

	(self reflection anySatisfy: [ :line | line isMissing not ]) ifTrue: [
		html nextPutAll: '\section*{Para conversar y reflexionar}'; cr; cr.
		self reflection do: [ :line | 
			line latexOn: html.
		].
	].


	html nextPutAll: '\section*{Oraci\''on}'; cr; cr.
	self prayer latexOn: html.
	

]

{ #category : #latex }
LCFChapter >> latexSingleChapterHeader [
	^ '\documentclass[a4paper,openany,spanish, 11pt]{book}
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
LCFChapter >> lectures [
	^ lectures ifNil: [ lectures := OrderedCollection new ].
]

{ #category : #accessing }
LCFChapter >> lectures: anObject [
	lectures := anObject
]

{ #category : #accessing }
LCFChapter >> moment [
	^ moment
]

{ #category : #accessing }
LCFChapter >> moment: aDate [ 
	moment := aDate
]

{ #category : #accessing }
LCFChapter >> outline [
	^ outline   ifNil: [ outline := OrderedCollection new ].
]

{ #category : #accessing }
LCFChapter >> outline: anObject [
	outline := anObject
]

{ #category : #accessing }
LCFChapter >> poster [
	^ poster.
]

{ #category : #accessing }
LCFChapter >> poster: anObject [
	poster := anObject
]

{ #category : #accessing }
LCFChapter >> prayer [
	^ prayer
]

{ #category : #accessing }
LCFChapter >> prayer: aByteString [ 
	prayer := aByteString
]

{ #category : #accessing }
LCFChapter >> reflection [
"	^ reflection ifNil: [ reflection := OrderedCollection new ]."
		^ reflection ifNil: [ reflection := OrderedCollection with: (TransPair on: '<sin definir>' and: '') with: (TransPair on: '<sin definir>' and: '') with: (TransPair on: '<sin definir>' and: '') ].
]

{ #category : #accessing }
LCFChapter >> reflection: aByteString [ 
	reflection := aByteString
]

{ #category : #render }
LCFChapter >> renderOnTree: html link: link [

	self book render: self onTree: html link: link
]

{ #category : #accessing }
LCFChapter >> summary [
	^ 'resumen'
]

{ #category : #accessing }
LCFChapter >> tiempo [
	^ tiempo
]

{ #category : #accessing }
LCFChapter >> tiempo: aByteString [ 
	tiempo := aByteString
]

{ #category : #counting }
LCFChapter >> translationProgress [
	^ ( ( ( self wordCount - self wordsPendant ) / self wordCount  ) * 100 ) asInteger 

	

]

{ #category : #accessing }
LCFChapter >> viewComponentClass [
	^ LCFChapterHtmlView
]

{ #category : #counting }
LCFChapter >> wordCount [

	^ self date wordCount + 
		self film wordCount + 
		(self outline inject: 0 into:  [ : sum :pair | sum + pair wordCount ]) + 
		(self comment inject: 0 into:  [ : sum :pair | sum + pair wordCount ]) +
		self gospelFocus wordCount +
		(self gospel inject: 0 into:  [ : sum :pair | sum + pair wordCount ]) +
		(self keySequences inject: 0 into:  [ : sum :pair | sum + pair wordCount ]) + 
		self prayer wordCount.


	

]

{ #category : #counting }
LCFChapter >> wordsPendant [

	^ self date wordsPendant + 
		self film wordsPendant + 
		(self outline inject: 0 into:  [ : sum :pair | sum + pair wordsPendant ]) + 
		(self comment inject: 0 into:  [ : sum :pair | sum + pair wordsPendant ]) +
		self gospelFocus wordsPendant +
		(self gospel inject: 0 into:  [ : sum :pair | sum + pair wordsPendant ]) +
		(self keySequences inject: 0 into:  [ : sum :pair | sum + pair wordsPendant ]) + 
		self prayer wordsPendant.


	

]

{ #category : #accessing }
LCFChapter >> writeOn: html [
	| tp |

	self freezed ifTrue: [ html nextPutAll: 'Locked;' ].
	html nextPutAll:  ' Tiempo<', self tiempo, '>;'.
	self moment writeOn: html.
	html cr.
		
	self date writeOn: html.

	self lectures writeOn: html.
	self crest writeOn: html.
	self film writeOn: html.
	self filmData writeOn: html.
	self poster writeOn: html.
	
	html nextPutAll: 'Outline'; cr; cr.
	self outline do: [ :line | line writeOn: html ].
	
	html nextPutAll: 'Comment'; cr; cr.
	self comment do: [ :line | line writeOn: html ].
	
	html nextPutAll: 'Dialogue with the Gospel'; cr; cr.	
	html nextPutAll: 'Focus:'; cr; cr.	
	self gospelFocus writeOn: html.
	self gospel do: [ :line | line writeOn: html ].

	html nextPutAll: 'Some key sequences.'; cr; cr.
	self keySequences doWithIndex: [ :line :idx | 
		line idx: idx.
		line writeOn: html ].

	html nextPutAll: 'For reflection and conversation'; cr; cr.
	self reflection do: [ :line | line writeOn: html ].

	html nextPutAll: 'Prayer'; cr; cr.
	self prayer writeOn: html.
]
