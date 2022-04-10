Class {
	#name : #TransPairCommand,
	#superclass : #TransPair,
	#instVars : [
		'level',
		'commandNu'
	],
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
TransPairCommand class >> eng: tiempo [

	^{
#IntroTC -> ''.
#Command1 -> 'Be authentically religious. Destroy your idols. You shall not have other gods besides me'.
#Command2 -> 'Be authentic. Do not presume or play God. Do not take God''s name in vain'.
#Command3 -> 'Develop a Sense of the Sacred in Work and Leisure. Keep Holy the Lord''s Day'.
#Command4 -> 'Do not disrespect parents or children. Honor your father and mother'.
#Command5 -> 'Respect life/Do not encourage violence. You shall not kill'.
#Command6 -> 'Be loving and faithful/ Do not violate others. Do not commit adultery'.
#Command7 -> 'Be honest. Respect others'' goods. You shall not steal'.
#Command8 -> 'Be truthful. Do not Lie/You shall not bear false witness against your neighbor'.
#Command9 -> 'Be faithful. Do not lust after another. You shall not covet your neighbor''s wife'.
#Command10 -> 'Be content with what you have. Do not covet your neighbor’s goods'
	} asDictionary at: tiempo

]

{ #category : #'as yet unclassified' }
TransPairCommand class >> from: aDate and: number [
	| pair |
	
	pair := self new.
	pair eng:         aDate eng .
	pair spa:         aDate spa .
	pair freezed:     true.
	pair comments:    aDate comments .
	pair accurate:    true .
	pair anchored:    aDate anchored .
	pair blind: aDate blind.
	pair commandNu: number.
	
	^ pair.
]

{ #category : #'as yet unclassified' }
TransPairCommand class >> spa: tiempo [

	^{
	#IntroTC -> 'Introducción'.
#Command1 -> 'Se autenticamente religioso. Destruye tus ídolos. No tendrás otros dioses mas que yo'.
#Command2 -> 'Se auténtico. No presumas o juegues a ser Dios. No tomes el nombre de Dios en vano'.
#Command3 -> 'Desarolla el sentido de lo sagrado en el trabajo y el placer. Respeta el día del Señor'.
#Command4 -> 'Respeta a tus padres e hijos. Honra a tu padre y madre'.
#Command5 -> 'Respeta la vida. No incites la violencia. No matarás'.
#Command6 -> 'Se amoroso y fiel. No violentes a otros. No cometerás adulterio'.
#Command7 -> 'Se honesto. Respeta a los vinenes agenos. No robarás'.
#Command8 -> 'Se franco. Mo mientas. No levantarás falso testimonio contra tu prógimo'.
#Command9 -> 'Se fiel. No codicies. No codiciarás la mujer de tu prógimo'.
#Command10 -> 'Conténtate con lo que posees. No codiciarás los vienes de tu prógimo'
	} asDictionary at: tiempo

]

{ #category : #accessing }
TransPairCommand >> anchored [
	^ false
]

{ #category : #accessing }
TransPairCommand >> commandNu [
	^ commandNu
]

{ #category : #accessing }
TransPairCommand >> commandNu: anObject [
	commandNu := anObject
]

{ #category : #accessing }
TransPairCommand >> engCommand [
	^ self class eng: (self commandNu)
]

{ #category : #accessing }
TransPairCommand >> latexOn: html with: chapter [
	html nextPutAll: '\chapter*{', self latex, '\newline {\Large '; 
		nextPutAll: chapter parent headTitle; 
		nextPutAll: '}}
\addcontentsline{toc}{chapter}{', self latex, '}
\renewcommand{\leftmark}{', (self latex subStrings: '.') last, '}
\markright{', chapter parent headTitle, ': ', (TiempoLiturgico sections at: chapter tiempo), '}'; cr; cr.




]

{ #category : #accessing }
TransPairCommand >> level [
	^ level
]

{ #category : #accessing }
TransPairCommand >> level: anObject [
	level := anObject
]

{ #category : #accessing }
TransPairCommand >> renderEng: html on: chapterView anchor: anchor [
	html div: [ html text: self engCommand ].

]

{ #category : #accessing }
TransPairCommand >> renderSpa: chapterView with: html anchor: anchor [ 
	self isMissing ifFalse: [ 
		(html div) class: 'change-text';
				with: [ html emphasis with: self spaCommand ].
	].

]

{ #category : #accessing }
TransPairCommand >> spaCommand [
	^ self class spa: (self commandNu)
]

{ #category : #accessing }
TransPairCommand >> texSource [

	^ self spaCommand

]
