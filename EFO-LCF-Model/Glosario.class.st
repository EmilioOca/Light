Class {
	#name : #Glosario,
	#superclass : #Object,
	#instVars : [
		'title',
		'selector',
		'batcher',
		'headers',
		'batcherClass',
		'items',
		'target'
	],
	#classInstVars : [
		'all'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
Glosario class >> glosarios [
	 
	^ { 
		self new title: 'Actores'; selector: #actors; yourself.
		self new title: 'Directores'; selector: #directors; yourself.
		self new title: 'Escritores'; selector: #writers; yourself.
		self new title: 'Origen'; selector: #countrys; 
				headers: {'Origen'. 'Fiesta'. 'Película'}; 
				batcherClass: LCFBatchedOrigenList; yourself.
		self new title: 'Agenda'; target: #moment; selector: #date; 
				headers: {'Fecha'. 'Fiesta'. 'Película'}; 
				batcherClass: LCFBatchedAgendaList; yourself 
		}.
]

{ #category : #'as yet unclassified' }
Glosario >> batcherClass [ 
	^ batcherClass ifNil: [ batcherClass := WAAlphabeticBatchedList ].
]

{ #category : #'as yet unclassified' }
Glosario >> batcherClass: aClass [
	batcherClass := aClass.
]

{ #category : #'as yet unclassified' }
Glosario >> batcherFrom: root [
	^ batcher ifNil:[ batcher := self batcherClass new items: self items" (root glosarios at: self title) "].
]

{ #category : #accessing }
Glosario >> finalize [
	batcher ifNotNil: [ batcher items removeAll].
	batcher := nil.

]

{ #category : #accessing }
Glosario >> headers [
	^ headers ifNil: [  headers := {'Artista'. 'Fiesta'. 'Película'} ].
]

{ #category : #accessing }
Glosario >> headers: aHeader [
	headers := aHeader
]

{ #category : #accessing }
Glosario >> items [
	^ items.

]

{ #category : #accessing }
Glosario >> read: chapters [
	items := SortedCollection new.
	chapters do: [ :chapter | 
		((chapter perform: self target)  perform: self selector) asOrderedCollection do: [ :actor |
			actor ifNotNil: [
				items add: (GlosarioItem new key: actor; chapter: chapter ) 
			]
		]  
	].


]

{ #category : #'as yet unclassified' }
Glosario >> renderNodeOn: html using: view [
	html listItem: [
		html anchor
			callback: [ view active: self ];
			title: self title;
			with: [ view active title = self title ifTrue: [
						html emphasis with: [ html big: self title ].
					] ifFalse: [
						html html: self title
					]
				].

	]

]

{ #category : #accessing }
Glosario >> selector [
	^ selector.

]

{ #category : #accessing }
Glosario >> selector: aSelector [
	selector := aSelector

]

{ #category : #accessing }
Glosario >> target [
	^ target ifNil: [ target := #filmData ].

]

{ #category : #accessing }
Glosario >> target: aSelector [
	target := aSelector

]

{ #category : #accessing }
Glosario >> title [
	^ title.

]

{ #category : #accessing }
Glosario >> title: aByteString [ 
	title := aByteString 

]
