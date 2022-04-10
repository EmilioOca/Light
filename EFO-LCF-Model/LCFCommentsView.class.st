Class {
	#name : #LCFCommentsView,
	#superclass : #PRDefaultView,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LCFCommentsView >> renderBook: book on: html [
	
	book commented do: [ :chapter |
		html text: chapter parent headTitle.
		html heading with: [ html anchor goto: (self context structure: chapter);
										with: chapter date eng.
							html text: ' ', chapter film eng ].	
			
		( chapter allPairs select: [ :pair | pair comments isEmpty not ] ) 
			do: [ :pair | 
				html table
					id: self ajaxId; class: 'report';
					with: [ 
						html tableBody
							style: 'font-size: 80%;';
							with: [
								html tableRow: [
									html tableData title: chapter date fineSpa;
													with: [ pair renderViewOn: html with: self ].
									html tableData 	id: 'flag-dialog-comments';
													with: [
														pair comments do: [ :comment |
															html paragraph	class: 'flag-comment-content';
																			with: [ html text: comment comment. ].
															comment user renderOn: (html paragraph class: 'flag-comment-user'; yourself).
														]
													].
												
								].
							]

						]									

					].
				 html break. 
	].
]

{ #category : #'as yet unclassified' }
LCFCommentsView >> renderContentOn: html [

	self renderBook: (self context root childrenDecoration at: 'cicloa' ) on: html.
	self renderBook: (self context root childrenDecoration at: 'ciclob' ) on: html.
	self renderBook: (self context root childrenDecoration at: 'cicloc' ) on: html.
	self renderBook: (self context root childrenDecoration at: 'mandamientos' ) on: html.

]

{ #category : #testing }
LCFCommentsView >> shouldRenderControls [
	^ false
]
