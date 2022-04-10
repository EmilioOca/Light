Class {
	#name : #GlosarioItem,
	#superclass : #Object,
	#instVars : [
		'key',
		'chapter'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
GlosarioItem >> <= other [
	^ key <= other key
]

{ #category : #'as yet unclassified' }
GlosarioItem >> ErenderRowOn: html [

	html tableRow: [
		html tableData with: [ self renderDateContentOn: html with: self ].
		html tableData title: self film fineSpa;
					with: self film eng.
		html tableData with: [ self renderExtrasOn: html with: self ].
	]

]

{ #category : #'as yet unclassified' }
GlosarioItem >> chapter [
	^ chapter
]

{ #category : #'as yet unclassified' }
GlosarioItem >> chapter: aChapter [
	chapter := aChapter
]

{ #category : #'as yet unclassified' }
GlosarioItem >> greaseString [.
	^ self key name
]

{ #category : #'as yet unclassified' }
GlosarioItem >> key [ 
	^ key
]

{ #category : #'as yet unclassified' }
GlosarioItem >> key: aKey [
	key := aKey
]
