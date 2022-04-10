Class {
	#name : #LigBookPage,
	#superclass : #LigPageComponent,
	#instVars : [
		'sideTree',
		'bookContent',
		'present'
	],
	#category : #'Light-Pages'
}

{ #category : #accessing }
LigBookPage >> bookContent [
	^ bookContent ifNil: [ bookContent := LigBookContentComponent newHolded: self ]
]

{ #category : #accessing }
LigBookPage >> bookContent: anObject [
	bookContent := anObject
]

{ #category : #accessing }
LigBookPage >> children [
	^ { self bookContent. self sideTree }
]

{ #category : #accessing }
LigBookPage >> holder [
	^ self ciclos
]

{ #category : #'as yet unclassified' }
LigBookPage >> present [
	^ present ifNil: [ present := self book chapters first ]
]

{ #category : #'as yet unclassified' }
LigBookPage >> present: aLightModelChapter [ 
	present := aLightModelChapter
]

{ #category : #rendering }
LigBookPage >> renderContentOn: html [
	html tbsRow showGrid;
		with: [ html tbsColumn
						extraSmallSize: 3;
						mediumSize: 3;	
						with: [ html render: self sideTree ].
				html tbsColumn
						extraSmallSize: 9;
						mediumSize:  9;	
						with: [ html render: self bookContent ] ].	

   
]

{ #category : #accessing }
LigBookPage >> sideTree [
	^ sideTree ifNil: [ sideTree := LigSideTreeComponent newHolded: self ]
]

{ #category : #accessing }
LigBookPage >> sideTree: anObject [
	sideTree := anObject
]
