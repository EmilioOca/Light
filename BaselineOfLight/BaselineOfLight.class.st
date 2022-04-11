Class {
	#name : #BaselineOfLight,
	#superclass : #BaselineOf,
	#category : #BaselineOfLight
}

{ #category : #baselines }
BaselineOfLight >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'Light'.
			   spec package: 'EFO-LCF-Model'. ]
]
