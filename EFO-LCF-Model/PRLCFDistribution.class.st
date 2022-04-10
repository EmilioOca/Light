Class {
	#name : #PRLCFDistribution,
	#superclass : #PRDistribution,
	#instVars : [
		'book',
		'sidechaptertreeWidget',
		'logoutCommandWidget',
		'logcommandsPage',
		'logInUserPage',
		'savePage',
		'bookEnvironmentPage',
		'inicioPage',
		'homeEnvironmentPage',
		'contactoPage',
		'proyectoPage',
		'bookA',
		'bookB',
		'bookC',
		'colaborarPage',
		'progressPage',
		'changesPage',
		'commentsPage',
		'sessionsPage',
		'glosarios',
		'glosariosEnvironmentPage',
		'sideglosariosWidget',
		'nextChapter',
		'ciclosPage',
		'menuCicleWidget',
		'headerCiclePage',
		'progressEnvironmentPage',
		'menuProgressWidget',
		'headerProgressPage',
		'bookCeleb',
		'bookCommands'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
PRLCFDistribution class >> title [
	^ 'Ligth, Camera, Fayth'
]

{ #category : #pages }
PRLCFDistribution >> aboutPage [
	^ aboutPage ifNil: [
		super aboutPage title: 'Agenda';
			addChild: self syntaxPage;
			localEnvironment: self environmentPage;
			contents: '
{{{<iframe src="https://www.google.com/calendar/embed?src=8efgm1lnduf72vl1a9eucobrks%40group.calendar.google.com&ctz=America/Argentina/Buenos_Aires" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>}}}

_

!Como está construido este sitio
', super aboutPage contents; 
				yourself.
	]
]

{ #category : #accessing }
PRLCFDistribution >> book [
	^ book ifNil: [
		book := self bookA
	]
]

{ #category : #accessing }
PRLCFDistribution >> book: aLFCBook [ 
	book := aLFCBook
]

{ #category : #pages }
PRLCFDistribution >> bookA [
	^ bookA ifNil: [ 
		"book := "
		bookA := (LCFBookCicle named: 'cicloa')
			title: self headTitle, ' - Ciclo A'; 
			headTitle: 'Ciclo A'; 
			localEnvironment: self bookEnvironmentPage;
			filename: 'bookA';
			load;
			yourself
	]. 
]

{ #category : #pages }
PRLCFDistribution >> bookB [
	^ bookB ifNil: [ 
		bookB := (LCFBookCicle named: 'ciclob')
			title: self headTitle, ' - Ciclo B'; 
			headTitle: 'Ciclo B'; 
			localEnvironment: self bookEnvironmentPage;
			filename: 'bookB';
			load;
			yourself
	]. 
]

{ #category : #pages }
PRLCFDistribution >> bookC [
	^ bookC ifNil: [ 
		bookC := (LCFBookCicle named: 'cicloc')
			title: self headTitle, ' - Ciclo C'; 
			headTitle: 'Ciclo C'; 
			localEnvironment: self bookEnvironmentPage;
			filename: 'bookC';
			load;
			yourself
	]. 
]

{ #category : #pages }
PRLCFDistribution >> bookCeleb [
	^ bookCeleb ifNil: [ 
		bookCeleb := (LCFBookCelebrations  named: 'celebraciones')
			title: self headTitle, ' - Celebraciones'; 
			headTitle: 'Celebraciones'; 
			localEnvironment: self bookEnvironmentPage;
			loadFrom: self books;
			yourself
	]. 
]

{ #category : #pages }
PRLCFDistribution >> bookCommands [
	^ bookCommands ifNil: [ 
		bookCommands := (LCFBookCommandments named: 'mandamientos')
			title: self headTitle, ' - Los 10 Mandamientos'; 
			headTitle: '10 Mandamientos'; 
			localEnvironment: self bookEnvironmentPage;
			filename: 'book10C';
			load;
			yourself
	]. 
]

{ #category : #enviroments }
PRLCFDistribution >> bookEnvironmentPage [
	^ bookEnvironmentPage ifNil: [
		bookEnvironmentPage := (PRPage named: 'bookenvironment')
		title: '_Book Environment';
		addChild: self headerBooksPage ;
		localEnvironment: self metaEnvironmentPage;
		contents: 
'{{{<div class="container">
	}}}+/system/components/header+
          +headerbooks+
	{{{

	<div class="column span-20 last mainbody">
		<div class="postticker column prepend-0 span-6">}}}+/system/components/sidechaptertree+{{{</div>
		<div class="contents column prepend-0 span-14 last">}}}+/system/components/contents+{{{</div>
	</div>
	}}}+/system/components/footer+{{{
</div>}}}
+/system/components/googleanalytics+
';
		yourself
	]
]

{ #category : #accessing }
PRLCFDistribution >> books [
	^ { self bookA. self bookB. self bookC. self bookCommands }
]

{ #category : #accessing }
PRLCFDistribution >> buildGroups [ 
	{ PUGroup named: 'corrector'. PUGroup named: 'traductor'. PUGroup named: 'registered' } do: [ :each |
		self kernel groups add: each.
	]
]

{ #category : #structures }
PRLCFDistribution >> buildUsers [
	LCFLoadUsers buildUsers: self kernel.
]

{ #category : #pages }
PRLCFDistribution >> changesPage [
	^ changesPage ifNil: [
		changesPage := (LCFChanges named: 'changes') 
			title: self headTitle, ' - Cambios'; 
			localEnvironment: self homeEnvironmentPage;
			yourself.
	]
]

{ #category : #accessing }
PRLCFDistribution >> chapters [
	^ self bookA chapters, self bookB chapters, self bookC chapters, self bookCommands chapters
]

{ #category : #pages }
PRLCFDistribution >> ciclosPage [
	^ ciclosPage ifNil: [
		ciclosPage := (LCFCiclos named: 'ciclos') 
			title: self headTitle, ' - Ciclos'; 
			localEnvironment: self bookEnvironmentPage;
			yourself.
	]
]

{ #category : #pages }
PRLCFDistribution >> colaborarPage [
	^ colaborarPage ifNil: [
		colaborarPage := (PRPage named: 'colaborar') 
			title: self headTitle, ' - Colaborar'; 
			localEnvironment: self homeEnvironmentPage;
			contents: 
'Para poder colaborar es necesario registrarse, por favor siga los pasos indicados en *Contacto>/contacto*.

Una vez obtenido un usuario y habiéndose logeado en el sitio podrá observar controles al lado de cada párrafo editable.

|Use|+http://lcf.seasidehosting.st/resources/edit.png+|para acceder al diálogo de edición del párrafo adyacente.|

El diálogo le ofrecerá el texto del párrafo en inglés, una tradución automática aproximada del texto realizada por el traductor de google y un cuadro de edición en el que introducir el texto en castellano correspondiente.

Luego puede aceptar o cancelar.

|Use|+http://lcf.seasidehosting.st/resources/flag_red.png+|para asentar un comentario para el corrector.|

Se ofrecerá un cuadro de texto en el que ingresar el comentario y un panel con la historia de comentarios anteriores y sus autores.

Puede usar el boton "Agregar" para incluir su comentario en la historia o presionar la tecla Esc para abandonar el diálogo.
'; yourself.
	]
]

{ #category : #pages }
PRLCFDistribution >> commentsPage [
	^ commentsPage ifNil: [
		commentsPage := (LCFComments named: 'comments') 
			title: self headTitle, ' - Comentarios'; 
			localEnvironment: self homeEnvironmentPage;
			yourself.
	]
]

{ #category : #pages }
PRLCFDistribution >> contactoPage [
	^ contactoPage ifNil: [
		contactoPage := (PRPage named: 'contacto') 
			title: self headTitle, ' - Contacto'; 
			localEnvironment: self homeEnvironmentPage;
			contents: 
'La *Comunidad Barat>http://www.comunidadbarat.org/* le da la bienvenida a este emprendimiento comunitario.

Para poder colaborar es necesario registrase gestionando una cuenta que le permita interactuar en el sitio.
Una vez logeado podrá navegar los capítulos e ir traduciendo los párrafos.

Para poder realizar esta operación y obtener un usuario por favor escriba a emilioOca@gmail.com
'; yourself.
	]
]

{ #category : #structures }
PRLCFDistribution >> efoWidget [
	^ (PRComponent named: 'transPair')
		title: 'Translation Pair';
		componentClass: LCFPairWidget;
		yourself
	
]

{ #category : #enviroments }
PRLCFDistribution >> environmentPage [
	^ environmentPage ifNil: [
		environmentPage := (PRPage named: 'environment')
		title: '_Environment';
		contents: 
'{{{<div class="container">
	}}}+/system/components/header+{{{
	<div class="column span-20 last mainbody">
		<h1 class="heading">}}}+>value:structure|level=2+{{{</h1>
		<h1>}}}+>value:structure|level=0|lower=3+{{{</h1>
		<div class="column span-14 contents">
			}}}+/system/components/contents+{{{
		</div>
		<div class="column span-6 prepend-6 last sidebar">
			<h2>Navigation</h2>
			}}}+/system/components/children+{{{
		</div>
	</div>
	}}}+/system/components/footer+{{{
</div>}}}
+/system/components/googleanalytics+
';
		yourself
	]
]

{ #category : #pages }
PRLCFDistribution >> footerPage [
	^ footerPage ifNil: [
		footerPage := (PRPage named: 'footer')
		contents:
'{{{<div class="footer column span-20 last">
	<div class="column span-18">
		}}}
		{{{
		<div class="commands">}}}+/system/components/commands+{{{</div>
		<div class="views">}}}+/system/components/views+{{{</div>
		<div class="sitemap">}}}+/system/components/sitemap+{{{</div>
	</div>
	<div class="column span-6 last">}}}+/system/components/poweredby+{{{</div>
</div>}}}';
		yourself
	]
]

{ #category : #pages }
PRLCFDistribution >> glosarios [
	^ glosarios ifNil: [ 
		glosarios := (LCFGlosarios named: 'glosarios')
			title: self headTitle, ' - Glosarios'; 
"			headTitle: 'Glosarios'; "
			localEnvironment: self homeEnvironmentPage;
			yourself
	]. 
]

{ #category : #pages }
PRLCFDistribution >> headTitle [
	^ 'Lights, Camera, Faith!'.
]

{ #category : #headers }
PRLCFDistribution >> headerBooksPage [
	^ (PRPage named: 'headerbooks')
		addChild: self menuBooksPage;
		contents:
'{{{
<div class="column span-20 last header">
	<div class="menu">
		}}}+menubooks+{{{
	</div>
</div>

}}}';
		yourself
]

{ #category : #headers }
PRLCFDistribution >> headerPage [
	^ headerPage ifNil: [
		headerPage := (PRPage named: 'header')
		addChild: ((PRComponent named: 'pc') componentClass: LCFProximoChapter; yourself);
		addChild: self logStatusUserPage;
		addChild: self menuPage;
		contents:
'{{{
<div class="header">
	<div class="contents" style="float: right; margin: 10px;" >
		}}}+logStatusUser+{{{
	</div>
	<div class="postticker">
		<center>}}}+>pc+{{{</center>
	</div>
	<div class="column span-20 last header">
		<div class="menu">
			}}}+menu+{{{
		</div>
	</div>
</div>
}}}';
		yourself
	]
]

{ #category : #headers }
PRLCFDistribution >> headerProgressPage [
	^ (PRPage named: 'headerprogress')
		addChild: self menuProgressPage;
		contents:
'{{{
<div class="column span-20 last header">
	<div class="menu">
		}}}+menuprogress+{{{
	</div>
</div>

}}}';
		yourself

]

{ #category : #enviroments }
PRLCFDistribution >> homeEnvironmentPage [
	^ homeEnvironmentPage ifNil: [
		homeEnvironmentPage := (PRPage named: 'homeenvironment')
		title: '_Home Environment';
		localEnvironment: self metaEnvironmentPage;
		contents: 
'{{{<div class="container">
	}}}+/system/components/header+{{{
	<div class="column span-20 last mainbody">
		<div class="contents">}}}+/system/components/contents+{{{</div>
	</div>
	}}}+/system/components/footer+{{{
</div>}}}
+/system/components/googleanalytics+
';
		yourself
	]
]

{ #category : #pages }
PRLCFDistribution >> introduccionPage [
	^ (PRPage named: 'introduccion') 
			title: self headTitle, ' - Introducción'; 
			localEnvironment: self homeEnvironmentPage;
			contents: '!Prólogo

''''Algunos somos cientificos. Algunos matemáticos. Algunos, filósofos. Todos somos narradores. Nos gusta escuchar y contar historias.''''

''''Cuando la Palabra se hizo carne, Jesús apareció en la Tierra, alguno dirá en forma de historia. El nació. El vivió tranquilamente en Nazaret antes de embarcarse en la misión de predicar las noticias de Dios sobre arrepentimiento, el perdón de los pecados y la venida de Dios en la Tierra. Él sufrió, murió y, como una dimension nueva en la historia humana, resucitó de entre los muertos. Con la muerte, aceptó la voluntad de su Padre, y su Padre, al recibirlo, como muestra de amor, lo volvió a la vida.''''

''''Esa es nuestra historia Cristiana.''''

''''Domingo a domingo, festividad tras festividad, escuchamos los capítulos de esa historia. A veces nos parece familiar. A veces un poco diferente. Debemos tener la posibilidad de abrir las escrituras para un entendimiento mayor y poder profundizar nuestra fe.''''

''''"¡Luz, Cámara, Fé!" esta diseñado para ayudarnos a apreciar las historias del Evangelio y otras lecturas que han sido seleccionadas para acompañarlas. Como método, se toman películas populares, y se crea un dialogo entre dichas películas y los Evangelios. La historia de una película y los temas pueden iluminar el Evangelio, a veces en forma de paralelismo, en otras ocasiones como un contraste. La historia del Evangelio nos puede ayudar a encontrar niveles mas profundos en el significado de la película.''''

...

MSC Peter Malone'; yourself.
]

{ #category : #accessing }
PRLCFDistribution >> kernel [
	^ kernel ifNil: [
		kernel := PRKernel named: 'Comunidad Barat'.
		kernel root: self root.
		kernel
	]
]

{ #category : #render }
PRLCFDistribution >> latex [
"	self latexOn: 'LCF', FileDirectory pathNameDelimiter asString, self name, '.tex'."
	| file |
	[ 
		file  := MultiByteFileStream forceNewFileNamed: ( LightVariables rootPath, 'LCF/tex/lcf.tex' ).
		file nextPutAll: self latexLCFHeader.

		self books do: [ :each |
			file nextPutAll: '\part{', each headTitle, '}'; cr; 
"			nextPutAll: '\addcontentsline{toc}{part}{', each headTitle, '}'; cr;" cr.
			each chapters select: [ :chap | 
				chap translationProgress > 60.
			] thenDo: [ :chap | 
				chap latexOn: file.
			].
		].
		
		file nextPutAll: '

\end{document}
'.

	] ensure: [file close].
]

{ #category : #render }
PRLCFDistribution >> latexLCFHeader [.
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

{ #category : #pages }
PRLCFDistribution >> logStatusUserPage [

	^ (PRPage named: 'logStatusUser') 
		addChild: ((PRComponent named: 'widget') componentClass: LCFUserStatus; yourself);
		addChild: ((PRComponent named: 'userCommnads')
						title: 'Just Logout Command';
						componentClass: PRCommandsWidget;
						write: {PULogout. PULogin. LCFSave. LCFLoad. LCFLoadUsers } 
									using: PRCommandsWidget new descriptionCommandClasses ;
						yourself);
		contents: '+widget+ {{{
		<div class="userCommandMenu" style="max-width: 120px;">
			}}}+userCommnads+ {{{
		</div>
		}}}';
		yourself

]

{ #category : #enviroments }
PRLCFDistribution >> mainEnvironmentPage [
	^ mainEnvironmentPage ifNil: [
		mainEnvironmentPage := (PRPage named: 'mainenvironment')
		title: '_Main Environment';
		localEnvironment: self metaEnvironmentPage;
		contents: 
'{{{<div class="container">
	}}}+/system/components/header+{{{
	<div class="column span-20 last mainbody">
		<div class="contents column span-12">}}}+/system/components/contents+{{{</div>
		<div class="postticker column prepend-0 span-6 last">
			}}}
 			+/system/components/logStatusUser+


			+/system/components/sidechaptertree+
			{{{
		</div>
	</div>
	}}}+/system/components/footer+{{{
</div>}}}
+/system/components/googleanalytics+
';
		yourself
	]
]

{ #category : #accessing }
PRLCFDistribution >> makeCorrector: aStructure [

	aStructure securityDecoration owner: (self kernel userNamed: 'admin' ifNone: []).
	aStructure securityDecoration otherPermissions: Set new.
	aStructure securityDecoration group: (self kernel groupNamed: 'corrector' ifNone: []).

]

{ #category : #accessing }
PRLCFDistribution >> makeLogged: aStructure [

	aStructure securityDecoration owner: (self kernel userNamed: 'admin' ifNone: []).
	aStructure securityDecoration otherPermissions: Set new.
	aStructure securityDecoration group: (self kernel groupNamed: 'registered' ifNone: []).

]

{ #category : #accessing }
PRLCFDistribution >> makeUsable: aStructure [

	aStructure securityDecoration owner: (self kernel userNamed: 'admin' ifNone: []).
	aStructure securityDecoration otherPermissions: Set new.
	aStructure securityDecoration group: (self kernel groupNamed: 'admin' ifNone: []).

]

{ #category : #headers }
PRLCFDistribution >> menuBooksPage [
	^ (PRPage named: 'menubooks')
			contents:
'- *Ciclo A>/cicloa*
- *Ciclo B>/ciclob*
- *Ciclo C>/cicloc*
- *Celebraciones>/celebraciones*
- *10 Mandamientos>/mandamientos*
';
			yourself
		

]

{ #category : #headers }
PRLCFDistribution >> menuPage [
	^ (PRPage named: 'menu')
			contents:
'- *Home>/*
- *Libros>/ciclos*
- *Glosarios>/glosarios*
- *Avance>/progress*
- *Proyecto>/proyecto*
- *Colaborar>/colaborar*
- *Contacto>/contacto*

- *Cambios>/changes*
- *Comentarios>/comments*
- *Usuarios>/sessions*
- *About>/about*
';
			yourself 
		

]

{ #category : #headers }
PRLCFDistribution >> menuProgressPage [
	^ (PRPage named: 'menuprogress')
			addChild: ((PRComponent named: 'progressCommnads')
						title: 'Progress selection Commands';
						componentClass: PRCommandsWidget;
						write: {LCFProgresA. LCFProgresB. LCFProgresC. LCFProgres10C } 
									using: PRCommandsWidget new descriptionCommandClasses ;
						yourself);

			contents:
			'+progressCommnads+'
"'- *Ciclo A>/progressa*
- *Ciclo B>/progressb*
- *Ciclo C>/progressc*
'";
			yourself.
		

]

{ #category : #enviroments }
PRLCFDistribution >> metaEnvironmentPage [
	^ metaEnvironmentPage ifNil: [
		metaEnvironmentPage := (PRPage named: 'metaenvironment')
		title: '_Meta Environment';
"		hideFromMenus: true;"
		contents: '{{{<div class="container metaenvironment">
	<div class="span-20 last metaheader">
		Meta page: }}}+/system/components/breadcrumb+{{{
	</div>
	<div class="span-20 last">
		}}}+/system/components/contents+{{{
	</div>
	<div class="span-20 last metafooter">
		<div class="span-10">}}}+/system/components/commands+{{{</div>
		<div class="span-10 last">}}}+/system/components/sitemap+{{{</div>
	</div>
</div>}}}';
		yourself
	]
]

{ #category : #structures }
PRLCFDistribution >> nextChapter [
	^ nextChapter ifNil: [
		nextChapter := (PRComponent named: 'proximocapitulo')
		title: 'Proximo capitulo';
		componentClass: LCFProximoChapter;
		yourself
	]
]

{ #category : #pages }
PRLCFDistribution >> peterPage [
	^ (PRPage named: 'peterMalone') 
			title: self headTitle, ' - Peter Malone Bio'; 
			localEnvironment: self homeEnvironmentPage;
			contents: 'Nota: El *website de Peter Malone>http://www.signis.net/malone/* 
contiene comentarios sobre varios cientos de films, sus críticas desde 2009, 
posiciones de SIGNIS sobre algunos films particulares, 
entrevistas con directores Australianos y 
el SIGNIS Film Reviewing Project.

|""Peter Malone""|+http://www.signis.net/malone/img/wiki_up/Malone.jpg+|
!!!CV/Breve


;Nacido
:Sydney, NSW, Australia, 8th August 1939.<br>
;Educacion
:Bowral, NSW.
;Orden Sacerdotal
:Rome, 3rd April, 1965.


!Estudios
;Arts Degree MA Qual
:(Australian History), Australian National University, Canberra, 1960-8:
;Theology Degree
:Gregorian, Rome, 1962-6.
;Honorary Doctorate in Theology
:Melbourne, College of Divinity, Australia, 2008.


!Academia
;Daramalan College
:Canberra (High School), 1966-7, 1970.
;Theology and Scripture
:Canberra, 1968-71
;Theology and Scripture
:Yarra Theological Union (Melbourne College of Divinity) 1972-1998
;National Pastoral Institute
:Melbourne, 1973-1988,(including Diploma in Social Communications).
;Director
:Australian Catholic Film Office, 1996-8

;OCIC (Organisation Catholique Internatiionale du Cinema)
:Pacific region, President, 1989-1998.
:Directors'' Committee, 1990-1998.
:World President, 1998-2001
:Contributor to Cine & Media

;SIGNIS (The World Catholic Association for Cinema)
:World President, 2001-2005
:Cinema Desk, director 2006-2010
:Cinema desk, member 2010
:Contributor to SIGNIS Media

!Publicaciones

!!Libros
-The Film, Chevalier Press, Sydney, 1971.
-The Writing on the Wall, Westbooks, Perth, 1973 and 1978.
-200 Movies and Discussions I, Chevalier Press, Sydney, 1973.
-200 Movies and Discussions II, Chevalier Press, Sydney, 1975.
-Films and Values, Chevalier Press, Melbourne, 1978
-The Mystery of Christ, a course introducing theology, Y.T.U., Melbourne, 1983.
-Video at Home, ACTS, Melbourne, 1985.
-Nuclear Films, Spectrum, Melbourne, 1985.
-In Black and White and Colour, Aborigines in Australian Feature Films, Spectrum, Melbourne, 1987.
-Let a Viking Do it, Hagar and Family Illustrate the Myers Briggs Type Indicator, Collins Dove, Melbourne, 1988.
-Movie Christs and Antichrists, Parish Ministry Publications, Sydney, 1988; Crossroad, New York, 1990.
-Discovering an Australian Theology, co-ordinator, St Paul Publications, Sydney, 1988.
-The Australian Video Guide, Collins Dove, Melbourne, 1990.
-Traces of God, Collins Dove, Melbourne, 1991.
-Myers Briggs Goes to the Movies, Spectrum, Melbourne, 1991.
-Worth Watching: 30 Film Reviewers on Review, co-ordinator, Spectrum, Melbourne, 1994.
-Cinema Down Under, Australian Films at Home and to the World, OCIC, Brussels, 1996.
-Mirror, Mirror on the Screen, Type Resources, Gaithersberg, Md. 1996.
-From Back Pews to Front Stalls, Australian Feature Films in 100 years of Cinema, Co-ordinator, Chevalier Press, Sydney, 1996.
-Cinema, Religion and Values, OCIC, Brussels, 1999.  (French version: Festivals et Jurys. Criteres pour l''Attribution des prix).
-Developing an Australian Theology, St Paul Publications, Sydney, 1999.
-The Same as Christ Jesus, Gospel and Type, St Paul Publications, London, 2000.
-My Names,  Nelen Yubu, Sydney, 2000.
-Myth and Meaning, Australian directors in their own words, Currency Press, Sydney, 2001.
-Lights... Camera... Faith... A Movie Lectionary, Cycle A, Pauline Media, Boston, 2001.
-On Screen, Pauline Media, Manila, 2001.
-Lights... Camera... Faith... A Movie Lectionary, Cycle B, Pauline Media, Boston, 2002.
-Lights... Camera... Faith... A Movie Lectionary, Cycle C, Pauline Media, Boston, 2003.
-Can Movies be a Moral Compass? WACC, London, 2005.
-Lights...Camera... Faith...  The Ten Commandments, Pauline Media, Boston, 2006.
-Through a Catholic Lens (editor),  Rowman and Littlefield, 2007.
-Film and Faith,  CFA, Manila, 2008.
-Film and Faith and the Church, CFA, Manila, 2009.
-The Emergence of SIGNIS, Brussels, 2009
-Faith and Sacraments, CFA, Manila, 2011
-Jesus... According to the Scriptures, Chevalier Press, Sydney, 2011
-Film and Mary, CFA, Manila, 2012


!!Algunos Artículos
;Christology in the Suburbs: Edward Scissorhands
:in Explorations in Theology and Film, eds, Marsh, Ortiz, Blackwells, Oxford, 1997.
;Jesus on Screen
:in New Images of Religious Film, ed. John R. May, Sheed and Ward, Kansas City, 1997.
;Religion
:in The Oxford Companion to Australian Film, eds. McFarlane, Meyer, Bertrand, OUP, Melbourne, 1999.
;The Roman Catholic Church and Cinema (1967 to the present
:in The Routledge Companion to Religion and Film, ed. John Lyden, London and New York, 2009.
;Catholic Movies
:in The Continuum Companion to Religion and Film, ed. William Blizek, London, 2009.



!Jurado en Festivales de Cine y Video

;Melbourne International Film Festival
:President of OCIC jury for Annual Award for Short Australian Film, from 1992-1998
:Member of Festival Jury, 1994

;3rd World Religious and Educational Videomarket and
:Videoforum, Drieburgen, Holland, 1992,  
:President of Jury.

;4th World Religious and Educational Videomarket and
:Videoforum, Cologne, Germany, 1996,
:President of Jury.

;European Religious and Educational Videomarket and
:Videoforum, Vilnius, Lithuania, 2000,
:President of Jury.

;Venice Film Festival,
:Member of OCIC jury, 1993, 1994, 1996.
:President of OCIC Jury, 1999, 2000,
:SIGNIS Jury, 2002, 2003, 2004, 2006, 2007. Member, 2008, 2009.

;Berlin Film Festival,
:Member of Ecumenical Jury, 1995,
:President of Ecumenical Jury, 1999.

;Turnhout Film Festival, Focus on the South,
:President of OCIC Jury, 1999.

;Cannes Film Festival,
:President of Ecumenical Jury, 2000.
:President of Future Talents Jury, Semaine de la Critique, 2001.
:President of Ecumenical Jury, 2004

;Troia Film Festival,
:President of OCIC Jury, 2001.

;Montreal Film Festival,
:President of Ecumenical Jury, 2001.
:Member of Jury, 2005.

;Infinity Festival, Alba,
:President of SIGNIS Jury, 2002

;Fajr Film Festival, Tehran,
:President''s award, 2002,
:President of INTERFAITH Jury, 2003, 2004, 2007.
:Member of Spirituality Cinema Jury, 2005, 2008.  

;Hong Kong International Film Festival.  
:President of SIGNIS Jury, 2004

;Dhaka International Film Festival.  
:President of Festival International Jury,
:SIGNIS award.  2006, 2010, 2012.

;Zanzibar International Film Festival,
:President of SIGNIS Jury, 2005, 2006.

;Golden Apricot Festival, Yerevan, Armenia.
:Member of Ecumenical Jury, 2007.

;BAFICI, Buenos Aires, Argentina.
:Member of SIGNIS Jury, 2008.

;Molodist Festival, Kiev, Ukraine.
:President of Ecumenical Jury, 2008.

;Washington International Film Festival.
:Member of SIGNIS Jury, 2009.

;Havana International Film Festival.
:Member of SIGNIS Jury, 2009.'; yourself.
]

{ #category : #enviroments }
PRLCFDistribution >> progressEnvironmentPage [
	^ progressEnvironmentPage ifNil: [
		progressEnvironmentPage := (PRPage named: 'progressenvironment')
		title: '_Book Environment';
		addChild: self headerProgressPage ;
		localEnvironment: self metaEnvironmentPage;
		contents: 
'{{{<div class="container">
	}}}+/system/components/header+
          +headerprogress+{{{
	<div class="column span-20 last mainbody">
		}}}+/system/components/contents+{{{
	</div>
	}}}+/system/components/footer+{{{
</div>}}}
+/system/components/googleanalytics+
';
		yourself
	]
]

{ #category : #pages }
PRLCFDistribution >> progressPage [
	^ progressPage ifNil: [
		progressPage := (LCFProgress named: 'progress') 
			title: self headTitle, ' - Progress'; 
			localEnvironment: self progressEnvironmentPage;
			yourself.
	]
]

{ #category : #pages }
PRLCFDistribution >> proyectoPage [
	^ proyectoPage ifNil: [
		proyectoPage := (PRPage named: 'proyecto') 
			title: self headTitle, ' - Proyecto'; 
			localEnvironment: self homeEnvironmentPage;
			contents: 
'Este proyecto surge en el seno de la *Comunidad Barat>http://www.comunidadbarat.org/* con la intención de acercar a sus miembros el anuncio de la Palabra desde los medios audio visuales.

Colaborando desinteresadamente logramos desarrollar este espacio, que ahora abrimos a todas las comunidades, y tiene como finalidad la traducion de los textos y su compilación final en español en un docuemto electrónico que pueda ser descargado libremente y sin fines de lucro.

Peter Malone, sacerdote, crítico de cine y autor de los tres libros, cedió generosamente los textos originales y dió su autorización para la publicacion final en español.

Para poder colaborar es necesario registrase, por favor siga los pasos indicados en *Contacto>/contacto*.

'; yourself.
	]
]

{ #category : #pages }
PRLCFDistribution >> register [ 
	| app authConf config |
	PRKernel reset.
	self kernel adminUser password: 'adminLcf'.
	app := ( PRPierFrame 
				registerAsApplication: 'lcf'
				kernel: self kernel).

	"segurizamos la app de configuracion"
	self secureConfig: ( app parent handlerAt: 'config' ) user: 'adminLcf' pass: 'lcf'.
	
	" se configura como default"
	app parent defaultName: app name.
	
	app preferenceAt: #sessionClass put: LCFSession.
	app preferenceAt: #resourceBaseUrl put: 'http://lcf.seasidehosting.st/resources/'.
	app preferenceAt: #serverPath put: '/lcf'. 
	

	"scriptaculous"				 "
	app addLibrary: PTDeploymentLibrary .
	app addLibrary: SUDeploymentLibrary .
	app addLibrary: SUAllTestLibrary."

	"jQuery"
	app addLibrary: JQDeploymentLibrary.
"	app addLibrary: JQUiDeploymentLibrary. " "ya incluida en LCFDeploymentLibrary"

	app addLibrary: LCFDeploymentLibrary.
	

]

{ #category : #structures }
PRLCFDistribution >> root [
	self rootPage
		addChild: self bookCommands;
		addChild: self bookA;
		addChild: self bookB;
		addChild: self bookC;
		addChild: self bookCeleb;
		addChild: self ciclosPage;
		addChild: self glosarios;
		addChild: self contactoPage;
		addChild: self colaborarPage;
		addChild: self proyectoPage;
		addChild: self progressPage;
		addChild: self sessionsPage;
		addChild: self changesPage;
		addChild: self commentsPage;
		addChild: self aboutPage;
		addChild: (self systemPage
			addChild: (self componentsPage
				addChild: self nextChapter;
				addChild: self headerPage;
				addChild: self siteTitlePage;
				addChild: self footerPage;
				addChild: self childrenWidget;
				addChild: self breadcrumbWidget;
				"addChild: self googleAnalyticsWidget;
				"addChild: self sitemapPage;
				addChild: self viewsPage;
				addChild: self commandsPage;				
				addChild: self loginCommandWidget;
				addChild: self contentsWidget;
" 				addChild: self stylesheetFile;
"		 		addChild: self postTickerWidget;
				addChild: self searchWidget;
				addChild: self poweredPage;
				addChild: self designChooserWidget;
				addChild: self documentWidget;
				addChild: self efoWidget;"
				addChild: self sidechaptertreeWidget;"
				yourself);
			addChild: self systemManagementPage;
			addChild: (self templatesPage
				addChild: self environmentPage;
				addChild: self mainEnvironmentPage;
				addChild: self bookEnvironmentPage;
				addChild: self homeEnvironmentPage;
				addChild: self metaEnvironmentPage;
				addChild: self progressEnvironmentPage;
				yourself
			);
			yourself
		).
	self environmentPage localEnvironment: self metaEnvironmentPage.
	self metaEnvironmentPage localEnvironment: self metaEnvironmentPage.
	self systemManagementPage localEnvironment: self metaEnvironmentPage.
	self rootPage enumerator
		with;
		all;
		do: 
			[ :each | 
			each securityDecoration owner: self kernel users anyOne.
			each securityDecoration group: self kernel groups anyOne ].
	self makePrivate: self systemPage.
	self makePrivate: self environmentPage.
	self makePrivate: self mainEnvironmentPage.
	self makePrivate: self metaEnvironmentPage.
	self makePrivate: self sitemapPage.
	self makePrivate: self viewsPage.
	self makePrivate: self commandsPage.
	self makePrivate: self systemManagementPage.
	
	self buildGroups.
	self buildUsers.

	self makeCorrector: self commentsPage.
	self makeCorrector: self changesPage.
	self makeLogged: self sessionsPage.
	self makeLogged: self aboutPage.

" 	self makePrivate: self logcommandsPage.
 	self makePrivate: self loggedInUserPage.
"  
	^ self rootPage
]

{ #category : #pages }
PRLCFDistribution >> rootPage [
	^ rootPage ifNil: [
		rootPage := (PRPage named: 'lcf')	
			title: self headTitle; 
			propertyAt: 'distro' put: self;
			addChild: self peterPage;
			addChild: self introduccionPage;
			localEnvironment: self homeEnvironmentPage;
			contents:
'A través de este sitio nos encontramos con la obra del padre Peter Malone 
"¡Luz, Cámara, Fe!" editados en tres tomos correspondientes 
a los ciclos litúrgicos: *ciclo A>/cicloa*, *ciclo B>/ciclob* y *ciclo C>/cicloc* y 
un cuarto libro sobre los *10 mandamientos>/mandamientos*.

Cada uno de los volúmenes cuenta con una amplia lista de películas que se sugieren una a una para cada domingo o momento especial del año, con la sinopsis del filme, un comentario a modo de reflexión y oración final entrando de este modo en un diálogo profundo entre la propuesta cinematográfica, la realidad que nos interpela y la Palabra de Dios.

Los libros *(ver introducción)>introduccion* están escritos originalmente en inglés, siga estos enlaces para encontrarlos con su portada original.

- *Lights, Camera, Faith!: A Movie Lectionary Guide to Scripture, Cycle A> http://www.amazon.com/Lights-Camera-Faith-Lectionary-Scripture/dp/081984490X/*
- *Lights, Camera, Faith!: A Movie Lectionary Guide to Scripture, Cycle B> http://www.amazon.com/Lights-Camera-Faith-Lectiomary-Scripture/dp/0819844926/*
- *Lights, Camera, Faith!: A Movie Lectionary Guide to Scripture, Cycle C> http://www.amazon.com/Lights-Camera-Faith-Lectionary-Scripture/dp/0819845019/*
- *Lights, Camera, Faith! - The Ten Commandments> http://www.amazon.com/Lights-Camera-Faith-The-Commandments/dp/0819845205/*

*MSC Peter Malone>peterMalone*  ha cedido sus textos para que sean traducidos y
compaginados en español a través de un trabajo colectivo de evangelización, con
el objeto de que el producto final pueda ser descargado y distribuido en forma gratuita y sin fines de lucro.

¿Cómo puedo ayudar en la traducción?
Por ejemplo, cada uno de los tres primeros libros se corresponde con un ciclo litúrgico (*Ciclo A>/cicloa*, *Ciclo B>/ciclob*, *Ciclo C>/cicloc*). 
En ellos hay un capítulo por cada fiesta, o tiempo durante el año. Al presionar sobre ese tiempo litúrgico, se expande un listado de las películas que corresponden a cada domingo de ese tiempo. Si nos posicionamos sobre una de las películas, hallaremos la ficha técnica, comentario, semblanza con la Palabra, oración y reflexión, separados en párrafos para que el texto pueda ser traducido en su totalidad o por párrafos, de modo que el colaborador pueda moderar su trabajo dentro de sus posibilidades reales de tiempo.

Quien no pueda colaborar con la traducción puede consultar los textos ya traducidos o descargar documentos con esas versiones castellanas y aprovecharlos en su actividad diaria.

Para poder colaborar (*Cómo colaborar>/colaborar*) es necesario registrarse en el sitio a través de la
página de contacto (*Contacto>/contacto*) y así obtener una cuenta que le permitirá inscribirse en el
sitio y traducir los párrafos que se encuentren disponibles para dicha traducción.'; yourself.

	]
]

{ #category : #pages }
PRLCFDistribution >> secureConfig: config user: user pass: pass [
	| authConf |

	authConf := WAAuthConfiguration instance.
	
	(config configuration parents includes: authConf) ifFalse: [ 
		config configuration addParent: authConf.
		config addFilter: WAAuthenticationFilter new.
	].

	config preferenceAt: #login put: user;
                 preferenceAt: #passwordHash put: ( GRPlatform current secureHashFor: pass ).
				

]

{ #category : #pages }
PRLCFDistribution >> sessionsPage [
	^ sessionsPage ifNil: [
		sessionsPage := (LCFSessions named: 'sessions') 
			title: self headTitle, ' - Usuarios'; 
			localEnvironment: self homeEnvironmentPage;
			yourself.
	]
]

{ #category : #structures }
PRLCFDistribution >> sidechaptertreeWidget [
	^ sidechaptertreeWidget ifNil: [
		sidechaptertreeWidget := (PRComponent named: 'sidechaptertree')
		title: 'Side Chapter Tree';
		componentClass: LCFSideChapterTree;
		write: self book using: LCFSideChapterTree descriptionBook;
		yourself
	]
]

{ #category : #structures }
PRLCFDistribution >> stylesheetFile [
	^ stylesheetFile ifNil: [
		stylesheetFile := (PRFile named: 'defaultCss')
		filename: 'style.css';
		mimetype: 'text/css';
		contents: 
'/* HEADER */
.icon a {outline: none; background: white;}
.search input.text {
	border: 1px solid white;
	color: black;}
.search input.text:focus {
	border: 1px solid #ff6633;
	color: black;}
.search input {
	color: #ff6633;
	font-size: 1em;
	outline: none;
	width: 98%;
	border: 0;
	margin-top: 0.1em;
	padding: 0.3em;
	padding-top: 0;
	background: 0;}
.search ul {
	margin: 0;
	padding: 0;
	background: white;
	list-style-type: none;
	border: 1px solid #ff6633;
	border-top: 0;}
.search li.selected a {color: #fff;}
.search li.selected {
	background-color: #ff6633;
	color: white;}
.search li {
	margin: 0;
	display: block;
	padding: 0.2em;
	cursor: pointer;
	list-style-type: none;}
.menu ul {
	margin: 0;
	margin-top: 0.2em;
	padding-bottom: 0.2em;
	list-style-type: none;}
.menu ul li {
	display: inline;
	margin: 0;
	margin-right: 1.5em;
	list-style-type: none;}
.menu li a {
	padding-left: 0.3em;
	padding-right: 0.3em;
	padding-top: 0.5em;
	padding-bottom: 0.3em;}
.menu li a.active {
	color: white;
	background: #ff6633;}

.userCommandMenu ul {
	margin: 0;
	margin-top: 0.2em;
	padding-bottom: 0.2em;
	margin-bottom: 1em;
	list-style-type: none;}
.userCommandMenu ul li {
	display: inline;
	margin: 0;
	margin-right: 0.9em;
	list-style-type: none;}

/*BLOG*/
div.post {margin-bottom: 4.5em;}
div.comment {margin-bottom: 3em;}
.meta {font-size: 80%; color: #aaa;}
.leavecomment {margin-top: 4.5em; margin-bottom: 4.5em;}
.comments {margin-top: 4.5em;}


/* NAVIGATION */
.sidebar ul {
	margin-top: 0;
	margin-left: 0;
	list-style-type: none;}
.sidebar ul ul {
	margin-bottom: 0;
	margin-left: 1.5em;}
.sidebar ul li {
	margin-top: 1.5em;}
.sidebar ul li a {
	padding-left: 0.3em;
	padding-right: 0.3em;
	padding-top: 0.3em;
	padding-bottom: 0.3em;}
.sidebar p,
.sidebar h1, .sidebar h2, .sidebar h3,
.sidebar .postticker .timestamp,
.sidebar .postticker .summary {padding-left: 0.3em;}
.sidebar .active,

/*MAIN BODY*/
.mainbody {
	padding-top: 4em;
	padding-bottom: 15em;}
.postticker ul {
	font-size: 80%;
	color: #aaa;
	list-style: none;
	margin-left: 0;}
.postticker ul li {
	margin-bottom: 1.5em;}
.postticker .timestamp {color: #aaa; font-size: 80%;}
.postticker .subscribe,
.postticker .timestamp .time,
.postticker .timestamp .author {display: none;}
.postticker a.post {color: #aaa;}


/* FOOTER */
.footer {
	color: #aaa;
	font-size: 80%;
	text-align: left;}
.footer a { color: #aaa;}
.footer ul {list-style: none; margin-left: 0em;}
.footer ul ul {margin-left: 1.5em;}
.footer .commands ul, .footer .views ul {display: inline;}
.footer .commands ul li, .footer .views ul li {display: inline; padding-right: 1em;}


/* META */
.metaenvironment h1.heading {display: none;}
.metaheader {background: #C3D9FF; font-size: 200%}
.metaheader ul {display: inline; margin: 0;}
.metaheader li {list-style: none; display: inline; margin: 0;}
.metaheader li:after {content: "/"}
.metaenvironment.container {border: 1px solid #C3D9FF; margin-top: 0;}
.metafooter {background: #C3D9FF;}
.metafooter li {list-style: none;}


/*DEFAULT*/
body {
	margin-top: 0;
	font: 14px Lucida Grande,Verdana,Arial,Helvetica,sans serif
}
h1, h2, h3, h4, h5, h6 { margin: 0; font-weight: inherit; font-size: 100%; line-height: inherit; }
h1.heading { font-size: 2em; margin-bottom: 1.5em; }
h1 { font-size: 1.5em; line-height: 1; margin-bottom: 1em; }
.maincontents {font-size: 1.5em;}
h2 { font-size: 1.2em; height: 1.25em; line-height: 1.25; margin-bottom: 1.25em; }
h3 { font-size: 1em; font-weight: bold; margin-bottom: 1.5em; }
h4 { font-size: 1em; font-weight: bold; }
h5 { font-size: 1em; }
textarea {width: 100%;}
input.text, input.password {width: 200px;}
input[type="button"], input[type="submit"], input[type="reset"], input[type="file"], button { margin-left: 0.5em;}


/* PIER */
.broken { color: red; font-weight: bold;}
.protected { color: #aaa; }
a {color: #ff6633;}
a:hover {
	color: white;
	background: #ff6633; }
a:hover.nobackground {background: white;}
a.view, a.command {color: gray;}
a {text-decoration: none;}
a.environment:after {content: "*";}
.right {text-align: right;}
.left {text-align: left;}
.center {text-align: center;}
.float {float: right;}
.nobullets ul {list-style: none; margin-left: 0;}
.nobullets ul li {list-style: none; margin-left: 0;}
tr th {background: #eee; font-weight: normal;}
label {font-weight: normal;}
tr.group th {background: white; font-size: 1em; font-weight: bold; margin-top: 1.5em; }
td.required:after {color: #ff6633; content: "*"; margin-left: 0.5em;}

/* JQueryDialog support */
element.style {
    height: auto;
    min-height: 100px;
    width: auto;
    display: block;
    left: 394px;
    outline: 0 none;
    top: 418px;
    z-index: 1002;
}
.ui-helper-clearfix:after {
    clear: both;
    content: ".";
    display: block;
    height: 0;
    visibility: hidden;
}

.ui-draggable .ui-dialog-titlebar {
    cursor: move;
}

.ui-dialog .ui-dialog-titlebar {
    padding: 0.5em 1em 0.3em;
    position: relative;
}
.ui-corner-all {
    border-radius: 4px 4px 4px 4px;
}
.ui-widget-header {
    background: url("images/ui-bg_highlight-soft_75_cccccc_1x100.png") repeat-x scroll 50% 50% #CCCCCC;
    border: 1px solid #AAAAAA;
    color: #222222;
    font-weight: bold;
}
.ui-helper-clearfix {
    display: block;
}
.ui-widget {
    font-family: Verdana,Arial,sans-serif;
    font-size: 1.1em;
    background: lightGray;
}


.ui-dialog .ui-dialog-content {
    background: #fffff0;
    border: 0 none;
    overflow: auto;
    padding: 0.5em 1em;
}
.ui-widget-content {
    background: url("images/ui-bg_flat_75_ffffff_40x100.png") repeat-x scroll 50% 50% #FFFFFF;
    border: 1px solid #AAAAAA;
    color: #222222;
}
.ui-dialog {
    overflow: hidden;
    padding: 0.2em;
    position: absolute;
    width: 500px;
}

#flag-dialog-comments {
    background: none repeat scroll 0 0 #eeffcc;
    margin-top: 1em;
    padding: 1em;
    border-radius: 6px;
}

.flag-comment-content {
	margin-bottom: 0;
}
.flag-comment-user{
    font-style: Italic;
    margin-bottom: 0.5em;
	text-align: right;
}

.change-text {
	padding-left: 10px; 
	padding-top: 5px;
	padding-right: 10px; 
	color: blue;
	font-size: 104%;
}
.change-user {
    background-image: url("http://lcf.seasidehosting.st/resources/arrow_up.png");
    background-position: left top;
    background-repeat: no-repeat;
    font-size: 104%;
    font-weight: bold;
    margin-left: 50px;
    min-height: 50px;
    padding-right: 60px;
    padding-top: 5px;
}

';
		yourself]
]
