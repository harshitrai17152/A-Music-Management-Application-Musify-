
CREATE TABLE Korean_Songs (
		SongID Integer PRIMARY KEY,
		SongName varchar(100),
		ArtistID Integer NOT NULL,
		ArtistName varchar(100),                       # Artist :  BTS, PSY,  Red Velvet,  TWICE
		Lyrics varchar(10000),
		ReleaseDate Date,                                                 
		Rating Integer,
		TotalReviews Integer,
		GenreID varchar(100) NOT NULL,
		MoodID varchar(100) NOT NULL,
		FilmID Integer ,	
		SongFilePath varchar(200),
		Image Blob(16)
);

INSERT INTO Korean_Songs(SongID, SongName, ArtistID, ArtistName, Lyrics, ReleaseDate, Rating, TotalReviews, GenreID, MoodID, FilmID, SongFilePath, Image)
VALUES(
			801,
			'Fake Love',
			83,
			'BTS',     
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K1.txt",    
			'2018-5-15',
			3, 		# Rating
			100,  	# Total Reviews
			903,		# K-Pop
			104,		# Melancholic
			43,         #album : Love yourself : Tear
			"/home/akshyta/Desktop/DBMS_Project/Songs/K1.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K1.jpg"
),

(
			802,
			'Blood Sweat & Tears',
			83,
			'BTS',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K2.txt",    
			'2016-10-10', 	#yyyy-mm-dd
			5,
			129,
			901, #K-Pop
			104, #Meloncholy
			43, # ALBUM
			"/home/akshyta/Desktop/DBMS_Project/Songs/K2.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K2.jpg"
),

(
			803,
			'Save Me',
			83,
			'BTS',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K3.txt",    
			'2016-5-2',
			5,
			100,
			903, #K-Pop
			103, #Energetic
			43, # ALBUM
			"/home/akshyta/Desktop/DBMS_Project/Songs/K3.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K3.jpg"
),

(
			804,
			'Spring Day',
			83,
			'BTS',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K4.txt",    
			'2017-2-13',
			3,
			70,
			901, # K-Pop
			101, #Happy
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K4.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K4.jpg"
),

(
			805,
			'Make It Right',
			83,
			'BTS',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K5.txt",    
			'2019-2-18',
			5,
			200,
			909, #K-Pop
			104, # Melancholy
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K5.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K5.jpg"
),

(
			806,
			'Fire',
			83,
			'BTS',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K6.txt",    
			'2016-5-2',
			4,
			159,
			901, # Pop
			105,
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K6.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K6.jpg"
),


(
			807,
			'Gangnam Style',
			84,
			'PSY',     
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K7.txt",    
			'2012-7-15',
			5, 		# Rating
			200,  	# Total Reviews
			905,		# K-Pop
			102,		# Party/Dance
			43,         #album : Love yourself : Tear
			"/home/akshyta/Desktop/DBMS_Project/Songs/K7.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K7.jpg"
),

(
			808,
			'Daddy',
			84,
			'PSY',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K8.txt",    
			'2015-11-30',
			4,
			50,
			905, #K-Pop
			105, #Energetic
			43, # ALBUM
			"/home/akshyta/Desktop/DBMS_Project/Songs/K8.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K8.jpg"
),

(
			809,
			'Hangover',
			84,
			'PSY',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K9.txt",    
			'2014-6-8',
			4,
			100,
			901, #Pop
			105, #Energetic
			43, # ALBUM
			"/home/akshyta/Desktop/DBMS_Project/Songs/K9.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K9.jpg"
),

(
			810,
			'Right Now',
			84,
			'PSY',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K10.txt",    
			'2010-10-21',
			3,
			130,
			905, #Electronic Dance
			102, #Energetic
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K10.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K10.jpg"
),

(
			811,
			'We are the One',
			84,
			'PSY',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K11.txt",    
			'2013-3-7',
			4,
			20,
			902, # Rock
			101, # Happy
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K11.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K11.jpg"
),

(
			812,
			'In my Eyes',
			84,
			'PSY',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K12.txt",    
			'2010-10-30',
			3,
			100,
			901, #Pop
			101, # Happy
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K12.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K12.jpg"
),

(
			813,
			'Psycho',
			85,
			'Red Velvet',     
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K13.txt",    
			'2019-12-23',
			4, 		# Rating
			180,  	# Total Reviews
			909,		# K-Pop
			106,		# Relax
			43,         
			"/home/akshyta/Desktop/DBMS_Project/Songs/K13.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K13.jpg"
),

(
			814,
			'Bad Boy',
			85,
			'Red Velvet',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K14.txt",    
			'2018-1-29',
			5,
			70,
			903, #K-Pop
			104, #Melancholy
			43, # ALBUM
			"/home/akshyta/Desktop/DBMS_Project/Songs/K14.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K14.jpg"
),

(
			815,
			'umpah umpah ',
			85,
			'Red Velvet',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K15.txt",    
			'2019-8-20',
			3,
			150,
			901, #Pop
			106, #Relax
			43, # ALBUM
			"/home/akshyta/Desktop/DBMS_Project/Songs/K15.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K15.jpg"
),

(
			816,
			'peek-a-boo',
			85,
			'Red Velvet',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K16.txt",    
			'2017-11-17',
			4,
			90,
			904, # K-pop
			104, #Meloncholy
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K15.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K15.jpg"
),

(
			817,
			'Red Flavour',
			85,
			'Red Velvet',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K17.txt",    
			'2017-7-9',
			3,
			60,
			901, #K-Pop
			102, # Party
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K17.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K17.jpg"
),

(
			818,
			'Dumb Dumb',
			85,
			'Red Velvet',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K18.txt",    
			'2015-9-8',
			4,
			140,
			901, # Pop
			102, # Party
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K18.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K18.jpg"
),



(
			819,
			'TT',
			86,
			'TWICE',     
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K19.txt",    
			'2016-10-24',
			4, 		# Rating
			100,  	# Total Reviews
			901,		# K-Pop
			101,		# Happy
			43,        
			"/home/akshyta/Desktop/DBMS_Project/Songs/K19.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K19.jpg"
),

(
			820,
			'Feel Special',
			86,
			'TWICE',     
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K20.txt",    
			'2019-9-23',
			5,
			30,
			905, #Electronic Music/Dance
			102, #Party
			43, # ALBUM
			"/home/akshyta/Desktop/DBMS_Project/Songs/K20.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K20.jpg"
),

(
			821,
			'Fancy',
			86,
			'TWICE',     
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K21.txt",    
			'2019-4-22',
			5,
			110,
			901, #K-Pop
			102, #Party
			43, # ALBUM
			"/home/akshyta/Desktop/DBMS_Project/Songs/K21.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K21.jpg"
),

(
			822,
			'What is Love?',
			86,
			'TWICE',     
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K22.txt",    
			'2018-4-9',
			4,
			160,
			909,   #K-pop
			103, #romantic
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K22.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K22.jpg"
),

(
			823,
			'ooh-ahh',
			86,
			'TWICE',     
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K23.txt",    
			'2015-10-20',
			4,
			103,
			901, #k-pop
			106, #Relax
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K23.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K23.jpg"
),

(
			824,
			'Cheer Up',
			86,
			'TWICE',     
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K24.txt",    
			'2016-4-25',
			4,
			150,
			905, #K-pop
			101, #happy
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K24.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K24.jpg"
),


(
			825,
			'Knock Knock',
			86,
			'TWICE',     
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/K25.txt",    
			'2017-2-20',
			5,
			160,
			901, #pop
			102, #party/Dance
			43,
			"/home/akshyta/Desktop/DBMS_Project/Songs/K25.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/K25.jpg"
);

