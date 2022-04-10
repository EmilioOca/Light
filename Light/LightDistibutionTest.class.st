Class {
	#name : #LightDistibutionTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #tests }
LightDistibutionTest >> testComponenAccessInitialization [
	| lcf root |
	lcf := LightDistribution new.
	root := lcf root.
	
	self assert: root equals: root root.
	self assert: lcf equals: root app.
	self assert: ( lcf children includes: root )
]

{ #category : #tests }
LightDistibutionTest >> testComponenBookAAccess [
	| lcf |
	lcf := LightDistribution new.
	
	self deny: ( lcf components includesKey: #cicloA ).
	self assert: lcf cicloA equals: lcf root cicloA.
	self assert: ( lcf components includesKey: #cicloA ).
	
	self assert: lcf cicloA book chapters size equals: 74.
]

{ #category : #tests }
LightDistibutionTest >> testComponenCelebrationsAccess [
	| lcf |
	lcf := LightDistribution new.
	
	self deny: ( lcf components includesKey: #celebrations ).
	self assert: lcf celebrations equals: lcf root celebrations.
	self assert: ( lcf components includesKey: #celebrations ).
	
	self assert: lcf celebrations book chapters size 
		  equals: ((lcf cicloA book time: #Fija) chapters size + 
 					  (lcf cicloB book time: #Fija) chapters size +
   				 	  (lcf cicloC book time: #Fija) chapters size +
  					  (lcf commandments book time: #Fija) chapters size).   
]

{ #category : #tests }
LightDistibutionTest >> testComponenCommandmentsAccess [
	| lcf |
	lcf := LightDistribution new.
	
	self deny: ( lcf components includesKey: #commandments ).
	self assert: lcf commandments equals: lcf root commandments.
	self assert: ( lcf components includesKey: #commandments ).
	
	self assert: lcf commandments book chapters size equals: 32.   
]

{ #category : #tests }
LightDistibutionTest >> testComponenSpawn [
	| lcf |
	lcf := LightDistribution new.
	
	self deny: ( lcf components includesKey: #root ).
	self assert: lcf root equals: lcf root root.
	self assert: ( lcf components includesKey: #root ).
	
	self deny: ( lcf components includesKey: #cover ).
	self assert: lcf cover equals: lcf cover cover.
	self assert: ( lcf components includesKey: #cover ).

]
