"
A LightModelBookCicleTest is a test class for testing the behavior of LightModelBookCicle
"
Class {
	#name : #LightModelBookCicleTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #tests }
LightModelBookCicleTest >> testModelBookChapters [

	| book |
	book := LightModelBookCicle newOn: LightVariables sourceBase named: 'Book A'.

 	book load.
			
	self assert: ( book times at: #Navidad ) chapters size equals: 8.
	self assert: book chapters size equals: 74.
]

{ #category : #tests }
LightModelBookCicleTest >> testModelBookFile [

	| book |
	book := LightModelBookCicle newOn: 'aBaseDir' named: 'Ciclo A'.
		
	self assert: book file pathString equals: '/aBaseDir/cicloA.txt'.

]

{ #category : #tests }
LightModelBookCicleTest >> testModelBookFileName [

	| book |
	book := LightModelBookCicle newOn: 'baseDir' named: 'Ciclo A'.
		
	self assert: book filename equals: 'cicloA.txt'.

]

{ #category : #tests }
LightModelBookCicleTest >> testModelBookNextChapter [

	| book |
	book := LightModelBookCicle newOn: LightVariables sourceBase named: 'Book A'.

 	book load.
			
	self assert: ( book chapters first nextChapter ) equals:  book chapters second.
	self assert: ( book chapters last nextChapter ) equals:  book chapters first.

]

{ #category : #tests }
LightModelBookCicleTest >> testModelBookReadFromEmptyStream [

	| book |
	book := LightModelBookCicle newOn: 'FileSystem root 'named: 'Ciclo A'.
	book loadFrom: 'END' readStream.
	self assert: book chapters size equals: 0.
]

{ #category : #tests }
LightModelBookCicleTest >> testModelBookReadFromSampleBaseDirFile [

	| book file |
	book := LightModelBookCicle newOn: LightVariables sourceBase  named: 'Book A'.

 	book load.
		

	self assert: book chapters size equals: 74.
	self assert: book chapters first book equals: book
]

{ #category : #tests }
LightModelBookCicleTest >> testModelBookReadFromSampleChapterFile [

	| book file |
	book := LightModelBookCicle newOn: 'FileSystem root' named: 'Ciclo A'.

 	[ 
		file := ( FileSystem root / LightVariables sourceBase / 'bookA.txt' ) readStream.
		
		book loadFrom: file.
	] ensure: [file close].
		

	self assert: book chapters size equals: 74.
]

{ #category : #tests }
LightModelBookCicleTest >> testModelBookReadWriteFromEmptyStream [

	| book |
	book := LightModelBookCicle newOn: 'FileSystem root' named: 'Ciclo A'.
	book loadFrom: 'END' readStream.
	self assert: (String streamContents: [ :s | book writeOn: s ]) equals: ''
]
