Class {
	#name : #TransPairTitle,
	#superclass : #TransPairDate,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
TransPairTitle >> latexOn: aStream [

	aStream nextPutAll: '\Huge\bfseries \href{lcf.seasidehosting.st/lcf/', '}{'.
	super latexOn: aStream.
	aStream nextPutAll: '}}'; cr; cr.

]

{ #category : #'as yet unclassified' }
TransPairTitle >> latexOn: aStream with: chapter [

	aStream nextPutAll: '\Huge\bfseries \href{http:/lcf.seasidehosting.st/lcf/', chapter parent name, '/', chapter name, '}{'.
	aStream nextPutAll: self latex.
	aStream nextPutAll: '}\\'; cr; cr.
	aStream nextPutAll: '}'; cr; cr.

]

{ #category : #'as yet unclassified' }
TransPairTitle >> renderControlsOn: chapterView with: html anchor: anchor [

	html anchor target: 'imdbpage';
				url: 'http://www.imdb.com/find?s=all&q=', self eng asHTMLString;
				with: [ html image altText: 'buscar en IMDB'; height: 20; url: (PRBlueprintLibrary  / #imdbJpg).].
	
	super renderControlsOn: chapterView with: html anchor: anchor.
]
