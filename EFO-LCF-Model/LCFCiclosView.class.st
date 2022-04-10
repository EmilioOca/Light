Class {
	#name : #LCFCiclosView,
	#superclass : #PRDefaultView,
	#instVars : [
		'selectedTab'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFCiclosView >> ErenderDateContentOn: html with: chapter [

	html anchor
		title: chapter date fineSpa;
		goto: (self context structure: chapter);
		with: chapter parent headTitle, ' ', chapter date eng
]

{ #category : #'as yet unclassified' }
LCFCiclosView >> ErenderSideTreeOn: html [

	html heading: 'Tiempos Litúrgicos'.
	html html: self book headTitle; break.
		
	TiempoLiturgico sectionsKeys do: [ :key |
		self book times at: key ifPresent: [ :tiempos |
			tiempos renderContentOn: html using: self. ]
	].
]

{ #category : #'as yet unclassified' }
LCFCiclosView >> ErenderTabOn: html [

	
	html div class: 'postticker column prepend-0 span-6';
		with: [ self renderSideTreeOn: html ].

"	html div class: 'contents column prepend-1 span-13 last';
		with: [ self structure named: 'sidechaptertree' ]."
		
"		+/system/components/contents+

	html render: book"
]

{ #category : #'as yet unclassified' }
LCFCiclosView >> ErenderTabOn: html with: book [

	
	html div class: 'postticker column prepend-0 span-6';
		with: [ (((self context structure root childrenDecoration at: 'system') childrenDecoration at: 'components') childrenDecoration at: 'sidechaptertree') component renderContentOn: html ].

	html div class: 'contents column prepend-1 span-13 last';
		with: [ self structure named: 'sidechaptertree' ].
		
"		+/system/components/contents+

	html render: book"
]

{ #category : #'as yet unclassified' }
LCFCiclosView >> ErenderTableOn: html with: book [ 

	html div class: 'postticker column prepend-0 span-6';
		with: [ (((self context structure root childrenDecoration at: 'system') childrenDecoration at: 'components') childrenDecoration at: 'sidechaptertree') component renderContentOn: html ].

"	html div class: 'contents column prepend-1 span-13 last';
		with: [ self structure named: 'sidechaptertree' ]."
		
"		+/system/components/contents+

	html render: book"
]

{ #category : #'as yet unclassified' }
LCFCiclosView >> book [
	^ self context root propertyAt: 'actualBook' ifAbsent: [ self context root childrenDecoration at: 'cicloc'. ].
]

{ #category : #'as yet unclassified' }
LCFCiclosView >> renderContentOn: html [
"	Transcript show: ('render! ', self context structure name, ', user: ', self context user printString); 
		cr; flush."
	self context root ifNotNil: [
		self context root propertyAt: 'actualBook' ifAbsentPut: (self context root childrenDecoration at: 'cicloc' ).
	].

	super renderContentOn: html
"	selectedTab := 0.

	html div style: 'background: transparent;';
 		script: (html jQuery new tabs
  		   	selected: selectedTab;
   		 	onSelect: (html jQuery ajax
    				callbackTabs: [ :event | selectedTab:= event at: #index ]));
		with: [
			html unorderedList: [
				(self context structure root propertyAt: 'distro') books do: [ :book |
					html listItem: [
						html anchor
						url: (html jQuery ajax
							html: [ :h | 
								self context root propertyAt: 'actualBook' put: book.
								self renderTabOn: h. ];
							fullUrl);
				with: book headTitle ] ] ]
		].

	"
]
