Class {
	#name : #LigPeterPage,
	#superclass : #LigPageComponent,
	#category : #'Light-Pages'
}

{ #category : #rendering }
LigPeterPage >> holder [
	^ self root
]

{ #category : #rendering }
LigPeterPage >> renderContentOn: html [
    html paragraph: 'Nota: El *website de Peter Malone>http://www.signis.net/malone/* 
contiene comentarios sobre varios cientos de films, sus críticas desde 2009, 
posiciones de SIGNIS sobre algunos films particulares, 
entrevistas con directores Australianos y 
el SIGNIS Film Reviewing Project.'.
    html paragraph: [ 
		html strong: 'Peter Malone'.
		html text: ' at '.
		html anchor url: 'http://signis.net/news/culture/04-09-2019/former-signis-president-peter-malone-releases-new-book-on-catholic-priests-in-cinema';
						with: 'signis'.
		html image url: 'http://signis.net/userfiles/redacao/noticias/70e6775d30af7d7a983fc85173f1c140.jpg'
	].
    html paragraph: '!!!CV/Breve


;Nacido
:Sydney, NSW, Australia, 8th August 1939.<br>
;Educacion
:Bowral, NSW.
;Orden Sacerdotal
:Rome, 3rd April, 1965.


!Estudios
;Arts Degree MA Qual
:(Australian History), Australian National University, Canberra, 1960-8:
;Theology Degree
:Gregorian, Rome, 1962-6.
;Honorary Doctorate in Theology
:Melbourne, College of Divinity, Australia, 2008.


!Academia
;Daramalan College
:Canberra (High School), 1966-7, 1970.
;Theology and Scripture
:Canberra, 1968-71
;Theology and Scripture
:Yarra Theological Union (Melbourne College of Divinity) 1972-1998
;National Pastoral Institute
:Melbourne, 1973-1988,(including Diploma in Social Communications).
;Director
:Australian Catholic Film Office, 1996-8

;OCIC (Organisation Catholique Internatiionale du Cinema)
:Pacific region, President, 1989-1998.
:Directors'' Committee, 1990-1998.
:World President, 1998-2001
:Contributor to Cine & Media

;SIGNIS (The World Catholic Association for Cinema)
:World President, 2001-2005
:Cinema Desk, director 2006-2010
:Cinema desk, member 2010
:Contributor to SIGNIS Media

!Publicaciones

!!Libros
-The Film, Chevalier Press, Sydney, 1971.
-The Writing on the Wall, Westbooks, Perth, 1973 and 1978.
-200 Movies and Discussions I, Chevalier Press, Sydney, 1973.
-200 Movies and Discussions II, Chevalier Press, Sydney, 1975.
-Films and Values, Chevalier Press, Melbourne, 1978
-The Mystery of Christ, a course introducing theology, Y.T.U., Melbourne, 1983.
-Video at Home, ACTS, Melbourne, 1985.
-Nuclear Films, Spectrum, Melbourne, 1985.
-In Black and White and Colour, Aborigines in Australian Feature Films, Spectrum, Melbourne, 1987.
-Let a Viking Do it, Hagar and Family Illustrate the Myers Briggs Type Indicator, Collins Dove, Melbourne, 1988.
-Movie Christs and Antichrists, Parish Ministry Publications, Sydney, 1988; Crossroad, New York, 1990.
-Discovering an Australian Theology, co-ordinator, St Paul Publications, Sydney, 1988.
-The Australian Video Guide, Collins Dove, Melbourne, 1990.
-Traces of God, Collins Dove, Melbourne, 1991.
-Myers Briggs Goes to the Movies, Spectrum, Melbourne, 1991.
-Worth Watching: 30 Film Reviewers on Review, co-ordinator, Spectrum, Melbourne, 1994.
-Cinema Down Under, Australian Films at Home and to the World, OCIC, Brussels, 1996.
-Mirror, Mirror on the Screen, Type Resources, Gaithersberg, Md. 1996.
-From Back Pews to Front Stalls, Australian Feature Films in 100 years of Cinema, Co-ordinator, Chevalier Press, Sydney, 1996.
-Cinema, Religion and Values, OCIC, Brussels, 1999.  (French version: Festivals et Jurys. Criteres pour l''Attribution des prix).
-Developing an Australian Theology, St Paul Publications, Sydney, 1999.
-The Same as Christ Jesus, Gospel and Type, St Paul Publications, London, 2000.
-My Names,  Nelen Yubu, Sydney, 2000.
-Myth and Meaning, Australian directors in their own words, Currency Press, Sydney, 2001.
-Lights... Camera... Faith... A Movie Lectionary, Cycle A, Pauline Media, Boston, 2001.
-On Screen, Pauline Media, Manila, 2001.
-Lights... Camera... Faith... A Movie Lectionary, Cycle B, Pauline Media, Boston, 2002.
-Lights... Camera... Faith... A Movie Lectionary, Cycle C, Pauline Media, Boston, 2003.
-Can Movies be a Moral Compass? WACC, London, 2005.
-Lights...Camera... Faith...  The Ten Commandments, Pauline Media, Boston, 2006.
-Through a Catholic Lens (editor),  Rowman and Littlefield, 2007.
-Film and Faith,  CFA, Manila, 2008.
-Film and Faith and the Church, CFA, Manila, 2009.
-The Emergence of SIGNIS, Brussels, 2009
-Faith and Sacraments, CFA, Manila, 2011
-Jesus... According to the Scriptures, Chevalier Press, Sydney, 2011
-Film and Mary, CFA, Manila, 2012


!!Algunos Artículos
;Christology in the Suburbs: Edward Scissorhands
:in Explorations in Theology and Film, eds, Marsh, Ortiz, Blackwells, Oxford, 1997.
;Jesus on Screen
:in New Images of Religious Film, ed. John R. May, Sheed and Ward, Kansas City, 1997.
;Religion
:in The Oxford Companion to Australian Film, eds. McFarlane, Meyer, Bertrand, OUP, Melbourne, 1999.
;The Roman Catholic Church and Cinema (1967 to the present
:in The Routledge Companion to Religion and Film, ed. John Lyden, London and New York, 2009.
;Catholic Movies
:in The Continuum Companion to Religion and Film, ed. William Blizek, London, 2009.



!Jurado en Festivales de Cine y Video

;Melbourne International Film Festival
:President of OCIC jury for Annual Award for Short Australian Film, from 1992-1998
:Member of Festival Jury, 1994

;3rd World Religious and Educational Videomarket and
:Videoforum, Drieburgen, Holland, 1992,  
:President of Jury.

;4th World Religious and Educational Videomarket and
:Videoforum, Cologne, Germany, 1996,
:President of Jury.

;European Religious and Educational Videomarket and
:Videoforum, Vilnius, Lithuania, 2000,
:President of Jury.

;Venice Film Festival,
:Member of OCIC jury, 1993, 1994, 1996.
:President of OCIC Jury, 1999, 2000,
:SIGNIS Jury, 2002, 2003, 2004, 2006, 2007. Member, 2008, 2009.

;Berlin Film Festival,
:Member of Ecumenical Jury, 1995,
:President of Ecumenical Jury, 1999.

;Turnhout Film Festival, Focus on the South,
:President of OCIC Jury, 1999.

;Cannes Film Festival,
:President of Ecumenical Jury, 2000.
:President of Future Talents Jury, Semaine de la Critique, 2001.
:President of Ecumenical Jury, 2004

;Troia Film Festival,
:President of OCIC Jury, 2001.

;Montreal Film Festival,
:President of Ecumenical Jury, 2001.
:Member of Jury, 2005.

;Infinity Festival, Alba,
:President of SIGNIS Jury, 2002

;Fajr Film Festival, Tehran,
:President''s award, 2002,
:President of INTERFAITH Jury, 2003, 2004, 2007.
:Member of Spirituality Cinema Jury, 2005, 2008.  

;Hong Kong International Film Festival.  
:President of SIGNIS Jury, 2004

;Dhaka International Film Festival.  
:President of Festival International Jury,
:SIGNIS award.  2006, 2010, 2012.

;Zanzibar International Film Festival,
:President of SIGNIS Jury, 2005, 2006.

;Golden Apricot Festival, Yerevan, Armenia.
:Member of Ecumenical Jury, 2007.

;BAFICI, Buenos Aires, Argentina.
:Member of SIGNIS Jury, 2008.

;Molodist Festival, Kiev, Ukraine.
:President of Ecumenical Jury, 2008.

;Washington International Film Festival.
:Member of SIGNIS Jury, 2009.

;Havana International Film Festival.
:Member of SIGNIS Jury, 2009.'.
]

{ #category : #rendering }
LigPeterPage >> title [
	^ 'Peter Malone'
]
