"
Metacello new
 baseline:'Seaside3';
 repository: 'github://SeasideSt/Seaside:master/repository';
 load.

Metacello new
 baseline:'PierCore';
 repository: 'github://Pier-CMS/Pier3:master/repository';
 onConflictUseLoaded;
 load.

Metacello new
 baseline:'PierAddons';
 repository: 'github://Pier-CMS/Pier3:master/repository';
 onConflictUseLoaded;
 load.

""Reseteo de paswword --> verifyRequest:""

Date current ddmmyyyy.

(lfcBook := PRLCFDistribution new register).
LightDistribution efoRegister.

FileSystem disk workingDirectory.
Transcript open.
'ui-corner-all'.

(FileSystem root / 'home' / 'emilio-oca' / 'develop' / 'lcf' / 'sourceBase') isDirectory.
(FileSystem root / 'home/emilio-oca/develop/lcf/sourceBase') isDirectory.


lfcBook chapters do: [ :chap | Transcript show: chap filmData lines fourth; cr ]
lfcBook chapters select: [ :chap | chap filmData lines size ~= 4 ]

lfcBook latex
lfcBook bookA latex

lfcBook bookA latexSingle
lfcBook bookB latexSingle
lfcBook bookC latexSingle
lfcBook bookCommands latexSingle

""lfcBook bookCeleb latexSingle""

True
* incluir en cada par la seccion a la que pertenecen, usar esa informacion en los links
* pagina con log de comentarios, agregar links de cada par a al copitulo correspondiente.

JQUiDeploymentLibrary deployFiles.
LCFDeploymentLibrary deployFiles.
LCFDeploymentLibrary addFileAt: 'V:\LigthCameraFaith\Seaside-3.0.5-final\LCFDeploymentLibrary\screenLcf.css'.
LCFDeploymentLibrary addFileAt: 'V:\LigthCameraFaith\Seaside-3.0.5-final\LCFDeploymentLibrary\jqueryui.css'.
LCFDeploymentLibrary addFileAt: 'V:\LigthCameraFaith\Seaside-3.0.5-final\LCFDeploymentLibrary\jQueryUiLcf.js'.


('
""El joven manos d' copyReplaceAll: (Character cr asString,'""') with: (Character cr asString,'``'))

lfcBook bookA chapters first latex 
WAToolFiles deployFiles

GoogleTranslate new find: ''
GoogleTranslate new doPost: ''

'[[[LCFGlosarioslas están marcadas por un fuerte sentido de humanidad y compasión : Mi vida como un perro , ¿Cuál es"",""His movies are marked by a strong sense of humanity and compassion: My Life as a Dog, What''s"","""",""""]],,'
 regex: '\[\[\[\""([[:alnum:][:space:][:punct:]¿\\]+)\""]\]\]*' matchesDo: [ :var | Transcript show: var; cr ;flush] 

			
TiempoLiturgico sections keys
Dictionary
lfcBook kernel users.
PRContext allInstances
lfcBook book LCFGlosariosoration children.
lfcBook book writeOn: 'nuevo.txt'.
PRErrorView 
PRBlueprintLibrary addFileAt: 'V:\LigthCameraFaith\Seaside-3.0.5-final\PRBlueprintLibrary\edit.png'

PRBlueprintLibrary addFileAt: 'V:\LigthCameraFaith\Seaside-3.0.5-final\Resources\LCF\correct.png'.

PRBlueprintLibrary deployFiles 
jQueryUicss
LatexWriter new generateLaTeX: 'latexample'

LCFSession allInstances
'06.06.2012' asDate printString
HTTPSocket useProxyServerNamed: 'wwwafip' port: 80

lfcBook := nill.
HTTPSocket useProxyServerNamed: nil port: nil.
LCFBook allInstances do: [ :lcfBook | 
	lcfBook decorations isEmpty ifFalse: [
	lcfBook decorations at: 2 put: nil; at: 1 put: nil. ].
	lcfBook parent: nil.
	lcfBook times removeAll
						].

LCFChapterHtmlView allInstances do: [:chapter | 
			chapter decoration: nil.
			(chapter context) ifNotNil: [ chapter context setStructure: nil].
			(chapter context) ifNotNil: [ chapter context command sanitizeSeasideCache ].
			""chapter context: nil""].


WACallbackRegistry allInstances do: [ :reg | ( reg instVarAt: 1) removeAll ].
WARegistry clearAllHandlers.
WAAdmin clearSessions.
PRKernel reset.
LCFGlosarios allInstances do: [ :chapter | chapter finalize ].
Glosario allInstances do: [ :chapter | chapter finalize ].
LCFChapter allInstances  do: [ :chapter | chapter parent: nil.
	chapter decorations ifNotNil: [ :deco| deco isEmpty ifFalse: [deco at: 1 put: nil] ].
	chapter ].
WAActionCallback allInstances do: [ :chapter | chapter block: [1]. ].

TiempoLiturgico allInstances do: [ :tiempo | tiempo chapters removeAll.
			tiempo initialize; decoration: nill ].
Smalltalk garbageCollect .  
{
LCFGlosarios allInstances size.
Glosario allInstances size.
GlosarioItem allInstances size.
LCFChapter allInstances size.
TiempoLiturgico allInstances size.
PRLCFDistribution allInstances size.
WAActionCallback allSubInstances size 
}
 #(1 0 0 0 0 0)


PRErrorView allInstances
Smalltalk garbageCollect 
 
JQDialogFunctionalTest

"
Class {
	#name : #LightDistribution,
	#superclass : #WAComponent,
	#instVars : [
		'lightApp',
		'components'
	],
	#category : #Light
}

{ #category : #'as yet unclassified' }
LightDistribution class >> efoRegister [
	"register the component in Seaside Config so it is available at host/light
	self efoRegister
	"
   self initialize.
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
				preferenceAt: #sessionClass put: LightSession;
				yourself.
	
	#EFO: "To configure a personal session MiSession inherited from WASession
	http://book.seaside.st/book/in-action/session/customize-session"
	"app preferenceAt: #sessionClass put: MiSession "
	"WAAdmin clearSessions to clear all sessions related to  updateUrl: and initialRequest:"
]

{ #category : #'as yet unclassified' }
LightDistribution class >> reloadReset [ 
| repo aRemote localBranch remoteBranch |
repo := IceRepository registry detect: [ :each | each includesPackageNamed: 'Light' ].
aRemote := IceGitRemote name: 'origin' url: 'https://github.com/EmilioOca/Light.git'.
aRemote localRepository: repo.
localBranch := IceGitLocalBranch named: 'refs/heads/main' inRepository: repo.
aRemote fetchBranch: localBranch.
remoteBranch := aRemote remoteBranchNamed: localBranch name ifAbsent: [ ^ localBranch ].
repo workingCopy mergeCommit: remoteBranch commit.
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
LightDistribution >> about [
	^ components at: #about ifAbsent: [ components at: #about put: (LigAboutPage newOn: self) ]
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
LightDistribution >> editContact: aSession [
	self session login: 
		(self call: (LightUserComponent new 
  		  				    user:  aSession user;
    		   				 yourself)
		)
]

{ #category : #'page access' }
LightDistribution >> glosarios [
	^ components at: #glosarios ifAbsent: [ components at: #glosarios put: (LigGlosariosPage newOn: self) ]
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

{ #category : #'page access' }
LightDistribution >> project [
	^ components at: #project ifAbsent: [ components at: #project put: (LigProjectPage newOn: self) ]
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
			].
			html div: [
				html small text: self session user name, ' (', self session user role, ')'.
				self session ifLoggedIn: [ 
					html anchor callback: [ self session logout ];
        						with: 'log out'.
				] ifNot: [ 
					html anchor callback: [ self editContact: self session ];
        						with: 'log in'.
				]
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
