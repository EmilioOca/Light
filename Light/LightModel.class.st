Class {
	#name : #LightModel,
	#superclass : #Object,
	#instVars : [
		'bookA',
		'bookB',
		'bookC',
		'celebrations',
		'commandments',
		'sourceBase'
	],
	#category : #'Light-Model'
}

{ #category : #accessing }
LightModel >> bookA [
	^  bookA ifNil: [ bookA := (LightModelBookCicle newOn: self sourceBase named: 'Book A') load ]
]

{ #category : #accessing }
LightModel >> bookB [
	^  bookB ifNil: [ bookB := (LightModelBookCicle newOn: self sourceBase named: 'Book B') load ]
]

{ #category : #accessing }
LightModel >> bookC [
	^  bookC ifNil: [ bookC := (LightModelBookCicle newOn: self sourceBase named: 'Book C') load ]
]

{ #category : #accessing }
LightModel >> celebrations [
	^ celebrations ifNil: [ celebrations := (LightModelBookCelebrations newOn: self sourceBase named: 'Celebrations') 
		loadFromBooks: { self bookA. self bookB. self bookC. self commandments } ]
]

{ #category : #accessing }
LightModel >> commandments [
	^  commandments ifNil: [ commandments := (LightModelBookCommandments newOn: self sourceBase named: 'book10C') load ]
]

{ #category : #accessing }
LightModel >> commandments: anObject [
	commandments := anObject
]

{ #category : #initialization }
LightModel >> initialize [ 
	super initialize.
	sourceBase := LightVariables sourceBase.
]

{ #category : #accessing }
LightModel >> sourceBase [
	^ sourceBase
]
