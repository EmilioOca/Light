Class {
	#name : #LCFChapterHtmlView,
	#superclass : #PRDefaultView,
	#instVars : [
		'post',
		'comment',
		'command',
		'component'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFChapterHtmlView >> chapter [
	^ self context  structure
]

{ #category : #'as yet unclassified' }
LCFChapterHtmlView >> renderContentOn: html [
	| chapter tp |
	"html heading: chapter date."
	"	html heading level: 1; with: chapter film eng.
"
	chapter := self chapter.
	html div: [ 
		self renderNavHeadingOn: html with: chapter.
		html div: [ 
"			html text: chapter parent headTitle."
			chapter date renderViewOn: html with: self.
			chapter lectures renderViewOn: html with: self.
			chapter crest ifNotNil: [ 
				html emphasis with: [ chapter crest renderViewOn: html with: self ]
			]
		].
	].

	chapter film renderViewOn: html with: self.
	chapter filmData renderViewOn: html with: self.
		
	(html heading) level: 2; id: 'outline'; with: 'Outline'.
	chapter outline do: [ :line | line renderViewOn: html with: self ].

	(html heading) level: 2; id: 'comment'; with: 'Comment'.
	chapter comment do: [ :line | line renderViewOn: html with: self ].

	(html heading) level: 2; id: 'gospel'; with: 'Dialogue with the Gospel'.
	html text: 'Focus:'.
	chapter gospelFocus renderViewOn: html with: self.
	chapter gospel do: [ :line | line renderViewOn: html with: self ].

	(html heading) level: 2; id: 'keysequences'; with: 'Some key sequences'.
	chapter keySequences doWithIndex: [ :line :idx | 
		line idx: idx.
		line renderViewOn: html with: self ].

	(html heading) level: 2; id: 'reflection'; with: 'For reflection and conversation'.
	chapter reflection do: [ :line | line renderViewOn: html with: self ].

	(html heading) level: 2; id: 'prayer'; with: 'Prayer:'.
	chapter prayer renderViewOn: html with: self.

]

{ #category : #'as yet unclassified' }
LCFChapterHtmlView >> renderFileLink: html with: chapter [
	| path |
	path :=  'resources/', chapter chapterPath, '/pdf/'.
	
	(( FileDirectory uri: path ) fileExists: chapter chapterFileName, '.pdf' ) ifTrue: [
		html anchor 
			url: 'http://lcf.seasidehosting.st/', path, chapter chapterFileName, '.pdf';
			title: 'descargar versión castellana';
			with: [ html image url: 'http://lcf.seasidehosting.st/resources/adobe.png'.
					html html: 'descargar' ].
		html break.

	].




]

{ #category : #'as yet unclassified' }
LCFChapterHtmlView >> renderNavBtn: html with: chapter [
	| prevChap nextChap |	
	prevChap := chapter parent childrenDecoration children before: chapter ifAbsent: [].
 	prevChap ifNotNil: [ 
		html anchor goto: (self context structure: prevChap );
					title: prevChap title;
					with: [  (html image)
							title: 'ir';
							url: 'http://lcf.seasidehosting.st/resources/left.png'.
						html html: prevChap title ].
	].

	html break.

	nextChap := chapter parent childrenDecoration children after: chapter ifAbsent: [].
 	nextChap ifNotNil: [ 
		html anchor goto: (self context structure: nextChap);
					title: nextChap title;
					with: [ html html: nextChap title.
						(html image)
							title: 'ir';
							url: 'http://lcf.seasidehosting.st/resources/right.png'.
						].
	].
]

{ #category : #'as yet unclassified' }
LCFChapterHtmlView >> renderNavHeadingOn: html with: chapter [
	(html div)
		style: 'float: right; margin: 10px;';
		with: [ 
					html text: 'traducido al ' , chapter translationProgress printString , '%'.
					html break.
					self renderFileLink: html with: chapter.
					self renderNavBtn: html with: chapter.
					html break.
					(html div)
						style: 'margin: 10px;';
						with: [ chapter poster renderViewOn: html with: self ] ]
]

{ #category : #'as yet unclassified' }
LCFChapterHtmlView >> renderUser: html [
	self context user
		ifNil: [ html
				text: 'visitante';
				break ]
		ifNotNil: [ html text: 'usuario: ' , self context user name , ' (' , self context user groups any name , ')' ].
	html break.
	html break
]

{ #category : #testing }
LCFChapterHtmlView >> shouldRenderControls [
	^ self context user notNil
]
