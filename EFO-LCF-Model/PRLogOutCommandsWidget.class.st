Class {
	#name : #PRLogOutCommandsWidget,
	#superclass : #PRListWidget,
	#category : #'EFO-LCF-Model'
}

{ #category : #'accessing-defaults' }
PRLogOutCommandsWidget class >> defaultCommandClasses [
	^ (Array withAll: PRCommand withAllConcreteClasses)
		sort: [ :a :b | a label caseInsensitiveLessOrEqual: b label ];
		yourself
]

{ #category : #'accessing-description' }
PRLogOutCommandsWidget class >> descriptionCommandClasses [
	^ MAMultipleOptionDescription new
		default: [ self defaultCommandClasses ] magritteDynamicObject;
		options: [ self defaultCommandClasses ] magritteDynamicObject;
		componentClass: MAListCompositionComponent;
		reference: MAClassDescription new;
		accessor: #commandClasses;
		label: 'Command Classes';
		priority: 200;
		beOrdered;
		beDistinct;
		beSorted;
		yourself
]

{ #category : #testing }
PRLogOutCommandsWidget class >> isAbstract [
	^ false
]

{ #category : #accessing }
PRLogOutCommandsWidget class >> label [
	^ 'Commands'
]

{ #category : #accessing }
PRLogOutCommandsWidget >> commandClasses [
	^ self read: #descriptionCommandClasses
]

{ #category : #accessing }
PRLogOutCommandsWidget >> items [
	| commands |

	commands := {PULogout}.
	^ self commandClasses select: [ :each | commands includes: each ]
]

{ #category : #accessing }
PRLogOutCommandsWidget >> labelFor: anObject [
	^ anObject shortLabel
]

{ #category : #rendering }
PRLogOutCommandsWidget >> renderItem: aClass on: html [
	html anchor
		class: 'active' if: (self isActive: aClass);
		accessKey: aClass accessKey;
		goto: (self context
			structure: self context structure
			command: aClass new);
		with: (self labelFor: aClass)
]

{ #category : #accessing }
PRLogOutCommandsWidget >> selected [
	^ self context command class
]
