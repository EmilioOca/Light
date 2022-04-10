Class {
	#name : #LCFPairWidget,
	#superclass : #PRWidget,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFPairWidget class >> isAbstract [
	^ false
]

{ #category : #'as yet unclassified' }
LCFPairWidget >> renderContentOn: html [
(TransPair new 
	eng: 'ingles'; 
	spa: 'espaniol'; 
	yourself) asComponent renderOn: html
]
