Class {
	#name : #PosterModelTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

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
			
	self assert: poster path equals: LightVariables resourceBase, '/bookA/jpg/'.

]

{ #category : #tests }
PosterModelTest >> testPosterModelRead [
	| poster |
	poster := LightModelPoster read: LightModelChapterTest samplePoster readStream.

	self assert: poster accurate 
]
