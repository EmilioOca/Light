Class {
	#name : #LightModelDateMomentTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #tests }
LightModelDateMomentTest >> assertLine: attrsLine produces: aToken and: aDateStr with: nextDateStr [
 	| moment |
	moment := LightModelDateMoment on: attrsLine.
	
	self assert: moment expression equals: aToken.
	self assert: (moment date printFormat: #(3 2 1 $. 1 1 2)) equals: aDateStr.
	
	self assert: ((LightModelDateMoment on: '') date printFormat: #(3 2 1 $. 1 1 2)) equals: nextDateStr
]

{ #category : #tests }
LightModelDateMomentTest >> testMomentDiferentialsForALine [

	LightModelDateMoment on: 'Date<12.01.2013>;'.
	self assertLine: ' Tiempo<Navidad>; Date<+3>;' produces: 'Date<+3>' and: '2013.12.04' with: '2013.12.11'.
	
	LightModelDateMoment on: 'Date<12.01.2013>;'.
	self assertLine: ' Tiempo<Navidad>; Date<+0>;' produces: 'Date<+0>' and: '2013.12.01' with: '2013.12.08'.
	
	LightModelDateMoment on: 'Date<12.01.2013>;'.
	self assertLine: 'Locked; Tiempo<Navidad>; Date<+0>;' produces: 'Date<+0>' and: '2013.12.01' with: '2013.12.08'.
	
]

{ #category : #tests }
LightModelDateMomentTest >> testMomentFailsForALineWithBadFormat [
	LightModelDateMoment resetMoment.
	self should: [ LightModelDateMoment on: ' Tiempo<Navidad>; Date<01.14.14>;' 	] raise: Error.
		
	LightModelDateMoment on: 'Date<12.01.2013>;'.
	self should: [ LightModelDateMoment on: ' Tiempo<Navidad>; Date<01.14.14>;' 	] raise: Error.


]

{ #category : #tests }
LightModelDateMomentTest >> testMomentFailsForALineWithUnsetePrevious [

	LightModelDateMoment resetMoment.
	self should: [ LightModelDateMoment on: ' Tiempo<Command1>;' 	] raise: Error.
]

{ #category : #tests }
LightModelDateMomentTest >> testMomentSpecificForALine [

	self assertLine: ' Tiempo<Adviento>; Date<12.01.2013>;'  produces: 'Date<12.01.2013>' and: '2013.12.01' with: '2013.12.08'.
	self assertLine: ' Tiempo<Adviento>; Date<11.29.2015>;'  produces: 'Date<11.29.2015>' and: '2015.11.29' with: '2015.12.06'.
	self assertLine: ' Tiempo<Navidad>; Date<12.24.2015>;'   produces: 'Date<12.24.2015>' and: '2015.12.24' with: '2015.12.31'.
	self assertLine: ' Tiempo<Cuaresma>; Date<02.13.2013>;'  produces: 'Date<02.13.2013>' and: '2013.02.13' with: '2013.02.20'.
	self assertLine: ' Tiempo<Triduo>; Date<03.29.2015>;'    produces: 'Date<03.29.2015>' and: '2015.03.29' with: '2015.04.05'.
	self assertLine: ' Tiempo<Pascua>;Date<05.26.2013>;'     produces: 'Date<05.26.2013>' and: '2013.05.26' with: '2013.06.02'.
	self assertLine: ' Tiempo<Ordinario>; Date<01.13.2013>;' produces: 'Date<01.13.2013>' and: '2013.01.13' with: '2013.01.20'.


]

{ #category : #tests }
LightModelDateMomentTest >> testMomentUnspecifiedForALine [

	LightModelDateMoment on: 'Date<12.01.2013>;'.
	self assertLine: '' 		  						  produces: '' and: '2013.12.08' with: '2013.12.15'.
	LightModelDateMoment on: 'Date<12.01.2013>;'.
	self assertLine: ' Tiempo<Fija>;' 		     produces: '' and: '2013.12.08' with: '2013.12.15'.
	LightModelDateMoment on: 'Date<12.01.2013>;'.
	self assertLine: 'Locked; Tiempo<Command1>;' produces: '' and: '2013.12.08' with: '2013.12.15'.
	
]

{ #category : #tests }
LightModelDateMomentTest >> testMomentYearlyForALine [

	"self assertLine: ' Tiempo<Fija>; Date<12.28>;' 		  produces: 'Date<12.28>' and: '2021.12.28' with: '2022.01.04'."
	self assertLine: ' Tiempo<Fija>; Date<12.28>;' 		  produces: 'Date<12.28>' and: '2022.12.28' with: '2023.01.04'.
			
	"self assertLine: ' Tiempo<Fija>; Date<11.02>;' 		  produces: 'Date<11.02>' and: '2021.11.02' with: '2021.11.09'."
	self assertLine: ' Tiempo<Fija>; Date<11.02>;' 		  produces: 'Date<11.02>' and: '2022.11.02' with: '2022.11.09'.
	self assertLine: 'Locked; Tiempo<Fija>; Date<03.25>;' produces: 'Date<03.25>' and: '2023.03.25' with: '2023.04.01'.
	
]
