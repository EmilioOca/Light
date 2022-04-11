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
	spec group: 'default' with: #('FileDialog') ]
]
