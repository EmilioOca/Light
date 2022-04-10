Class {
	#name : #CrewMate,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
CrewMate class >> from: aString [
	^ self new name: aString
]

{ #category : #'as yet unclassified' }
CrewMate >> <= other [
	^ name <= other name
]

{ #category : #'as yet unclassified' }
CrewMate >> name [ 
	^ name
]

{ #category : #'as yet unclassified' }
CrewMate >> name: aString [
	name := aString trimBoth 
]

{ #category : #'as yet unclassified' }
CrewMate >> renderHtml: html [
	html anchor target: 'imdbpage' ;
				title: (self name, ' en IMDB');
				url: 'http://www.imdb.com/find?s=all&q=', self name asHTMLString;
				with: [ html small: self name ].
]

{ #category : #'as yet unclassified' }
CrewMate >> renderLatex: aStream [
	aStream nextPutAll: '\href{http://www.imdb.com/find?s=all&q=', self name asHTMLString, '}{', self name, '}'.
]

{ #category : #'as yet unclassified' }
CrewMate >> renderOn: html [
	self renderHtml: html
]
