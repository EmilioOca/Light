Class {
	#name : #LCFCiclos,
	#superclass : #PRCase,
	#instVars : [
		'active',
		'glosarios'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFCiclos class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFCiclos >> active [
	^ active ifNil: [ active := self glosarios values first ].
]

{ #category : #'as yet unclassified' }
LCFCiclos >> active: aGlosario [
	active := aGlosario
]

{ #category : #'as yet unclassified' }
LCFCiclos >> finalize [
	glosarios ifNotNil: [ glosarios removeAll ].
	glosarios := nil.

]

{ #category : #'as yet unclassified' }
LCFCiclos >> glosarios [
	^ glosarios ifNil: [ glosarios := Dictionary new.
		Glosario glosarios do: [ :glosario |
			glosarios at: glosario title put: (	glosario read: (self parent propertyAt: 'distro' )chapters).
		].
		glosarios.
	].


]

{ #category : #'as yet unclassified' }
LCFCiclos >> viewComponentClass [
	^ LCFCiclosView
]
