Class {
	#name : #TransPairDate,
	#superclass : #TransPair,
	#instVars : [
		'level'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
TransPairDate >> ErenderEng: html [.		
	html heading level: self level; style: 'margin-bottom: 0px;';with: self eng.



]

{ #category : #accessing }
TransPairDate >> anchored [
	^ false
]

{ #category : #accessing }
TransPairDate >> latexOn: html with: chapter [

"	html nextPutAll: '\cleardoublepage
\phantomsection
\addcontentsline{toc}{chapter}{', self latex, '}'; cr;cr.
"
	html nextPutAll: '\chapter*{', self latex, '\newline {\Large '; 
		nextPutAll: chapter parent headTitle, ': ', chapter tiempo; 
		nextPutAll: '}}
\addcontentsline{toc}{chapter}{', self latex, '}
\renewcommand{\leftmark}{', self latex, '}
\markright{', chapter parent headTitle, ': ', chapter tiempo, '}'; cr; cr.

]

{ #category : #accessing }
TransPairDate >> level [
	^ level
]

{ #category : #accessing }
TransPairDate >> level: anObject [
	level := anObject
]
