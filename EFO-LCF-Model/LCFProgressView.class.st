Class {
	#name : #LCFProgressView,
	#superclass : #PRDefaultView,
	#instVars : [
		'selectedTab',
		'selectedBook'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFProgressView >> initialize [
	super initialize.
	selectedTab := 0
]

{ #category : #'as yet unclassified' }
LCFProgressView >> renderContentOn: html [
	| book |
	
	book := self context root propertyAt: 'actualBook' ifAbsent: [ self context root childrenDecoration at: 'cicloc'. ].

	html text: book headTitle.
	html table
		id: self ajaxId; class: 'report';
		with: [ 
			html tableHead: [
				{ 'Fecha'. 'Película'. 'Avance' } do: [ :header |
					html tableHeading 
							style: 'min-width: 70px;';
							text: header
				]
			].
			html tableBody
				style: 'font-size: 80%;';
				with: [
					book chapters do: [ :chapter |
						html tableRow: [
							html tableData with: [ self renderDateContentOn: html with: chapter ].
							html tableData title: chapter film fineSpa;
											with: chapter film eng.
							html tableData with: [ self renderExtrasOn: html with: chapter ].
						]
					]. 	

				].

			].
]

{ #category : #'as yet unclassified' }
LCFProgressView >> renderDateContentOn: html with: chapter [

	html anchor
		title: chapter itemTitle;
		goto: (self context structure: chapter);
		with: chapter itemContent
]

{ #category : #'as yet unclassified' }
LCFProgressView >> renderExtrasOn: html with: chapter [ 
	html html: chapter translationProgress;
		html: '%'.
	self renderPdfAvailableOn: html with: chapter.
	self renderPosterAvailableOn: html with: chapter.
]

{ #category : #'as yet unclassified' }
LCFProgressView >> renderPdfAvailableOn: html with: chapter [
	| path |
	path :=  'resources/', chapter chapterPath, '/pdf/'.

	(( FileDirectory uri: path ) fileExists: chapter chapterFileName , '.pdf') ifTrue: [ 
		html anchor
			url: 'http://lcf.seasidehosting.st/', path, chapter chapterFileName, '.pdf';
			title: 'descargar versión castellana';
			with: [ html image url: 'http://lcf.seasidehosting.st/resources/adobe.png'. ].
	]
]

{ #category : #'as yet unclassified' }
LCFProgressView >> renderPosterAvailableOn: html with: chapter [
	| path |
	path :=  'resources/', chapter chapterPath, '/jpg/'.

	^ (( FileDirectory uri: path ) fileExists: chapter chapterFileName , '.jpg') ifTrue: [ 
		html anchor
			url: 'http://lcf.seasidehosting.st/', path, chapter chapterFileName , '.jpg';
			title: 'ver poster';
			with: [ html image url: 'http://lcf.seasidehosting.st/resources/poster_ico.png' ] 
	]
]

{ #category : #'as yet unclassified' }
LCFProgressView >> renderTableOn: html with: book [
	html table
		id: self ajaxId; class: 'report';
		with: [ 
			html tableHead: [
				{ 'Motivo'. 'Película'. 'Avance' } do: [ :header |
					html tableHeading 
							style: 'min-width: 70px;';
							text: header
				]
			].
			html tableBody
				style: 'font-size: 80%;';
				with: [
					book chapters do: [ :chapter |
						html tableRow: [
							html tableData with: [ self renderDateContentOn: html with: chapter ].
							html tableData title: chapter film fineSpa;
											with: chapter film eng.
							html tableData with: [ self renderExtrasOn: html with: chapter ].
						]
					]. 	

				].

			].
]
