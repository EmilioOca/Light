Class {
	#name : #LCFSessionsView,
	#superclass : #PRDefaultView,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFSessionsView >> renderContentOn: html [

	html table
		id: self ajaxId; class: 'report';
		with: [ 
			html tableHead: [
				{ 'Usuario'. 'Rol'. 'IP'. 'hora'. 'Ubicación' } do: [ :header |
					html tableHeading: header ]
			].
			html tableBody
				style: 'font-size: 80%;';
				with: [
					self sessions do: [ :session |  | user |
						html tableRow: [
							session user renderOn: html tableData.
							html tableData with: session rol.
							html tableData with: session origen, ' (', session visits printString, ')'.	
							html tableData with: ( session lastAction utcOffset: -3 hours ) printHttpFormat .
							html tableData 
								 with: [ 
									html anchor
										goto: (self context structure: session structure );
										with: session structure title ].								

						]
					]. 	

				].

			].



]

{ #category : #testing }
LCFSessionsView >> sessions [
	| logs |
	logs := Dictionary new.
	self context application sessions do: [ :session | | log |
		log :=  logs at: session origen ifAbsentPut: [ SessionLog newOn: session ].
		log updateWith: session.
		
	].
	
	^ logs.

]

{ #category : #testing }
LCFSessionsView >> shouldRenderControls [
	^ false
]
