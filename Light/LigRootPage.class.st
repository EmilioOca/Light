Class {
	#name : #LigRootPage,
	#superclass : #LigPageComponent,
	#instVars : [
		'present'
	],
	#category : #'Light-Pages'
}

{ #category : #rendering }
LigRootPage >> children [   
	#EFO:.  "va menu y todas las que puede tomar el lugar de cover"
	^ { self cover. self menu. self contact. self colaborate }
]

{ #category : #accessing }
LigRootPage >> present [
	^ present ifNil: [ present := self cover ]
]

{ #category : #accessing }
LigRootPage >> present: anObject [
	present := anObject
]

{ #category : #rendering }
LigRootPage >> renderContentOn: html [
	html render: self menu.
	html break.
   html render: self present.
   
]
