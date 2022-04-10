Class {
	#name : #TransPairKeySeq,
	#superclass : #TransPair,
	#instVars : [
		'idx'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #accessing }
TransPairKeySeq >> idx [
	^ idx
]

{ #category : #accessing }
TransPairKeySeq >> idx: aNum [ 
	idx := aNum
]

{ #category : #'as yet unclassified' }
TransPairKeySeq >> renderEng: html [.		
	html div: [ html text: self idx printString, '. ', self eng;
						break].

]
