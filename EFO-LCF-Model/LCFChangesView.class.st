Class {
	#name : #LCFChangesView,
	#superclass : #PRDefaultView,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFChangesView >> renderBook: book on: html [

	book changed do: [ :chapter |
		html text: chapter parent headTitle.
		html heading with: [ html anchor goto: (self context structure: chapter);
										with: chapter date eng.
							html text: ' ', chapter film eng ].	
			
		( chapter allPairs select: [ :pair | pair changes isEmpty not ] ) 
			do: [ :pair | 
				html div: [ pair renderViewOn: html with: self ].

				pair changes reverse do: [ :change |


					change renderHtmlOn: html like:
					(	(self context root propertyAt: 'savedOn' ifAbsent: [DateAndTime  current ] ) < change time 
								ifTrue: [  'color: red;' ] ifFalse: [ 'color: blue' ]
					).

				]
			].

		 html break

	].
]

{ #category : #'as yet unclassified' }
LCFChangesView >> renderContentOn: html [

	self renderHeadingOn: html.
	html div: [ 
		self renderBook: (self context root childrenDecoration at: 'cicloa' ) on: html.
		self renderBook: (self context root childrenDecoration at: 'ciclob' ) on: html.
		self renderBook: (self context root childrenDecoration at: 'cicloc' ) on: html.
		self renderBook: (self context root childrenDecoration at: 'mandamientos' ) on: html.
	].

]

{ #category : #'as yet unclassified' }
LCFChangesView >> renderHeadingOn: html [
	(html div)
		style: 'float: right;';
		with: [ 
			(self context root hasProperty: 'savedOn') ifTrue: [ 
				(html div)
					style: 'float: right';
					with: [ html text: 'último resguardo: ', 
						((self context root propertyAt: 'savedOn' ) utcOffset: -3 hours ) printHttpFormat.].
			] ifFalse: [
				(html div)
					style: 'float: right; color: red;';
					with: [html text: 'cambios sin resguardo'. ].
			].
		]
]

{ #category : #'as yet unclassified' }
LCFChangesView >> shouldRenderControls [
	^ false
]
