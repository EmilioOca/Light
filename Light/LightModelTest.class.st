Class {
	#name : #LightModelTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #tests }
LightModelTest >> testModelBookARead [

	self assert: LightModel new bookA chapters size equals: 74.
]

{ #category : #tests }
LightModelTest >> testModelBookBRead [

	self assert: LightModel new bookB chapters size equals: 75.
]

{ #category : #tests }
LightModelTest >> testModelBookCRead [

	self assert: LightModel new bookC chapters size equals: 67.
]
