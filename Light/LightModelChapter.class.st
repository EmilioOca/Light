Class {
	#name : #LightModelChapter,
	#superclass : #Object,
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
	#category : #'Light-Model'
}

{ #category : #markers }
LightModelChapter class >> commentMarker [
	^ 'Comment' 
]

{ #category : #markers }
LightModelChapter class >> dialogueMarker [
	^ 'Dialogue with the Gospel' 
]

{ #category : #markers }
LightModelChapter class >> endMarker [
	^ 'END' 
]

{ #category : #markers }
LightModelChapter class >> focusMarker [
	^ 'Focus:' 
]

{ #category : #'as yet unclassified' }
LightModelChapter class >> from: aFile [
	| file |

	[ 
		file := FileStream readOnlyFileNamed: 'LCF\', aFile.
		^ self readChapter: file.

	] ensure: [file close].
		

]

{ #category : #markers }
LightModelChapter class >> keyseqMarker [
	^ 'Some key sequences.' 
]

{ #category : #'as yet unclassified' }
LightModelChapter class >> manyFrom: aFile [
	| newChaps file line |

	newChaps := OrderedCollection new.
	LightModelDateMoment resetMoment.

	[ 
		file := FileStream readOnlyFileNamed: LightVariables rootPath, 'LCF/', aFile.
		[ file nextLine beginsWith: 'MOVY' ] whileTrue: [

			newChaps add: ( self readChapter:  file ).
		].

	^ newChaps.

	] ensure: [file close].

]

{ #category : #'as yet unclassified' }
LightModelChapter class >> manyFrom: aFile on: newChaps [
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

{ #category : #markers }
LightModelChapter class >> outlineMarker [
	^ 'Outline' 
]

{ #category : #markers }
LightModelChapter class >> prayerMarker [
	^ 'Prayer' 
]

{ #category : #'instance creation' }
LightModelChapter class >> readAttrs: newChap on: line [	
	newChap freezed: (line includesSubstring: 'Locked;').
	newChap tiempo: (LightModelTiempoLiturgico keyFrom: line).
	newChap moment: (LightModelDateMoment on: line).

]

{ #category : #'instance creation' }
LightModelChapter class >> readChapter: file [
	"PRLCFDistribution new register"
	^ self readChapter: file into: self new.
	
]

{ #category : #'instance creation' }
LightModelChapter class >> readChapter: aStream into: newChap [
	self readAttrs: newChap on: aStream nextLine.
	
	newChap date: (TextPair read: aStream).
	newChap lectures: (LightModelLectures read: aStream).
	newChap crest: (TextPair read: aStream).
	newChap film: (TextPair read: aStream).
	newChap filmData: (FilmData read: aStream).
	newChap poster: (Poster read: aStream).

	self assert: (aStream nextLine = self outlineMarker).
	self assert: aStream nextLine isEmpty.

	newChap outline: (self readSection: aStream stop: self commentMarker).
	newChap comment: (self readSection: aStream stop: self dialogueMarker).

	self assert: (aStream nextLine beginsWith: self focusMarker).
	self assert: aStream nextLine isEmpty.
	
	newChap gospelFocus: (TextPair read: aStream).
	newChap gospel: (self readSection: aStream stop: self keyseqMarker ).
	newChap keySequences: (self readSection: aStream stop: self reflectionMarker).
	newChap reflection: (self readSection: aStream stop: self prayerMarker).
	newChap prayer: (TextPair read: aStream).
	
	^ newChap.
]

{ #category : #'instance creation' }
LightModelChapter class >> readSection: file stop: stop [
	^ self readSection: file stop: stop with: TransPair
]

{ #category : #'instance creation' }
LightModelChapter class >> readSection: file stop: stop with:  transPair [
	| line section |
	section := OrderedCollection new.
	
	[ (line := file nextLine) beginsWith: stop ] whileFalse: [
		section add: (transPair read: line and: file ).
	].
	self assert: ( file nextLine isEmpty ).

	^ section.
]

{ #category : #markers }
LightModelChapter class >> reflectionMarker [
	^ 'For reflection and conversation' 
]

{ #category : #comments }
LightModelChapter >> allPairs [ 
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
LightModelChapter >> book [
	^ book
]

{ #category : #accessing }
LightModelChapter >> book: aBook [
	book := aBook
]

{ #category : #latex }
LightModelChapter >> chapterFileName [ 
"	^ self parent name, '_', self name."
	^  self name.
]

{ #category : #latex }
LightModelChapter >> chapterPath [
	^ self book name
]

{ #category : #accessing }
LightModelChapter >> comment [
	^ comment ifNil: [ comment := OrderedCollection new ].
]

{ #category : #accessing }
LightModelChapter >> comment: anObject [
	comment := anObject
]

{ #category : #accessing }
LightModelChapter >> crest [
	^ crest
]

{ #category : #accessing }
LightModelChapter >> crest: aPair [
	crest := aPair
]

{ #category : #accessing }
LightModelChapter >> date [
	^ date
]

{ #category : #accessing }
LightModelChapter >> date: aByteString [ 
	date := aByteString.
]

{ #category : #accessing }
LightModelChapter >> film [
	^ film
]

{ #category : #accessing }
LightModelChapter >> film: aByteString [ 
	film := aByteString
]

{ #category : #accessing }
LightModelChapter >> filmData [
	^ filmData.
]

{ #category : #accessing }
LightModelChapter >> filmData: aFilmData [
	filmData := aFilmData.
]

{ #category : #accessing }
LightModelChapter >> freezed [
	^ freezed ifNil: [ freezed := false ].
]

{ #category : #accessing }
LightModelChapter >> freezed: lock [
	freezed := lock.
]

{ #category : #accessing }
LightModelChapter >> gospel [
	^ gospel  ifNil: [ gospel := OrderedCollection new ].
]

{ #category : #accessing }
LightModelChapter >> gospel: anObject [
	gospel := anObject
]

{ #category : #accessing }
LightModelChapter >> gospelFocus [
	^ gospelFocus
]

{ #category : #accessing }
LightModelChapter >> gospelFocus: anObject [
	gospelFocus := anObject
]

{ #category : #comments }
LightModelChapter >> hasChanges [

    ^ (self allPairs select: [ :pair | pair changes isEmpty not ]) isEmpty not
]

{ #category : #comments }
LightModelChapter >> hasComments [

    ^ (self allPairs select: [ :pair | pair comments isEmpty not ]) isEmpty not
]

{ #category : #latex }
LightModelChapter >> itemContent [
	^ self book itemContent: self
]

{ #category : #latex }
LightModelChapter >> itemTitle [
	^ self book itemTitle: self
]

{ #category : #accessing }
LightModelChapter >> keySequences [
	^ keySequences  ifNil: [ keySequences := OrderedCollection new ].
]

{ #category : #accessing }
LightModelChapter >> keySequences: anObject [
	keySequences := anObject
]

{ #category : #latex }
LightModelChapter >> latex [
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
LightModelChapter >> latexOn: html [
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
LightModelChapter >> latexSingleChapterHeader [
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
LightModelChapter >> lectures [
	^ lectures ifNil: [ lectures := OrderedCollection new ].
]

{ #category : #accessing }
LightModelChapter >> lectures: anObject [
	lectures := anObject
]

{ #category : #accessing }
LightModelChapter >> moment [
	^ moment
]

{ #category : #accessing }
LightModelChapter >> moment: aDate [ 
	moment := aDate
]

{ #category : #accessing }
LightModelChapter >> outline [
	^ outline   ifNil: [ outline := OrderedCollection new ].
]

{ #category : #accessing }
LightModelChapter >> outline: anObject [
	outline := anObject
]

{ #category : #accessing }
LightModelChapter >> poster [
	^ poster.
]

{ #category : #accessing }
LightModelChapter >> poster: anObject [
	poster := anObject
]

{ #category : #accessing }
LightModelChapter >> prayer [
	^ prayer
]

{ #category : #accessing }
LightModelChapter >> prayer: aByteString [ 
	prayer := aByteString
]

{ #category : #accessing }
LightModelChapter >> reflection [
"	^ reflection ifNil: [ reflection := OrderedCollection new ]."
		^ reflection ifNil: [ reflection := OrderedCollection with: (TransPair on: '<sin definir>' and: '') with: (TransPair on: '<sin definir>' and: '') with: (TransPair on: '<sin definir>' and: '') ].
]

{ #category : #accessing }
LightModelChapter >> reflection: aByteString [ 
	reflection := aByteString
]

{ #category : #latex }
LightModelChapter >> renderOnTree: html link: link [

	self book render: self onTree: html link: link
]

{ #category : #accessing }
LightModelChapter >> summary [
	^ 'resumen'
]

{ #category : #accessing }
LightModelChapter >> tiempo [
	^ tiempo
]

{ #category : #accessing }
LightModelChapter >> tiempo: aByteString [ 
	tiempo := aByteString
]

{ #category : #accessing }
LightModelChapter >> title [
	^ self date eng
]

{ #category : #counting }
LightModelChapter >> translationProgress [
	^ ( ( ( self wordCount - self wordsPendant ) / self wordCount  ) * 100 ) asInteger 

	

]

{ #category : #accessing }
LightModelChapter >> viewComponentClass [
	^ LCFChapterHtmlView
]

{ #category : #counting }
LightModelChapter >> wordCount [

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
LightModelChapter >> wordsPendant [

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
LightModelChapter >> writeOn: html [
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
	
	html nextPutAll: self class outlineMarker; cr; cr.
	self outline do: [ :line | line writeOn: html ].
	
	html nextPutAll: self class commentMarker; cr; cr.
	self comment do: [ :line | line writeOn: html ].
	
	html nextPutAll: self class dialogueMarker ; cr; cr.	
	html nextPutAll: self class focusMarker ; cr; cr.	
	self gospelFocus writeOn: html.
	self gospel do: [ :line | line writeOn: html ].

	html nextPutAll: self class keyseqMarker ; cr; cr.
	self keySequences do: [ :line | line writeOn: html ].

	html nextPutAll: self class reflectionMarker ; cr; cr.
	self reflection do: [ :line | line writeOn: html ].

	html nextPutAll: self class prayerMarker; cr; cr.
	self prayer writeOn: html.
]
