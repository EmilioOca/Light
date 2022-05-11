Class {
	#name : #PosterModelTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #tests }
PosterModelTest >> testPosterModelAssurePosterImage [
	| poster chapter str |

	chapter := ( LightModelBookCicleTest sampleBookCicloA times at: #Navidad ) chapters first.
	poster := LightModelPoster read: LightModelChapterTest samplePoster readStream.
 	poster initializeWith: chapter.

	(FileSystem root / poster path / poster filename) delete.

   self deny: (FileSystem root / poster path / poster filename) exists.

	(FileSystem root / poster path  / poster filename )
		writeStreamDo: [ :stream | 
"			(ZnEasy get: 'http://webmail.dc.uba.ar/logo_2018.png')
					writeOn: stream"
					stream nextPutAll: 'bob joe'
		].

"	str := (File named: (FileSystem root / poster path / poster filename) pathString) openForWrite."
"	str := ( File named: '/home/emilio/develop/lcf/res/bookA/jpg/theholyfamily.jpg' ) openForWrite.
	(ZnEasy get: 'https://webmail.dc.uba.ar/logo_2018.png')
					writeOn: str.
"

   self assert: (FileSystem root / poster path / poster filename) exists.

]

{ #category : #tests }
PosterModelTest >> testPosterModelFilename [
	| poster chapter |

	chapter := ( LightModelBookCicleTest sampleBookCicloA times at: #Navidad ) chapters first.
	poster := LightModelPoster read: LightModelChapterTest samplePoster readStream.
 	poster initializeWith: chapter.
			
	self assert: poster filename equals: 'theholyfamily.jpg'.

]

{ #category : #tests }
PosterModelTest >> testPosterModelPath [
	| poster chapter |

	chapter := ( LightModelBookCicleTest sampleBookCicloA times at: #Navidad ) chapters first.
	poster := LightModelPoster read: LightModelChapterTest samplePoster readStream.
 	poster initializeWith: chapter.
			
	self assert: poster path equals: LightVariables resourceBase, '/bookA/jpg'.
	self assert: poster path equals: LightVariables rootPath, '/res/bookA/jpg'.

]

{ #category : #tests }
PosterModelTest >> testPosterModelRead [
	| poster |
	poster := LightModelPoster read: LightModelChapterTest samplePoster readStream.

	self assert: poster accurate 
]
