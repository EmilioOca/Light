Class {
	#name : #LCFBatchedAgendaList,
	#superclass : #WAAlphabeticBatchedList,
	#pools : [
		'ChronologyConstants'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFBatchedAgendaList >> allPages [
"	^ 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"
	^ DateMoment meses
" ^ { 'Australia'. 'Belgium' right parenthesis expected ->. 'Canada'. 'Denmark'. 'France'. 'Germany'. 'Italy'. 'New Zealand'. 'Otros'. 'Russia'.  'Scotland'. 'Taiwan'. 'UK'. 'USA'. 'Wales' }."
"	^(((items collect: [ :each | each key  ]) asSet removeAll: self otros; yourself) asSet add: 'Otros'; yourself  )sorted "
]

{ #category : #'as yet unclassified' }
LCFBatchedAgendaList >> batch [
	^ items select: [ :each | ( DateMoment meses at: each key monthIndex ) = self currentPage  ].
	
"	^ ( self currentPage = 'Otros' ) ifTrue: [
		items select: [ :each | self otros includes: each key ].
	] ifFalse: [ 
		items select: [ :each | each key = self currentPage ].
	]"
]

{ #category : #'as yet unclassified' }
LCFBatchedAgendaList >> otros [ 
	^ {'Russia'. 'Scotland'. 'Taiwan'. 'New Zealand'. 'Belgium'. 'Canada'. 'France'. 'Denmark'. 'Germany'. 'Italy'. 'Wales'} 
]

{ #category : #'as yet unclassified' }
LCFBatchedAgendaList >> validPages [
	^ 
	"(items collect: [ :each | each key ]) asSet sorted"
	self allPages
]
