Class {
	#name : #PosterModelTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #tests }
PosterModelTest >> testPosterModelAssurePosterImage [
	| poster chapter str stream |

	chapter := ( LightModelBookCicleTest sampleBookCicloA times at: #Navidad ) chapters first.
	poster := LightModelPoster read: LightModelChapterTest samplePoster readStream.
 	poster initializeWith: chapter.

	poster link: 'https://webmail.dc.uba.ar/logo_2018.png'.
	
	(FileSystem root / poster posterPath / poster posterFilename) exists ifTrue: [ 
		(FileSystem root / poster posterPath / poster posterFilename) delete.
	].

   self deny: (FileSystem root / poster posterPath / poster posterFilename) exists.
	poster assurePosterImage.
"	stream := (FileSystem root / poster posterPath / poster posterFilename) unbufferedBinaryWriteStream.
	stream nextPutAll: (ZnEasy get: 'https://webmail.dc.uba.ar/logo_2018.png') entity contents.
	stream close.
"
   self assert: (FileSystem root / poster posterPath / poster posterFilename) exists.

]

{ #category : #tests }
PosterModelTest >> testPosterModelFileExtension [
	| poster chapter str stream |

	chapter := ( LightModelBookCicleTest sampleBookCicloA times at: #Navidad ) chapters first.
	poster := LightModelPoster read: LightModelChapterTest samplePoster readStream.
 	poster initializeWith: chapter.

	poster link: 'something.jpg'.
   self assert: poster fileExtension equals: 'jpg'
]

{ #category : #tests }
PosterModelTest >> testPosterModelFilename [
	| poster chapter |

	chapter := ( LightModelBookCicleTest sampleBookCicloA times at: #Navidad ) chapters first.
	poster := LightModelPoster read: LightModelChapterTest samplePoster readStream.
 	poster initializeWith: chapter.
			
	self assert: poster posterFilename equals: 'theholyfamily.jpg'.

]

{ #category : #tests }
PosterModelTest >> testPosterModelPath [
	| poster chapter |

	chapter := ( LightModelBookCicleTest sampleBookCicloA times at: #Navidad ) chapters first.
	poster := LightModelPoster read: LightModelChapterTest samplePoster readStream.
 	poster initializeWith: chapter.
			
	self assert: poster posterPath equals: LightVariables resourceBase, '/bookA/im'.
	self assert: poster posterPath equals: LightVariables rootPath, '/res/bookA/im'.

]

{ #category : #tests }
PosterModelTest >> testPosterModelRead [
	| poster |
	poster := LightModelPoster read: LightModelChapterTest samplePoster readStream.

	self assert: poster accurate 
]
