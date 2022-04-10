Class {
	#name : #LCFGlosariosView,
	#superclass : #PRDefaultView,
	#instVars : [
		'selectedTab'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFGlosariosView >> renderContentOn: html [
	html heading: 'Glosario por...'.

	html div style: 'background: transparent;';
 		script: (html jQuery new tabs
  		   	selected: self selectedTab;
   		 	onSelect: (html jQuery ajax
    				callbackTabs: [ :event | selectedTab:= event at: #index ]));
		with: [
			html unorderedList: [
				self context structure glosarios do: [ :glosario |
					html listItem: [
						html anchor
						url: (html jQuery ajax
							html: [ :h | self renderTableOn: h with: glosario. ];
							fullUrl);
				with: glosario title ] ] ]
		].

	
]

{ #category : #'as yet unclassified' }
LCFGlosariosView >> renderDateContentOn: html with: chapter [

	html anchor
		title: chapter itemTitle;
		goto: (self context structure: chapter);
		with: '(', chapter parent headTitle, ') ', chapter itemContent
]

{ #category : #'as yet unclassified' }
LCFGlosariosView >> renderTableOn: html with: glosario [ 
	| batcher |
	batcher := glosario batcherFrom: self context structure.

"	html heading text: glosario title."

	html render: batcher.

	html table
		id: self ajaxId; class: 'report';
		with: [ 
			html tableHead: [
				html tableHeading 
"							style: 'min-width: 70px;';"
							text: (glosario headers at: 1).
				html tableHeading 
							style: 'min-width: 190px;';
							text: (glosario headers at: 2).
				html tableHeading 
"							style: 'min-width: 70px;';"
							text: (glosario headers at: 3).
			].
			html tableBody
				style: 'font-size: 80%;';
				with: [
					(batcher batch) do: [ :item | 
						html tableRow: [
							html tableData with: [ item key renderOn: html ].
							html tableData with: [ self renderDateContentOn: html with: item chapter ].
							html tableData title: item chapter film fineSpa;
											with: item chapter  film eng.
						]
					]. 	
				].
			].
]

{ #category : #'as yet unclassified' }
LCFGlosariosView >> renderTableOn: html with: glosario and: batcher [
	html table
		id: self ajaxId; class: 'report';
		with: [ 
			html tableHead: [
				html tableHeading 
"							style: 'min-width: 70px;';"
							text: (glosario headers at: 1).
				html tableHeading 
							style: 'min-width: 190px;';
							text: (glosario headers at: 2).
				html tableHeading 
"							style: 'min-width: 70px;';"
							text: (glosario headers at: 3).
			].
			html tableBody
				style: 'font-size: 80%;';
				with: [
					(batcher batch) do: [ :item | 
						html tableRow: [
							html tableData with: [ item key renderOn: html ].
							html tableData with: [ self renderDateContentOn: html with: item chapter ].
							html tableData title: item chapter film fineSpa;
											with: item chapter  film eng.
						]
					]. 	
				].
			].
]

{ #category : #'as yet unclassified' }
LCFGlosariosView >> selectedTab [ 
	^ selectedTab ifNil: [ selectedTab := 0 ].
]
