Class {
	#name : #LightModelTiempoLiturgicoTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #tests }
LightModelTiempoLiturgicoTest >> assertLine: attrsLine produces: aTag [ 

	self assert: (LightModelTiempoLiturgico keyFor: attrsLine ) equals: aTag
]

{ #category : #tests }
LightModelTiempoLiturgicoTest >> testKeyForALine [

	self assertLine: 'Locked; Tiempo<Navidad>; Date<+6>;'   produces: #Navidad.
	self assertLine: ' Tiempo<Adviento>; Date<12.01.2013>;' produces: #Adviento.
	self assertLine: ' Tiempo<Adviento>; Date<12.01.2013>;' produces: #Adviento.
	self assertLine: ' Tiempo<IntroTC>;' produces: #IntroTC.
	self assertLine: ' Tiempo<Command1>;' produces: #Command1.
	self assertLine: ' Tiempo<Command2>;' produces: #Command2.
	self assertLine: ' Tiempo<Command3>;' produces: #Command3.
	self assertLine: ' Tiempo<Command4>;' produces: #Command4.
	self assertLine: ' Tiempo<Command5>;' produces: #Command5.
	self assertLine: ' Tiempo<Command6>;' produces: #Command6.
	self assertLine: ' Tiempo<Command7>;' produces: #Command7.
	self assertLine: ' Tiempo<Command8>;' produces: #Command8.
	self assertLine: ' Tiempo<Command9>;' produces: #Command9.
	self assertLine: ' Tiempo<Command10>;' produces: #Command10.
	self assertLine: ' Tiempo<Adviento>; Date<11.29.2015>;' produces: #Adviento.
	self assertLine: ' Tiempo<Adviento>;' produces: #Adviento.
	self assertLine: ' Tiempo<Navidad>; Date<12.24.2015>;' produces: #Navidad.
	self assertLine: ' Tiempo<Navidad>; Date<+3>;' produces: #Navidad.
	self assertLine: ' Tiempo<Navidad>; Date<+0>;' produces: #Navidad.
	self assertLine: 'Locked; Tiempo<Navidad>; Date<+0>;' produces: #Navidad.
	self assertLine: ' Tiempo<Navidad>; Date<+0>;' produces: #Navidad.
	self assertLine: 'Locked; Tiempo<Navidad>; Date<+6>;' produces: #Navidad.
	self assertLine: ' Tiempo<Navidad>; Date<01.14.14>;' produces: #Navidad.
	self assertLine: ' Tiempo<Cuaresma>; Date<02.13.2013>;' produces: #Cuaresma.
	self assertLine: ' Tiempo<Cuaresma>; Date<+4>;' produces: #Cuaresma.
	self assertLine: ' Tiempo<Cuaresma>;' produces: #Cuaresma.
	self assertLine: 'Locked; Tiempo<Cuaresma>;' produces: #Cuaresma.
	self assertLine: ' Tiempo<Triduo>;' produces: #Triduo.
	self assertLine: ' Tiempo<Triduo>; Date<+1>;' produces: #Triduo.
	self assertLine: ' Tiempo<Triduo>; Date<03.29.2015>;' produces: #Triduo.
	self assertLine: ' Tiempo<Pascua>; Date<+1>;' produces: #Pascua.
	self assertLine: ' Tiempo<Pascua>;Date<05.26.2013>;' produces: #Pascua.
	self assertLine: ' Tiempo<Ordinario>; Date<01.13.2013>;' produces: #Ordinario.
	self assertLine: ' Tiempo<Ordinario>;' produces: #Ordinario.
	self assertLine: ' Tiempo<Fija>; Date<12.28>;' produces: #Fija.
	self assertLine: ' Tiempo<Fija>; Date<11.02>;' produces: #Fija.
	self assertLine: 'Locked; Tiempo<Fija>; Date<03.25>;' produces: #Fija.
	
]
