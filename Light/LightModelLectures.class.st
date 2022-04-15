Class {
	#name : #LightModelLectures,
	#superclass : #Object,
	#instVars : [
		'lines',
		'changes',
		'accurate'
	],
	#category : #'Light-Model'
}

{ #category : #'as yet unclassified' }
LightModelLectures class >> booksLibrosLink [
	
	^ { '<definir lecturas>'. '<definir lecturas>'. '<definir lecturas>'.
	'1 Corinthians'. '1 Corintios'. '1corintios'.
'1 John'. '1 Juan'. '1juan'.
'1 Kings'. '1 Reyes'. '1reyes'.
'1 Peter'. '1 Pedro'. '1pedro'.
'1 Samuel'. '1 Samuel'. '1samuel'.
'1 Thessalonians'. '1 Tesalonicenses'. '1tesalonicenses'.
'1 Timothy'. '1 Timoteo'. '1timoteo'.
'2 Chronicles'. '1 Crónicas'. '1cronicas'.
'2 Corinthians'. '2 Corintios'. '2corintios'.
'2 Kings'. '2 Reyes'. '2reyes'.
'2 Maccabees'. '2 Maccbeos' .'2macabeos'.
'2 Peter'. '2 Pedro'. '2pedro'.
'2 Samuel'. '2 Samuel'. '2samuel'.
'2 Thessalonians'. '2 Tesalonicenses'. '2tesalonicenses'.
'2 Timothy'. '2 Timoteo'. '2timoteo'.
'Acts'. 'Hechos'. 'hechos'.
'Amos'. 'Amós'. 'amos'.
'Baruch'. 'Baroc'. 'baroc'.
'Colossians'. 'Colosenses'. 'colosenses'.
'Daniel'. 'Daniel'. 'daniel'.
'Deuteronomy'. 'Deuteronomio'. 'deuteronomio'.
'Ecclesiasticus'. 'Eclesiastés'. 'eclesiastes'.
'Ephesians'. 'Efesios'. 'efesios'.
'Exodus'. 'Éxodo'. 'exodo'.
'Ezekiel'. 'Ezequiel'. 'ezequiel'.
'Galatians'. 'Gálatas'. 'galatas'.
'Genesis'. 'Génesis'. 'genesis'.
'Habbakuk'. 'Habacuc'. 'habacuc'.
'Hebrews'. 'Hebreos'. 'hebreos'.
'Hosea'. 'Oseas'. 'oseas'.
'Isaiah'. 'Isaías'. 'isaias'.
'James'. 'Santiago'. 'santiago'.
'Jeremiah'. 'Jeremías'. 'jeremias'.
'Job'. 'Job'. ' job'.
'Joel'. 'Joel'. 'joel'.
'John'. 'Juan'. 'juan'.
'Jonah'. 'Jonás'. 'jonas'.
'Joshua'. 'Josué'. 'josue'.
'Leviticus'. 'Levítico'. 'levitico'.
'Luke'. 'Lucas'. 'lucas'.
'Malachi'. 'Malaquías'. 'malaquías'.
'Mark'. 'Marcos'. 'marcos'.
'Matthew'. 'Mateo'. 'mateo'.
'Micah'. 'Miqueas'. 'miqueas'.
'Nehemiah'. 'Nehemías'. 'nehemias'.
'Numbers'. 'Números'. 'numeros'.
'Philemon'. 'Filemón'. 'filemon'.
'Philippians'. 'Filipenses'. 'filipenses'.
'Proverbs'. 'Proverbios'. 'proverbios'.
'Psalms'. 'Salmos'. 'salmos'.
'Revelation'. 'Apocalipsis'. 'apocalipsis'.
'Romans'. 'Romanos'. 'romanos'.
'Ruth'. 'Rut'. 'rut'.
'Song of Songs'. 'Cantares'. 'cantares'.
'Titus'. 'Tito'. 'tito'.
'Wisdom'. 'Sabiduría'. 'sabiduria'.
'Zephaniah'. 'Sofonías'. 'sofonias'.
'Zechariah'. 'Zacarías'. 'zacarías'
}
]

{ #category : #'as yet unclassified' }
LightModelLectures class >> eng2Spa [
	" self eng2Spa"
	| dic ternas |

	ternas := self booksLibrosLink.
	dic := Dictionary new.
	
	1 to: ternas size by: 3 do: [ :i |
		dic at: (ternas at: i) put: (ternas at: i + 1)
	].

	^ dic.
]

{ #category : #'as yet unclassified' }
LightModelLectures class >> esp2link [
	" self esp2link"
	| dic ternas |

	ternas := self booksLibrosLink.
	dic := Dictionary new.
	
	1 to: ternas size by: 3 do: [ :i |
		dic at: (ternas at: i+1) put: (ternas at: i + 2)
	].

	^ dic.
]

{ #category : #'as yet unclassified' }
LightModelLectures class >> read: file [
	| line lects |
	
	lects := self new.
	[ (line := file nextLine) isEmpty or: [ line includesSubstring: 'Accurate;' ] ] whileFalse: [
		lects lines add: line.
	].
 	(line includesSubstring: 'Accurate;') ifTrue: [ 
		lects accurate: true.
	] ifFalse: [ 
		lects accurate: false.
	].

	line := file nextLine.
	self assert: line isEmpty.
	
	^ lects.
]

{ #category : #accessing }
LightModelLectures >> accurate [
	^ accurate ifNil: [ accurate := false ]
]

{ #category : #accessing }
LightModelLectures >> accurate: anObject [
	accurate := anObject
]

{ #category : #obsolete }
LightModelLectures >> change: aText to: newText for: user [
	self changes add: (TextUpdate user: user from: aText to: newText ).

]

{ #category : #obsolete }
LightModelLectures >> changes [
	^ changes ifNil: [ changes := OrderedCollection new ]
]

{ #category : #obsolete }
LightModelLectures >> comments [
	^ OrderedCollection new.
]

{ #category : #obsolete }
LightModelLectures >> descriptionEdit [
	^ MAMemoDescription new
 		selectorAccessor: #paragraph;
 		label: 'Lecturas del día';
		lineCount: 4;
 		priority: 5;
		yourself
]

{ #category : #accessing }
LightModelLectures >> isMissing [
	^ self lines first = self missingText
]

{ #category : #obsolete }
LightModelLectures >> latexOn: aStream [ 

	self isMissing ifFalse: [ 
	aStream nextPutAll: '\noindent';cr.
		 lines do: [ :line | 
			aStream nextPutAll: (	self lineAsLink: line do: [ :url | '\href{', url, '}{', line texScape, '}\\'. ] 
														ifMissing: [ line texScape ] ).
		] separatedBy: [
			aStream cr.
		].
		aStream cr; cr.
	].

]

{ #category : #accessing }
LightModelLectures >> lineAsLink: line do: renderLinkBlock ifMissing: renderPlainBlock [ 
	| links bkey chapter url |

	links :=  self class esp2link.

	bkey := links keys detect: [ :key | line includesSubString: key ]
				ifNone: [ Transcript show: 'No se encontro link para: ', line; cr.
					self missingText ].

	^ bkey = self missingText ifTrue: 
		renderPlainBlock 
	ifFalse: [ 
		chapter := (line subStrings: ':') first substrings last .
		renderLinkBlock value: 'http://iglesia.net/biblia/libros/',  (links at: bkey), '.html#cap', chapter.
	]
]

{ #category : #accessing }
LightModelLectures >> lines [
	^ lines ifNil: [ lines := OrderedCollection new ]
]

{ #category : #accessing }
LightModelLectures >> lines: anObject [
	lines := anObject
]

{ #category : #accessing }
LightModelLectures >> missingText [
	^ '<definir lecturas>'
]

{ #category : #accessing }
LightModelLectures >> paragraph [
	^ Character cr join: self lines

]

{ #category : #accessing }
LightModelLectures >> paragraph: paragraph [
	lines := paragraph trim lines collect: [ :each | each trim ]
]

{ #category : #accessing }
LightModelLectures >> renderAsLink: line on: html [ 

	self lineAsLink: line do: [ :url | 
		html anchor target: 'lecturespage';
				url: url;
				with: [ html text: line ]. 
				
	] ifMissing: [
		html text: line.
	] 
	
	

]

{ #category : #obsolete }
LightModelLectures >> renderEditControlOn: chapterView with: html [ 
	( chapterView shouldRenderControls and: [ self accurate not ] ) ifTrue: [ 
		(html anchor)
			callback: [ | oldText |
				oldText := self paragraph.
				(chapterView call: ((MAContainer with: self descriptionEdit ) asComponentOn: self ) addValidatedForm)
					ifNotNil: [ self change: oldText to: self paragraph for: chapterView context user ] ];
			with: [ 
				(html image)
					title: 'completar lecturas';
					height: 16;
					url: LightLibrary / #editPng ]
	].
]

{ #category : #obsolete }
LightModelLectures >> renderViewOn: html with: chapterView [

	(self shouldHide: chapterView) ifTrue: [ ^self ].
	
	html div: [ 
		self lines do: [ :line | self renderAsLink: line on: html ] 
				separatedBy: [ html break ].
		self renderEditControlOn: chapterView with: html.
		html break; break.
	].

]

{ #category : #obsolete }
LightModelLectures >> shouldHide: aChapter [
	^ self isMissing and: [ aChapter context isLoggedIn not ] .

]

{ #category : #accessing }
LightModelLectures >> writeOn: html [.

	html nextPutAll: self paragraph; cr.
	self accurate ifTrue: [ 
		html nextPutAll: 'Accurate;'
	].
	html cr.
	html cr

]
