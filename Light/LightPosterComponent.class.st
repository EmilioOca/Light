Class {
	#name : #LightPosterComponent,
	#superclass : #WAComponent,
	#instVars : [
		'pair',
		'poster'
	],
	#category : #'Light-Pages'
}

{ #category : #'instance creation' }
LightPosterComponent class >> new: aTextPair [

	^ self new initialize: aTextPair
]

{ #category : #initialization }
LightPosterComponent >> filename [
	^ poster filename
]

{ #category : #initialization }
LightPosterComponent >> initialize: aPoster [
	poster := aPoster
]

{ #category : #initialization }
LightPosterComponent >> isMissing [
	^ poster isMissing
]

{ #category : #initialization }
LightPosterComponent >> path [
	^ poster path
]

{ #category : #initialization }
LightPosterComponent >> renderContentOn: html [
" 	(self shouldHide: chapterView) ifTrue: [ ^self ]." 
	
	html div: [ 
		self renderPosterOn: html.
"		self renderEditControlOn: chapterView with: html."
		html break; break.
	].
]

{ #category : #initialization }
LightPosterComponent >> renderPosterOn: html [
	| links file chapter |

	self isMissing ifFalse: [
"		chapterView class = LCFChapterHtmlView  ifTrue: [
			self assurePosterImage.
			html image altText: 'poster'; url: 'http://lcf.seasidehosting.st/', self path, self filename.
	"		html image altText: 'poster'; url: poster link.
		"] ifFalse: [
			html text: self link.
		]"
	] ifTrue: [
		html text: '<Poster sin definir>'
	].

]

{ #category : #initialization }
LightPosterComponent >> renderPosterOn: html with: chapterView [
	| links file chapter |

	self isMissing ifFalse: [
"		chapterView class = LCFChapterHtmlView  ifTrue: [
			self assurePosterImage.
	"		html image altText: 'poster'; url: 'http://lcf.seasidehosting.st/', self path, self filename.
		"] ifFalse: [
			html text: self link.
		]"
	] ifTrue: [
		html text: '<Poster sin definir>'
	].

]