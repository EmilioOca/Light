Class {
	#name : #LightDistribution,
	#superclass : #WAComponent,
	#instVars : [
		'lightApp',
		'components'
	],
	#category : #'Light-Pages'
}

{ #category : #'as yet unclassified' }
LightDistribution class >> efoRegister [
	"register the component in Seaside Config so it is available at host/light
	self efoRegister 
	"
   self initialize
]

{ #category : #'as yet unclassified' }
LightDistribution class >> initialize [ 
	"register the component in Seaside Config so it is available at host/light"
   | app |
	app := ( WAAdmin register: self asApplicationAt: 'light' ) 
				addLibrary: JQDeploymentLibrary;
				addLibrary: TBSDeploymentLibrary;
				addLibrary: TBSExamplesLibrary;
				addLibrary: TBSJasnyDeploymentLibrary;
				addLibrary: TBSVerticalTabsDeploymentLibrary;
				addLibrary: PRBlueprintLibrary;
				"addLibrary: PTDeploymentLibrary;  sriptaculous"
    			"addLibrary: SUDeploymentLibrary; sriptaculous"
				yourself.
	
	#EFO: "To configure a personal session MiSession inherited from WASession
	http://book.seaside.st/book/in-action/session/customize-session"
	"app preferenceAt: #sessionClass put: MiSession "
	"WAAdmin clearSessions to clear all sessions related to  updateUrl: and initialRequest:"
]

{ #category : #rendering }
LightDistribution >> Estyle [
    ^ 'h1 { text-align: center; }
body {
   color: #222;
   font-size: 90%;
 	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	margin: 50px;
	background-color: navajowhite;
}
h1 {
    color: #111;
    font-size: 2em;
    font-weight: normal;
    margin-bottom: 0.5em;
}'
]

{ #category : #'page access' }
LightDistribution >> celebrations [
	^ self page: #celebrations
]

{ #category : #rendering }
LightDistribution >> children [ 
	^ { self root }
	"^ components values"
	
]

{ #category : #'page access' }
LightDistribution >> cicloA [
	^ self page: #cicloA
	
]

{ #category : #'page access' }
LightDistribution >> cicloB [
	^ self page: #cicloB
	
]

{ #category : #'page access' }
LightDistribution >> cicloC [
	^ self page: #cicloC
	
]

{ #category : #'page access' }
LightDistribution >> ciclos [
	^ self page: #ciclos
]

{ #category : #'page access' }
LightDistribution >> colaborate [
	^ components at: #colaborate ifAbsent: [ components at: #colaborate put: (LigColaboratePage newOn: self) ]
]

{ #category : #'page access' }
LightDistribution >> commandments [
	^ self page: #commandments
]

{ #category : #'private accessing' }
LightDistribution >> components [
	^ components.
]

{ #category : #'page access' }
LightDistribution >> contact [
	^ components at: #contact ifAbsent: [ components at: #contact put: (LigContactPage newOn: self) ]
]

{ #category : #'page access' }
LightDistribution >> cover [
	^ self page: #cover
]

{ #category : #rendering }
LightDistribution >> initialize [
	super initialize.
	components := Dictionary new.
	lightApp := LightModel new.
	"self root"
]

{ #category : #'page access' }
LightDistribution >> lightApp [
	^ lightApp
]

{ #category : #'page access' }
LightDistribution >> menu [
	^ self page: #menu
]

{ #category : #'page access' }
LightDistribution >> menuCiclos [
	^ self page: #menuCiclos
]

{ #category : #'page access' }
LightDistribution >> page: pageSymbol [
	
	^ components at: pageSymbol 
			 ifAbsent: [ components at: pageSymbol 
				  						 put: ( ( Smalltalk at: ('Lig', pageSymbol asCamelCase, 'Page') asSymbol ) 
														newOn: self) ]
]

{ #category : #'page access' }
LightDistribution >> peter [
	^ self page: #peter
]

{ #category : #rendering }
LightDistribution >> renderContentOn: html [
	self renderTitleOn: html.
	html tbsPanel beDefault 
		with: [ html tbsPanelBody: [ 
					html render: self root. ].
	]

]

{ #category : #rendering }
LightDistribution >> renderTitleOn: html [
	html div: [ 
		html tbsPageHeader: [ 
			html heading: [
				html text: 'Light Camera Faith'.
				html space.
				"html tbsPullRight small: 'Subtext for header' "
				html small 
					with: [ html text: 'Signed in as '. 
				     html tbsNavbarLink: 'Mark Otto' ]
			]
		]
	].
]

{ #category : #'page access' }
LightDistribution >> root [
	^ self page: #root
]

{ #category : #rendering }
LightDistribution >> style [
    ^ 'h1 { text-align: center; }
body {
 	margin: 50px;
}
h1 {
    font-size: 2em;
    font-weight: normal;
    margin-bottom: 0.5em;
}'
]
