"
A LightModelChapterTest is a test class for testing the behavior of LightModelChapter
"
Class {
	#name : #LightModelChapterTest,
	#superclass : #TestCase,
	#category : #'Light-Tests'
}

{ #category : #tests }
LightModelChapterTest >> assert: lecturesLines accurate: accurate missing: missing [
	| lectures |

	lectures := LightModelLectures read: lecturesLines readStream.

	self assert: lectures accurate equals: accurate.
	self assert: lectures isMissing equals: missing.
	
	self assert: lecturesLines 
	     equals: ( String streamContents: [ :stream | lectures writeOn: stream ] ) 
]

{ #category : #tests }
LightModelChapterTest >> assert: component areWrittenAs: aStoredComponente [

	self assert: ( String streamContents: [ :stream | component do: [ :each | each writeOn: stream ] ] ) 
		  equals: aStoredComponente.
]

{ #category : #tests }
LightModelChapterTest >> assert: component isWrittenAs: aStoredComponente [
	self assert: ( String streamContents: [ :stream | component writeOn: stream ] ) 
		  equals: aStoredComponente.
]

{ #category : #tests }
LightModelChapterTest >> assert: aDate line: aLine  freezed: freezed on: aTime at: aDateStr [
	| chapter |

	LightModelDateMoment on: 'Date<', aDate, '>;'.
	
	chapter := LightModelChapter new.
	LightModelChapter readAttrs: chapter on: aLine.
	self assert: chapter freezed equals: freezed.
	self assert: chapter tiempo equals: aTime.
	self assert: (chapter moment date printFormat: #(3 2 1 $. 1 1 2)) equals: aDateStr.
	
]

{ #category : #tests }
LightModelChapterTest >> assertAttrsReadingFailAfterReset: aLine [

	LightModelDateMoment resetMoment.
	self should: [ LightModelChapter readAttrs: LightModelChapter new on: aLine] raise: Error 
	
]

{ #category : #samples }
LightModelChapterTest >> sampleAttrs [

	^ ' Tiempo<Adviento>; Date<11.30.2014>;
'
]

{ #category : #samples }
LightModelChapterTest >> sampleChapter [
	^  self sampleAttrs, 
	   self sampleTiempo, 
	   self sampleLectures, 
	   self sampleCrest, 
	   self sampleFilm, 
		self sampleFilmData, 
		self samplePoster,
		LightModelChapter outlineMarker, String cr, String cr,
		self sampleOutline,
		LightModelChapter commentMarker, String cr, String cr,
		self sampleComment,
		LightModelChapter dialogueMarker, String cr, String cr,
		LightModelChapter focusMarker, String cr, String cr,
		self sampleFocus,
		self sampleGospel,
		LightModelChapter keyseqMarker, String cr, String cr	,
		self sampleKeySeq,
		LightModelChapter reflectionMarker, String cr, String cr,
		self sampleReflection,
		LightModelChapter prayerMarker, String cr, String cr,
		self samplePrayer,
		LightModelChapter endMarker.
	
]

{ #category : #samples }
LightModelChapterTest >> sampleComment [

	^ 'The production company, Merchant Ivory, has a reputation ....



Remains of the Day is a very elegant movie,...



Anthony Hopkins gives one of his most restrained .....tated love, tenderness and regret.



'
]

{ #category : #samples }
LightModelChapterTest >> sampleCrest [

	^ 'Dutifully waiting
Esperando obediente


'
]

{ #category : #samples }
LightModelChapterTest >> sampleFilm [

	^ 'The remains of the day
Lo que queda del día
Locked;Accurate;

'
]

{ #category : #samples }
LightModelChapterTest >> sampleFilmData [

	^ 'UK, 1993, 134 minutes.
Anthony Hopkins, Emma Thompson, James Fox, Christopher Reeve, Peter Vaughan, Hugh Grant, Michel Lonsdale, Ben Chaplin
Ruth Prawer Jhabvala
James Ivory

'
]

{ #category : #samples }
LightModelChapterTest >> sampleFocus [

	^ 'The butler, Stevens, in Remains of the Day, is a....coming.



'
]

{ #category : #samples }
LightModelChapterTest >> sampleGospel [

	^ 'The Church..... the gifts of the spirit.



The reading from Isaiah refers to th...lds the clay of Israel into a faithful people.



Jesus uses an image to highlight this se....



We do not live in a servant culture. It is d....



However, as we watch Anthony Hopkins as ....



In the aftermath of World....



'
]

{ #category : #samples }
LightModelChapterTest >> sampleKeySeq [

	^ 'Stevens and his meticulous work in the h....



Stevens and his complete loyalty to Lor...
Stevens y su completa lealtad a Lord Darl...


Stevens and his relationship with Miss Kenton, ...



'
]

{ #category : #samples }
LightModelChapterTest >> sampleLectures [

	^ 'Isaías 63:16-17; 64:1. 3-8.
1 Corintios 1:3-9.
Marcos 13:33-37.
Accurate;

'
]

{ #category : #samples }
LightModelChapterTest >> sampleOutline [

	^ 'Lewis, an American diplomat, ....



Stevens remembers the heydays of the 30s. ...



Downstairs, Stevens runs the household with an ....



Miss Kenton, has been concerned about the elderly ...



When Stevens, on his holiday, finally finds Miss Kento....



'
]

{ #category : #samples }
LightModelChapterTest >> samplePoster [

	^ 'http://ia.media-imdb.com/images/M/MV5BMTM2NzIwMTM5NV5BMl5BanBnXkFtZTcwNjQ2MTYyMQ@@._V1._SY317_.jpg
Accurate;

'
]

{ #category : #samples }
LightModelChapterTest >> samplePrayer [

	^ 'Lord, we are waiting for your coming ...erve you whenever you come. Amen.
Señor, estamos a la espera de tu ...


'
]

{ #category : #samples }
LightModelChapterTest >> sampleReflection [

	^ '<sin definir>



<sin definir>



<sin definir>



'
]

{ #category : #samples }
LightModelChapterTest >> sampleTiempo [

	^ 'First Sunday of Advent
Primer Domingo de Adviento
Locked;Accurate;

'
]

{ #category : #tests }
LightModelChapterTest >> testAttrLoading [

	self assert: '12.01.2013' line: 'Locked; Tiempo<Navidad>; Date<+6>;'   freezed: true  on: #Navidad  at: '2013.12.07'.
	self assert: '12.01.2013' line: ' Tiempo<Adviento>; Date<12.01.2013>;' freezed: false on: #Adviento at: '2013.12.01'.
	self assert: '12.01.2013' line: ' Tiempo<IntroTC>;'                    freezed: false on: #IntroTC  at: '2013.12.08'.
	self assert: '12.01.2013' line: ' Tiempo<Fija>; Date<12.28>;'          freezed: false on: #Fija     at: '2022.12.28'.
	self assert: '12.01.2013' line: 'Locked; Tiempo<Fija>; Date<03.25>;'   freezed: true  on: #Fija     at: '2023.03.25'.	
	self assert: '12.01.2013' line: self sampleAttrs   freezed: false  on: #Adviento     at: '2014.11.30'.
]

{ #category : #tests }
LightModelChapterTest >> testAttrLoadingFails [

	self assertAttrsReadingFailAfterReset: 'Locked; Tiempo<Navidad>; Date<+6>;'.
	self assertAttrsReadingFailAfterReset: ' Tiempo<IntroTC>;'.

	self assertAttrsReadingFailAfterReset: ' Tiempo<NoTime>; Date<+0>;'.
]

{ #category : #tests }
LightModelChapterTest >> testLecturesLoading [

	self assert: 'Sofonías 3:14-18
Filipenses 4:4-7
Lucas 3:10-18


' accurate: false missing: false.

	self assert: 'Sofonías 3:14-18
Filipenses 4:4-7
Lucas 3:10-18
Accurate;

' accurate: true missing: false.

	self assert: '<definir lecturas>


' accurate: false missing: true.

	self assert: self sampleLectures accurate: true missing: false.

]

{ #category : #tests }
LightModelChapterTest >> testLecturesParagraphs [
	| lectures lecturesLines |

	lecturesLines := 'Sofonías 3:14-18
Filipenses 4:4-7
Lucas 3:10-18


'. 
	lectures := LightModelLectures read: lecturesLines readStream.

	lectures paragraph: 'Sofonías 3:14-18
Filipenses 4:4-7
Lucas 3:10-18'.

	self assert: lecturesLines 
	     equals: ( String streamContents: [ :stream | lectures writeOn: stream ] ).
	
	lectures paragraph: '
	Sofonías 3:14-18
Filipenses 4:4-7   
  Lucas 3:10-18


'.
	self assert: lecturesLines 
	     equals: ( String streamContents: [ :stream | lectures writeOn: stream ] ) 
]

{ #category : #tests }
LightModelChapterTest >> testSampleChapterRead [
	| chap |
	
	chap := LightModelChapter new.
	
	LightModelChapter readChapter: self sampleChapter readStream into: chap.
	self deny: chap freezed.
	self assert: chap tiempo equals: #Adviento.
	self assert: (chap moment date printFormat: #(3 2 1 $. 1 1 2)) equals: '2014.11.30'.
	
	self assert: chap date isWrittenAs: self sampleTiempo.
	self assert: chap lectures isWrittenAs: self sampleLectures.
	self assert: chap crest isWrittenAs: self sampleCrest.
	self assert: chap film isWrittenAs: self sampleFilm.
	self assert: chap filmData isWrittenAs: self sampleFilmData.
	self assert: chap poster isWrittenAs: self samplePoster.
	self assert: chap outline areWrittenAs: self sampleOutline.
	self assert: chap comment areWrittenAs: self sampleComment.
	self assert: chap gospelFocus isWrittenAs: self sampleFocus .
	self assert: chap gospel areWrittenAs: self sampleGospel.
	self assert: chap keySequences areWrittenAs: self sampleKeySeq.
	self assert: chap reflection areWrittenAs: self sampleReflection.
	self assert: chap prayer isWrittenAs: self samplePrayer.

	
	
	
	

		

]

{ #category : #tests }
LightModelChapterTest >> testSampleChapterWrite [
	| chap |
	
	chap := LightModelChapter new.
	
	LightModelChapter readChapter: self sampleChapter readStream into: chap.
	self assert: (String streamContents: [ :stream | chap writeOn: stream ] ), LightModelChapter endMarker 
		 equals: self sampleChapter
	
	
	

		

]
