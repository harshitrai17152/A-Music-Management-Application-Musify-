create database spo;
use spo;

CREATE TABLE User (
    UserID INTEGER,
    UserName VARCHAR(100),
    LoginID VARCHAR(100),
    Password VARCHAR(20),
    Subscription BOOLEAN,
    Followers INTEGER,
    FavouriteArtist VARCHAR(100),
    PRIMARY KEY (UserID)
);


CREATE TABLE Artist (
    ArtistID INTEGER NOT NULL,
    ArtistName VARCHAR(100),
	LoginID VARCHAR(100),
    Password VARCHAR(20),
    TotalSongs INTEGER,
    UsersFollowing INTEGER,
    ArtistBio VARCHAR(1000),
    Payment INTEGER,
    PRIMARY KEY (ArtistID)
);

CREATE TABLE FilmMakers (
    FilmMakerID INTEGER NOT NULL,
    FilmMakerName VARCHAR(100),
	LoginID VARCHAR(100),
    Password VARCHAR(20),
    FilmName VARCHAR(100),
    FilmID INTEGER NOT NULL,
    FilmDescription VARCHAR(1000),
    Payment INTEGER,
    PRIMARY KEY (FilmID)
);

CREATE TABLE Hindi_Songs (
    SongID INTEGER,
    SongName VARCHAR(100),
    ArtistID INTEGER NOT NULL,
    ArtistName VARCHAR(100),
    Lyrics VARCHAR(13683),
    ReleaseDate DATE,
    Rating INTEGER,
    TotalReviews INTEGER,
    GenreID INTEGER NOT NULL,
    MoodID INTEGER NOT NULL,
    FilmID INTEGER NOT NULL,
    SongFilePath VARCHAR(200),
    Image BLOB(16),
    PRIMARY KEY (SongID),
    FOREIGN KEY (GenreID)
        REFERENCES Genre (GenreID),
    FOREIGN KEY (ArtistID)
        REFERENCES Artist (ArtistID),
    FOREIGN KEY (MoodID)
        REFERENCES Mood (MoodID),
    FOREIGN KEY (FilmID)
        REFERENCES FilmMakers (FilmID)
);

CREATE TABLE English_Songs (
    SongID INTEGER,
    SongName VARCHAR(100),
    ArtistID INTEGER NOT NULL,
    ArtistName VARCHAR(100),
    Lyrics VARCHAR(13683),
    ReleaseDate DATE,
    Rating INTEGER,
    TotalReviews INTEGER,
    GenreID INTEGER NOT NULL,
    MoodID INTEGER NOT NULL,
    FilmID INTEGER NOT NULL,
    SongFilePath VARCHAR(200),
    Image BLOB(16),
    PRIMARY KEY (SongID),
    FOREIGN KEY (GenreID)
        REFERENCES Genre (GenreID),
    FOREIGN KEY (ArtistID)
        REFERENCES Artist (ArtistID),
    FOREIGN KEY (MoodID)
        REFERENCES Mood (MoodID),
    FOREIGN KEY (FilmID)
        REFERENCES FilmMakers (FilmID)
);

CREATE TABLE Punjabi_Songs (
    SongID INTEGER,
    SongName VARCHAR(100),
    ArtistID INTEGER NOT NULL,
    ArtistName VARCHAR(100),
    Lyrics VARCHAR(13683),
    ReleaseDate DATE,
    Rating INTEGER,
    TotalReviews INTEGER,
    GenreID INTEGER NOT NULL,
    MoodID INTEGER NOT NULL,
    FilmID INTEGER NOT NULL,
    SongFilePath VARCHAR(200),
    Images varchar(200),
    PRIMARY KEY (SongID),
    FOREIGN KEY (GenreID)
        REFERENCES Genre (GenreID),
    FOREIGN KEY (ArtistID)
        REFERENCES Artist (ArtistID),
    FOREIGN KEY (MoodID)
        REFERENCES Mood (MoodID),
    FOREIGN KEY (FilmID)
        REFERENCES FilmMakers (FilmID)
);

CREATE TABLE Gujrati_Songs (
    SongID INTEGER,
    SongName VARCHAR(100),
    ArtistID INTEGER NOT NULL,
    ArtistName VARCHAR(100),
    Lyrics VARCHAR(13683),
    ReleaseDate DATE,
    Rating INTEGER,
    TotalReviews INTEGER,
    GenreID INTEGER NOT NULL,
    MoodID INTEGER NOT NULL,
    FilmID INTEGER NOT NULL,
    SongFilePath VARCHAR(200),
    Image BLOB(16),
    PRIMARY KEY (SongID),
    FOREIGN KEY (GenreID)
        REFERENCES Genre (GenreID),
    FOREIGN KEY (ArtistID)
        REFERENCES Artist (ArtistID),
    FOREIGN KEY (MoodID)
        REFERENCES Mood (MoodID),
    FOREIGN KEY (FilmID)
        REFERENCES FilmMakers (FilmID)
);

CREATE TABLE Korean_Songs (
    SongID INTEGER,
    SongName VARCHAR(100),
    ArtistID INTEGER NOT NULL,
    ArtistName VARCHAR(100),
    Lyrics VARCHAR(13683),
    ReleaseDate DATE,
    Rating INTEGER,
    TotalReviews INTEGER,
    GenreID INTEGER NOT NULL,
    MoodID INTEGER NOT NULL,
    FilmID INTEGER NOT NULL,
    SongFilePath VARCHAR(200),
    Image BLOB(16),
    PRIMARY KEY (SongID),
    FOREIGN KEY (GenreID)
        REFERENCES Genre (GenreID),
    FOREIGN KEY (ArtistID)
        REFERENCES Artist (ArtistID),
    FOREIGN KEY (MoodID)
        REFERENCES Mood (MoodID),
    FOREIGN KEY (FilmID)
        REFERENCES FilmMakers (FilmID)
);

CREATE TABLE Genre (
    GenreID INTEGER NOT NULL,
    GenreName VARCHAR(100),
    TotalSongs INTEGER,
    PRIMARY KEY (GenreID)
);

CREATE TABLE Mood (
    MoodID INTEGER NOT NULL,
    MoodName VARCHAR(100),
    TotalSongs INTEGER,
    PRIMARY KEY (MoodID)
);

CREATE TABLE Favorite_Songs (
    SongID INTEGER NOT NULL,
    UserID INTEGER NOT NULL,
    FOREIGN KEY (UserID)
        REFERENCES User (UserID)
);

CREATE TABLE Songs_Listened (
    SongID INTEGER NOT NULL,
    UserID INTEGER NOT NULL,
    FOREIGN KEY (UserID)
        REFERENCES User (UserID)
);

								# POPULATING THE RELATIONS
                                
INSERT INTO Genre(GenreID,GenreName,TotalSongs)
VALUES	(901,'Pop', 59);
INSERT INTO Genre(GenreID,GenreName,TotalSongs)
VALUES	(902,'Rock', 34);
INSERT INTO Genre(GenreID,GenreName,TotalSongs)
VALUES	(903,'Hip-Hop',15);
INSERT INTO Genre(GenreID,GenreName,TotalSongs)
VALUES	(904,'R&B', 23);
INSERT INTO Genre(GenreID,GenreName,TotalSongs)
VALUES	(905,'Electronic Dance', 24);
INSERT INTO Genre(GenreID,GenreName,TotalSongs)
VALUES	(906,'Classical', 3);
INSERT INTO Genre(GenreID,GenreName,TotalSongs)
VALUES	(907,'Country Music', 3);
INSERT INTO Genre(GenreID,GenreName,TotalSongs)
VALUES	(908,'Jazz',3);	
INSERT INTO Genre(GenreID,GenreName,TotalSongs)
VALUES	(909,'Romance',6);

insert into Mood values( 101, 'Happy', 33 );
insert into Mood values( 102, 'Party/Dance', 42 );
insert into Mood values( 103, 'Romantic', 30 );
insert into Mood values( 104, 'Melancholy', 33 );
insert into Mood values( 105, 'Energetic', 35 );
insert into Mood values( 106, 'Relax', 11 );

Insert into Artist values(1,"Alka Yagnik","tvoyrgpiw","kbmiaczcm",1,13,"She is noted in Indian cinema for a career spanning over three decades.",9909105);
Insert into Artist values(2,"Arijit Singh","ggzgxnfmm","eovwkrmgn",1,110,"He sings predominantly in Hindi and Bengali but has also performed in various other Indian languages.",5588288);
Insert into Artist values(3,"Asha Bhosle","ffjyvifca","tjauszosd",1,129,"She is best known for her playback singing in Hindi cinema, although she has a wider repertoire.",875190);
Insert into Artist values(4,"Neha Kakkar","aypbngnez","flepalbdb",2,42,"She competed on season 2 of the television reality show Indian Idol in 2006 ",3191418);
Insert into Artist values(5,"Shreya Ghoshal","ralpzjemq","faafkpdkt",3,31,"She has received four National Film Awards, four Kerala State Film Awards, two Tamil Nadu State Film Awards, seven Filmfare Awards ",6793888);
Insert into Artist values(6,"Vishal Shekar","tmrazmqic","mykjbwgtz",1,23,"Vishal n Shekhar are an Indian music production, singer & songwriting duo.",613993);
Insert into Artist values(7,"Kishore Kumar","hgxeodszf","rbaofptps",1,173,"Abhas Kumar Ganguly (born 4 August 1929 - 13 October 1987), better known by his stage name Kishore Kumar was an Indian playback singer, actor, music director, lyricist, writer, director, producer and screenwriter.",8496762);
Insert into Artist values(8,"A.R. Rahman","adocgyzst","fwjgeymzg",1,184,"Allahrakka Rahman born A. S. Dileep Kumar on 6 January 1967), known professionally as A. R. Rahman, is an Indian composer, singer and music producer.",9682491);
Insert into Artist values(9,"Atif Aslam","ivzbligfr","vxtyxihwh",1,136,"Muhammad Atif Aslam born 12 March 1985 is a Pakistani playback singer and actor.",3336911);
Insert into Artist values(10,"Sonu Nigam","rlsedkqjx","ohpymlhzn",2,186,"Sonu Nigam (born 30 July 1973) is an Indian playback singer, live performer, composer, host, and actor.",5635701);
Insert into Artist values(11,"Kumar Sanu","gyhnqswzc","ukcfyytzg",3,3,"Kedarnath Bhattacharjee (born 20 October 1957), better known as Kumar Sanu, is an Indian playback singer who mainly sings for Hindi and Bengali films.",2726314);
Insert into Artist values(12,"Pritam","yhajwuvcl","xsjilzcfl",2,37,"Pritam Chakraborty (born 14 June 1971), also known mononymously as Pritam, is an Indian composer, instrumentalist, electronic guitar player, singer for Bollywood films.",2537943);
Insert into Artist values(13,"Badshah","yojmgqjav","ogoyqmyrk",1,115,"Aditya Prateek Singh Sisodia, better known by his stage name Badshah, is an Indian rapper and singer known for his Hindi, Haryanvi, and Punjabi songs.",8027790);
Insert into Artist values(14,"Anu Malik","plgybtykd","oexaohmrq",1,187,"Anwar Sardar Malik (born 2 November 1960), best known as Anu Malik, is an Indian music director and singer.",9372065);
Insert into Artist values(15,"Diljit Dosanjh","pemjkwpyn","ugdcekzaz",1,156,"Diljit Dosanjh (born 6 January 1984) is an Indian singer, actor, television presenter and social media celebrity[1] who works in Punjabi and Hindi cinema.",8665687);
Insert into Artist values(16,"Shankar Mahadevan","pfyyqrgzi","skvombaak",1,114,"Shankar Mahadevan (born 3 March 1967) is an Indian singer and composer who is part of the Shankar Ehsaan Loy composing trio team for Indian films.",6083701);
Insert into Artist values(17,"Shankar Ehsaan Loy","uavvpokjt","xtkrqdwdc",2,156,"Shankar Ehsaan Loy (About this soundpronunciation (help info)) is an Indian musical trio consisting of Shankar Mahadevan, Ehsaan Noorani and Loy Mendonsa.",3094639);
Insert into Artist values(18,"Bappi Lahiri","gzzyqegya","jsniuufta",1,57,"Alokesh Lahiri is an Indian singer, composer, dancer, disco musician, actor and record producer. He popularized the use of synthesized disco music in Indian cinema and sang some of his own compositions.",8507594);
Insert into Artist values(19,"Shaan","huedtpfgy","yqtfupejd",2,83,"Shantanu Mukherjee (born 30 September 1972), known as Shaan, is an Indian playback singer active in Hindi, Bengali, Marathi, Urdu, Telugu and Kannada films and a television host.",3657384);
Insert into Artist values(20,"S.D.Burman","duaoajuzo","fhwjemkoj",2,157,"Sachin Dev Burman (1 October 1906 to 31 October 1975) was an Indian music director and singer. A member of the Tripura royal family, he started his career with Bengali films in 1937. ",4248571);
Insert into Artist values(21,"Gajendra Verma","ymniualtz","zjhllhkpk",1,94,"Gajendra Verma is an Indian singer, composer, lyricist and sound recordist . He came under the spotlight when he claimed that his song, titled Emptiness, also known as Tune Mere Jaana.",4211375);
Insert into Artist values(22,"Benny Dayal","tzeqmgcdl","lmdzkbuxv",1,7,"Benny Dayal (born 13 May 1984) is an Indian playback singer. He is a prominent singer in Hindi, Tamil, Telugu, Malayalam, Kannada, Bengali, Gujarati and Marathi languages films.",4182814);
Insert into Artist values(23,"Richa Sharma","edfxxdsjx","livpcchzr",1,168,"Richa Sharma (born 29 August 1974) is an Indian film playback singer as well a devotional singer.[1][2]",9963654);
Insert into Artist values(24,"Falguni Pathak","lnpkyothz","eenhgcjpb",5,106,"Falguni Pathak (born 12 March 1964) is an Indian singer, performing artist, and composer based in Mumbai. Her music is based on traditional musical forms from the Indian state of Gujarat. ",1974365);
Insert into Artist values(25,"Meet Bros","lkbkdkjlo","oyplhwqpc",1,100,"Meet Bros is a music director duo from Gwalior, Madhya Pradesh, India.",5787652);
Insert into Artist values(26,"Mika Singh","zasgdtncr","ibpgjissq",1,123,"Mika Singh is an Indian playback singer and live performer. Amongst a wide catalogue of songs, the prominent ones are Bas Ek King (Singh Is Kinng), Mauja Hi Mauja (Jab We Met), Ibn e Batuta (Ishqiya), and Dhanno (Housefull). ",5289229);
Insert into Artist values(27,"Sanjay Oza","vvmedtqtp","qlukhiuhx",3,124,"SANJAY OZA- A soulful singer, with a voice full of strength and expression.",2119029);
Insert into Artist values(28,"Parth Chaudhary","oakozingf","mmkhghvdw",2,113,"Parth Chaudhary is one among the Gujrati song artists of India.",4014060);
Insert into Artist values(29,"Geeta Rabari","tckqjkcdp","vxmnajlmy",2,40,"Geeta Rabari was born on 31 December 1996 in Kutch, Gujarat.",4453874);
Insert into Artist values(30,"Vijay Suvada","vbewjalje","kjegthhwk",1,62,"Vijay Suvada is one among the Gujrati song artists of India.",8025033);
Insert into Artist values(31,"Sachin Jigar","egpxiyvto","hrbxkhduf",2,70,"Sachin Jigar is a music composer duo from Mumbai, India, consisting of Sachin Sanghvi and Jigar Saraiya. They compose for Bollywood and Gujarati movies.",6212840);
Insert into Artist values(32,"Jayker Bhojak","lhpctfpxe","tardqfyur",3,77,"Jaishankar Bhudhardas Bhojak, (30 January 1889 - 22 January 1975) better known by his theatre name Jaishankar Sundari , was an Indian actor and director of Gujarati theatre.",5309914);
Insert into Artist values(33,"Shyamal Saumil","shgwvamxz","aemjvyboa",2,23,"Shyamal Saumil is an Indian classical music duo formed in 1980, in Ahmedabad, Gujarat, India, composed of the Gujarati singers, Dr. Shyamal Munshi and Saumil Munshi.",9906256);
Insert into Artist values(34,"Aarti Munshi","snqporhdb","tilcorama",3,140,"Aarti Munshi is a popular gujrati singer.",4418037);
Insert into Artist values(35,"Vatsala Patil","ycbkdwdfp","urjbqzbvw",2,113,"Vatsala Patil was born in a simple middle class family on August 22, 1959,(Border line between LEO and VIRGO sun signs) in Vadodara, Gujarat, India",7196626);
Insert into Artist values(36,"Bhoomi Trivedi","wpfhelgjf","yhazjlpms",1,52,"Bhoomi Trivedi is an Indian singer, known for her Bollywood songs Ram Chahe Leela from Goliyon Ki Raasleela: Ram Leela (2013)",3746023);
Insert into Artist values(37,"Atul Purohit","cvtjxshvu","zkwnjmnqw",1,38,"ATUL PUROHIT is the KING of timeless DANDIYA - GARBA hits, and a Limca Records holder",2360622);
Insert into Artist values(38,"Paritosh Goswami","fmtioksmy","bhplfqvbk",1,49,"Paritosh Goswami is a director and actor, known for Kabhi Yuh Bhi Toh Ho (2014)",7660433);
Insert into Artist values(39,"Sachin Limaye","fxidymyrm","ascuiaevr",1,31,"Sachin Limaye is renowned singer from Gujarat, India",5566484);
Insert into Artist values(40,"Achal Mehta","yabkahupf","dhcvcatwe",1,118,"Achal Mehta is a veteran Garba artist who performs mostly in Baroda, Gujarat. He has produced a number of Garba albums",7542200);
Insert into Artist values(41,"Daler Mehndi","nsnvbpbog","hgohwbazb",1,9,"Daler Singh (born 18 August 1967), better known as Daler Mehndi, is an Indian singer, songwriter, author and record producer.",5821029);
Insert into Artist values(42,"Sukhwinder Singh","qtditywfa","esakoykcj",3,152,"Sukhwinder Singh (born 18 July 1971) is an internationally acclaimed Indian Bollywood playback singer. Singh is famous internationally for singing Jai Ho from the film Slumdog Millionaire",9701208);
Insert into Artist values(43,"Malkit Singh","tjerpcifi","sevpipomp",3,50,"Malkit Singh,(Malkit Singh Boparai, born in 1963) is England based Punjabi bhangra singer. Born in Hussainpur and raised in Nakodar, he moved to Birmingham in 1984",7439611);
Insert into Artist values(44,"Gurdas Maan","iwpzpihin","suotdteml",3,181,"Gurdas Maan (born 4 January 1957) is an Indian singer, songwriter, choreographer and actor mainly associated with Punjabi language music and films. He gained national attention in 1980 with the song Dil Da Mamla Hai",2699784);
Insert into Artist values(45,"Guru Randhawa","jgubzgibh","yrzciecar",3,199,"Gursharanjot Singh Randhawa (born 30 August 1991) is an Indian singer, songwriter and music composer associated with Punjabi, Bhangra, Indi pop and Bollywood music",4221972);
Insert into Artist values(46,"Jasdeep Singh Gill","kmcjxjvwe","vulhxdbvw",2,60,"Jasdeep Singh Gill is an Indian singer and actor mainly associated with Punjabi music and films",2937325);
Insert into Artist values(47,"Kesha","oaqbayvev","wkpcavotr",3,8,"Kesha Rose Sebert known mononymously as Kesha (formerly stylized Kesha), is an American singer, songwriter, rapper, and actress. In 2005, at age 18, Kesha was signed to Kemosabe Records",1108098);
Insert into Artist values(48,"Billie Eilish","yyhadvboe","cgtucqyci",5,94,"Billie Eilish Pirate Baird O Connell is an American singer and songwriter.",1176879);
Insert into Artist values(49,"Halsey","nupnmapml","pvvyabfzt",4,70,"Ashley Nicolette Frangipane known professionally as Halsey is an American singer and songwriter.She was signed by Astralwerks in 2014 and released her debut EP, Room 93, later that year",3692807);
Insert into Artist values(50,"Tove Lo","zlusobfgm","ezneielyw",2,144,"Ebba Tove Elsa Nilsson known professionally as Tove Lo is a Swedish singer and songwriter. Called Sweden darkest pop export by Rolling Stone, she is known for her raw, grunge influenced take on pop music",4796427);
Insert into Artist values(51,"Krewella","ndkbrkiun","rdnadtgqa",3,134,"Krewella is an American electronic dance music band from Northbrook, Illinois, United States, that formed in 2007.Their musical style has been mainly described as EDM dance rock and dance pop",1627373);
Insert into Artist values(52,"Tame Impala","dxoerhkxd","fnjqvzhva",2,83,"Tame Impala is an Australian psychedelic rock project led by multi instrumentalist Kevin Parker,[4] who writes, records, performs, and produces the music",793641);
Insert into Artist values(53,"The Weekend","djeaocglo","ikyehwhtt",4,79,"Abel Makkonen Tesfaye (born February 16, 1990), better known by his stage name The Weeknd, is a Canadian singer, songwriter, actor and record producer",6688641);
Insert into Artist values(54,"Selena Gomez","mzgntiwhz","qtsocjtcx",1,117,"Selena Marie Gomez (born July 22, 1992) is an American singer, songwriter, actress, and television produce",526783);
Insert into Artist values(55,"Adele","wdugabovn","gdrcmdxcj",3,92,"Adele Laurie Blue Adkins MBE is an English singer songwriter. After graduating from the BRIT School in 2006, Adele signed a recording contract with XL Recordings",3006476);
Insert into Artist values(56,"Akon","yxbcobxey","nkudttjyv",3,67,"Aliaune Damala Bouga Time Puru Nacka Lu Lu Lu Badara Akon Thiam is a Senegalese American singer, songwriter, record producer, entrepreneur, philanthropist and actor",5068318);
Insert into Artist values(57,"Alan Walker","svzbmxinn","atjgieyep",1,47,"Alan Olav Walker Bea is transexual (born 24 August 1997) is a British born Norwegian DJ and record producer",2907246);
Insert into Artist values(58,"Calvin Harris","ynpdeloim","dqcltaiqv",2,124,"Adam Richard Wiles (born 17 January 1984), known professionally as Calvin Harris, is a Scottish DJ, record producer, singer, and songwriter",370103);
Insert into Artist values(59,"Ariana Grande","adfumhqdq","ajdmuasfe",3,116,"Ariana Grande Butera (born June 26, 1993) is an American singer, songwriter, and actress. Born in Boca Raton",7020460);
Insert into Artist values(60,"Avicii","oaxbmljyk","nboypekla",2,51,"Tim Bergling (8 September 1989 to 20 April 2018), known professionally as Avic, was a Swedish DJ, electronic musician, and songwriter who specialized in audio programming, remixing and record producing",6928410);
Insert into Artist values(61,"Rita Ora","eqddteskq","jzgvojjad",1,5,"Rita Sahatciu Ora (born Rita Sahatciu; 26 November 1990) is an English singer, songwriter and actress",5363879);
Insert into Artist values(62,"Drake","ftcufkxgk","hbulbthuc",3,180,"Aubrey Drake Graham[11] (born October 24, 1986) is a Canadian rapper, singer, songwriter, producer, actor, and businessman",5919417);
Insert into Artist values(63,"Khalid","icbltyomm","vftxirsnq",2,92,"Khalid Donnel Robinson (born February 11, 1998) is an American singer and songwriter. He is signed to Right Hand Music Group and RCA Records",6946173);
Insert into Artist values(64,"Bon Iver","ppsmhqpmp","vbnlmyfif",1,123,"Bon Iver is an American indie folk band founded in 2006 by singer songwriter Justin Vernon",7279021);
Insert into Artist values(65,"Bon Jovi","hsgoyhhtx","cmvjhafdy",2,162,"Richie Sambora Bon Jovi is an American rock band formed in 1983 in Sayreville, New Jersey",5826820);
Insert into Artist values(66,"Bryan Adams","oqqncxkhv","sajscnumq",3,89,"Bryan Guy Adams OC OBC (born 5 November 1959) is a Canadian singer, songwriter, record producer, guitarist, photographer, philanthropist, and activist.",5356892);
Insert into Artist values(67,"Enrique Iglesias","izjwuaytj","gdtmzqmzl",2,101,"Bryan Guy Adams OC OBC (born 5 November 1959) is a Canadian singer, songwriter, record producer, guitarist, photographer, philanthropist, and activist",8415940);
Insert into Artist values(68,"Katy Perry","szsljkhqo","pjgtzqkya",2,79,"Enrique Miguel Iglesias Preysler (born 8 May 1975) is a Spanish Filipino singer, songwriter, actor and record producer who is widely regarded as the King of Latin Pop",7513141);
Insert into Artist values(69,"Jennifer Lopez","yqvcmucjq","gcnbxbbav",1,136,"Katheryn Elizabeth Hudson (born October 25, 1984), known professionally as Katy Perry, is an American singer, songwriter, and television judge. After singing in church during her childhood, she pursued a career in gospel music as a teenager.",2581749);
Insert into Artist values(70,"Dua Lipa","rmxsslevo","pgfjvojdw",2,76,"Jennifer Lynn Lopez[2] (born July 24, 1969), also known by her nickname J.Lo, is an American actress, singer, dancer, fashion designer, producer and businesswoman.",6922413);
Insert into Artist values(71,"Rihanna","jckkguyag","rkdqjraum",2,38,"Dua Lipa is an English singer, songwriter and model. After working as a model, she signed with Warner Music Group in 2015 and released her eponymous debut album in 2017",6308415);
Insert into Artist values(72,"Michael Jackson","zxosgvmdn","zwvfslske",1,196,"Robyn Rihanna Fenty is a Barbadian singer, songwriter, and businesswoman, who has been recognized for embracing various musical styles and reinventing her image throughout her career.",6923712);
Insert into Artist values(73,"Taylor Swift","ladyhzquh","hdnagsprk",2,1,"Michael Joseph Jackson was an American singer, songwriter, and dancer.",6960897);
Insert into Artist values(74,"Lady Gaga","qqfzlhyej","wiqzpfxjb",2,161,"Taylor Alison Swift is an American singer songwriter. She is known for narrative songs about her personal life, which have received widespread media coverage.",709812);
Insert into Artist values(75,"Camila Cabello","lxsehcqmt","fchkgyekd",2,19,"Stefani Joanne Angelina Germanotta, known professionally as Lady Gaga, is an American singer, songwriter, and actress.",5289869);
Insert into Artist values(76,"The Chainsmokers","jemyvkdbc","lncqonmgl",2,140,"Karla Camila Cabello Estrabao is a Cuban American singer, songwriter, and actress. ",9726054);
Insert into Artist values(77,"Daft Punk","hmvbqojiv","dbqphhvsw",1,163,"The Chainsmokers are an American electronic DJ and production duo consisting of Alexander Alex Pall and Andrew Drew Taggart. They started out by releasing remixes of songs by indie artists.",4708558);
Insert into Artist values(78,"DJ Snake","mpfmgsfar","kduvhdhxy",0,195,"Daft Punk is a French electronic music duo formed in Paris in 1993 by Guy Manuel de Homem Christo and Thomas Bangalter.",2991797);
Insert into Artist values(79,"Foreigner","aytuipfma","mcztcgqfm",0,12,"William Sami Etienne Grigahcine, known professionally as DJ Snake, is a French DJ, record producer, and music programmer from Paris.",8406470);
Insert into Artist values(80,"Cardi B","ihwesdlxg","tdcfcauqo",0,81,"Foreigner is a British-American rock band, originally formed in New York City & London in 1976 by veteran English musician and ex-Spooky Tooth member Mick Jones, and fellow Briton and ex-King Crimson member Ian McDonald along with American vocalist Lou Gramm.",308199);
Insert into Artist values(81,"Hot Chelle Rae","hzeubflby","yiyqfhuyy",0,136,"Belcalis Marlenis Almanzar, known professionally as Cardi B, is an American rapper, songwriter, television personality and actress. Born in Manhattan and raised in The Bronx, New York City.",1901581);
Insert into Artist values(82,"Imagine Dragons","fubupsjzt","vcwmgvqvf",0,148,"Hot Chelle Rae is an American rock band formed in Nashville, Tennessee, in 2005.",5695806);
Insert into Artist values(83,"BTS","muiijcudq","vnswyxlkq",6,188,"Imagine Dragons is an American pop rock band from Las Vegas, Nevada, consisting of lead singer Dan Reynolds, lead guitarist Wayne Sermon, bassist Ben McKee, and drummer Daniel Platzman.",334641);
Insert into Artist values(84,"PSY","dpykaadmc","sfzekbnwl",6,7,"BTS, also known as the Bangtan Boys, is a seven member South Korean boy band that began its formation in Seoul in 2010. The septet co writes and produces much of their output.",7105581);
Insert into Artist values(85,"Red Velvet","jnskhjpoe","yfdqvhhmv",6,172,"Park Jae sang, known professionally as Psy, stylized in all caps, is a South Korean singer, rapper, songwriter, and record producer. Psy is known domestically for his humorous videos and stage performances.",7642498);
Insert into Artist values(86,"TWICE","gzxaqkasa","yaxkerpje",7,8,"Red Velvet is a South Korean girl group formed by SM Entertainment. The group debuted on August 1, 2014, with the digital single Happiness and four group members: Irene, Seulgi, Wendy, and Joy.",4501588);
Insert into Artist values(87,"Queen","taeimlwpd","vldfqwnpa",3,31,"Twice is a South Korean girl group formed by JYP Entertainment through the 2015 reality show Sixteen. The group debuted on October 20, 2015, with the extended play The Story Begins.",558085);
Insert into Artist values(88,"pink floyd","payntxglh","srxaadfxv",4,124,"Queen are a British rock band formed in London in 1970. Their classic line up was Freddie Mercury (lead vocals, piano), Brian May (guitar, vocals), John Deacon (bass guitar), and Roger Taylor (drums, vocals).",5127124);
Insert into Artist values(89,"Led Zeppelin","bljqgfemi","eoluflmxq",3,103,"Pink Floyd were an English rock band formed in London in 1965. Gaining a following as a psychedelic rock group",6544255);
Insert into Artist values(90,"Guns n Roses","phifkflfx","luifdhftv",4,46,"Led Zeppelin were an English rock band formed in London in 1968. ",3927886);
Insert into Artist values(91,"Aerosmith","lrtlcduzf","lnprkcgym",1,156,"Guns N Roses, often abbreviated as GNR, is an American hard rock band from Los Angeles, California, formed in 1985.",9460457);
Insert into Artist values(92,"Coldplay","pwyhvadfl","jbxorqgrg",2,112,"Aerosmith is an American rock band formed in Boston, Massachusetts in 1970.",2628602);
Insert into Artist values(93,"AC/DC","kjezmlsth","cykjklwdg",1,141,"Coldplay are a British rock band formed in London in 1996.",863907);
Insert into Artist values(94,"Nirvana","fcbobdagj","nrdtnndzt",3,98,"AC/DC are an Australian rock band formed in Sydney in 1973 by Scottish born brothers Malcolm and Angus Young.",9826681);
Insert into Artist values(95,"The Smiths","joageluzt","rsgwrufwv",2,119,"Nirvana was an American rock band formed in Aberdeen, Washington in 1987.",588323);
Insert into Artist values(96,"John Legend","iozjlxdgd","fwgwopjyo",2,8,"The Smiths were an English rock band formed in Manchester in 1982.",3687842);
Insert into Artist values(97,"The Doors","wljwaezsu","rqizpusdn",1,142,"John Roger Stephens, known professionally as John Legend, is an American singer, songwriter, producer, actor, and philanthropist.",4115308);
Insert into Artist values(98,"OneRepublic","mmwxijeay","xhwtaexcc",1,94," The Doors were an American rock band formed in Los Angeles in 1965, with vocalist Jim Morrison.",8127817);
Insert into Artist values(99,"Fall Out Boy","vffbrmgls","lwbqqdwgx",1,63,"OneRepublic is an American pop rock band formed in Colorado Springs, Colorado, in 2002. ",847693);
Insert into Artist values(100,"Justin Bieber","vdnooxuot","ipdfdbcdg",3,51,"Fall Out Boy is an American rock band formed in Wilmette, Illinois, a suburb of Chicago, in 2001.",3728117);

INSERT INTO FilmMakers VALUES (1001,'Yash Raj Films',"cqcfpfxwn","snkfvwvok",'Student of the Year',1,'Movie of Students Life',1500000),
(1002,'Hirani Productions',"viudibrhd","rmytgnvtg",'3 idiots',2,'Engineer life story',230000),
(1001,'Yash Raj Films',"osafditqf","gjvlyfuuz",'Street Dancer 3D',3,'Dance Related Movie',112000),
(1003,'Shoojit Productions',"rlmpsefvy","copsvjqhh",'Vicky Donor',4,'Sperm Donor Life Story',112300),
(1002,'Hirani Productions',"caxwzdpbj","xludljpmc",'PK',5,'Story of Indian Religios beleifs',223000),
(1002,'Hirani Productions',"ircwicwaz","vlxnfaugu",'Munna Bhai M.B.B.S.',6,'Story of a ganster as a doctor',312000),
(1002,'Hirani Productions',"zoltwtnhh","uzavmlwoz",'Sanju',7,'A Biopic of Sanjay Dutt',231000),
(1004,'Bhushan Kumar',"cxlekltkw","dqihsrsrf",'Yaad Piya ki aane lagi',8,'Story of Indian Weddings',220300),
(1005,'AA Films',"qpzmthvdg","ihbitaukq",'Bharat',9,'A story of Indian Fighter',110900),
(1006,'Pandey Films',"rdhnwawnd","saldacbrh",'M.S. Dhoni: The Untold Story',10,'Biopic of MS Dhoni',332000),
(1007,'Zee Studios',"wqslihosv","zmixgtadi",'Good Newwz',11,'A stroy about exchanged sperms',103400),
(1008,'Fox Star Studios',"rbirvwfkc","cedlqzsln",'Housefull 4',12,'A comedy sequeal of Housefull',223400),
(1005,'AA Films',"nrncnaomy","nqpzaloxy",'Gully Boy',13,'A story of struggling rapper',220200),
(1009,'Salman Khan Films',"hawokzvql","gcobfbwqu",'Dabangg 3',14,'A stroy of Indian Policemen',340500),
(1010,'Vaicom 18',"vzlrjnvsu","gptxoqvan",'Padmaavat',15,'A Story about queen padmaavati',210200),
(1011,'Reliance Entertainment',"gokmtupqw","xmloyyxpi",'Simmba',16,'A sequesl of singham',332000),
(1005,'AA Films',"tdhdwpmri","vazkgktuw",'Badhaai Ho',17,'A stroy about old women pregnancy',302000),
(1001,'Yash Raj Films',"nceogibiz","ludfoadek",'Tiger Zinda Hain',18,'A story about Indian Spy',450300),
(1012,'T-series',"ydrpetnmp","ykvocntnn",'Hindi Medium',19,'A story about parents finding school for thier child',203300),
(1008,'Fox Star Studios',"oppsegsca","ofabfzcij",'Judwaa 2',20,'A story ofduplicates and thier life troubles',321000),
(1009,'Salman Khan Films',"adrefokpv","kuhwkrmku",'Tubelight',21,'A stroy of dumb patriot',521000),
(1013,'Red Chillies Entertainment',"wnxjemvnc","jfonfkyrq",'Raees',22,'A story of Indian Desi Don',370300),
(1014,'FilmKraft Productions',"chilmrqwv","rrdfvvips",'Kaabil',23,'A story for blind couple',290900),
(1015,'Disney','Frozen 2',"deyyhupzh","fwuttmfad",24,'An angel with life issues',150600),
(1016,'Original Motion Pictures',"lllhrmebi","uqmeweapv",'Once upno a time in hollywood',25,'A story about life in hollywood',220800),
(1017,'Annapurna Pictures',"bzqcubzqd","ghjhuwsoe",'Booksmart',26,'A story of graduating students',310900),
(1018,'Jordan Movies',"uzbuxzgee","qpnlnmczy",'Us',27,'A story about regret of boy',200100),
(1019,'Dexter Films',"sadnciarg","khgglyxgq",'Rocketman',28,'A story of true fantasy',309000),
(1020,'Danny Productions',"hevqwvxaq","niqmtuouj",'Yesterday',29,'A story of music enthutiast',235600),
(1015,'Disney',"qhbwdluqh","tlzkzzxzn",'Deadpool 2',30,'A superhero movie of deadpool',105000),
(1021,'Cruise Productions',"qzbbvungk","zbkirwrpk",'Mission Impossible',31,'A stroy of spy handling issues',210600),
(1022,'UTV Motion Pictures',"tnjgdvmmx","goxswstqx",'Dangal',32,'A story of female indian wrestler',230100),
(1001,'Yash raj films',"fdrgjudic","okafnydfp",'Sultan',33,'A story of underrated indian wrestler',140500),
(1008,'Fox Star studios',"turxxltuv","qbhtcydnx",'Ae Dil hain Mushqil',34,'A story about the love traingle',203000),
(1009,'Salman Khan Films',"mpivjzjmy","mhslrxvxl",'Bajrangi Bhaijaan',35,'A stroy of pak girl back to pak from india',210200),
(1011,'Reliance Entertainmnet',"jaxgxftbd","bqrminivv",'Singham Returns',36,'A true story of indian Policemen',100900),
(1022,'UTV motion pictures',"kkqlgjgma","itwjysgwj",'2 States',37,'A stroy based on chetan bhagat novel 2 states',904000),
(1013,'Red Chillies Entertainment',"qupmsahvr","vgddkwtrk",'Happy New year',38,'A story of kajol and SRK reunion',800100),
(1023,'Balaji Motion Pictures',"smyrlohch","smplvcswy",'Ek Villian',39,'A story of psycho gangster',210200),
(1001,'Yash Raj FIlms',"gqaizzcgf","oiafiuxbh",'Gunday',40,'A story about duo of gangsters life',313100);
insert into FilmMakers values (10291,'Sony Musics',"huejrfjjd","jwjjojzeb",'English',42,'Hollywood',2334000);
insert into FilmMakers values (10912,'Korean Music',"kbxusiksc","zmidyrqfy",'K-Pop',43,'k-pop',4754000);
insert into FilmMakers values (12345,'Gujju Music',"vgtvfeoef","nrzpbanro",'Gujrati',41,'Gujrati Music',1234567);

Insert into User values(1,"Cagla","9dq4di056k","u8cvjwzq9s",True,108,"Arijit Singh");
Insert into User values(2,"Hanne","w2b70njvyy","bw1f3yce50",True,4,"Shankar Ehsaan Loy");
Insert into User values(3,"Mikeila","08mxpx26cf","oxr1ldeouq",True,61,"DJ Snake");
Insert into User values(4,"Kyiren","bxl3xi65gi","ed2doonxk2",False,159,"Akon");
Insert into User values(5,"Oatha","4o13f9211h","wuub0y8h8c",False,168,"Vatsala Patil");
Insert into User values(6,"Liber","4a1zn1gvxc","lkfvs6bezs",False,102,"DJ Snake");
Insert into User values(7,"Fiadh","9ggtjrbuq3","ybnf6xownr",False,179,"Meet Bros");
Insert into User values(8,"Hydie","uu631ytdio","5gforttf34",True,162,"Enrique Iglesias");
Insert into User values(9,"Glooscap","t70odmpdw0","qvvkhw2pch",True,193,"Hot Chelle Rae");
Insert into User values(10,"Kathlyn","3u0mm3vc3e","mk0f14vsa1",False,135,"Drake");
Insert into User values(11,"Ganyn","ptjfxx6yog","rgi2dv7977",False,144,"Aarti Munshi");
Insert into User values(12,"Shatarah","htjjbqrnwe","xsdzrmldqd",True,109,"Jaykar Bhojak");
Insert into User values(13,"Ashtynn","w25xzs24do","t4bfguakqq",True,64,"Bon Iver");
Insert into User values(14,"Zaine","5177ews86l","sqrphm3dyb",True,195,"DJ Snake");
Insert into User values(15,"Gradon","kenl0jk0z4","5q1d6b5sih",False,16,"Camila Cabello");
Insert into User values(16,"Narcisco","yt2jni46cp","9jcwpoh3gf",True,61,"Alka Yagnik");
Insert into User values(17,"Lauran","6m8py1w8w3","wewcrhilwa",True,174,"Sachin Limaye");
Insert into User values(18,"Latoya","9oj541ghhj","ozsfbamlsd",False,76,"A.R. Rahman");
Insert into User values(19,"Chrishawn","90apbavbjw","ll7qanwil1",False,96,"Dua Lipa");
Insert into User values(20,"Morgun","6o7286sgpt","91idad5uw1",False,67,"Hot Chelle Rae");
Insert into User values(21,"Amer","6334t3k5ll","myukemxtyt",True,54,"Bhoomi Trivedi");
Insert into User values(22,"Elizjah","vpr6az5xwz","6qp9h2w7hj",False,177,"Khalid");
Insert into User values(23,"Akorede","yqo88rbqx6","qj5fmgyje3",False,173,"Bhoomi Trivedi");
Insert into User values(24,"Strickland","z8yjq7oahk","brzo1u2fig",False,124,"Taylor Swift");
Insert into User values(25,"Elanor","wsoat44lkj","t73rb9jsoh",False,8,"Vijay Suvada");
Insert into User values(26,"Caryn","xrs4tjnynd","97uj8hculv",False,118,"DJ Snake");
Insert into User values(27,"Oluwaseni","gl5ax47ax2","24q8kejx70",True,160,"Neha Kakkar");
Insert into User values(28,"Zahn","2hujb7y8qt","3ykk10fow7",False,86,"Alan Walker");
Insert into User values(29,"Abdrahman","13wptu7utl","8vi75umzde",False,195,"Michael Jackson");
Insert into User values(30,"Jerilynn","v2ffuiy4mf","tla5su0s4e",False,72,"Bhoomi Trivedi");
Insert into User values(31,"Shadayah","aj3yfg0rtp","q8i7nbf2s6",False,37,"Arijit Singh");
Insert into User values(32,"Inman","0f83tt3d2g","pv3v5r5f7v",False,97,"Paritosh Goswami");
Insert into User values(33,"Uma","8vax2xf0xy","xtjbmchb9d",True,165,"Vatsala Patil");
Insert into User values(34,"Bailidh","cdjujgnu2x","bbu4542gc8",False,53,"Satya Yamini");
Insert into User values(35,"Jacorrian","4pvlwkc3is","fduducm651",True,199,"Jennifer Lopez");
Insert into User values(36,"Rasab","w9mgliwgrx","rg5l8gly4x",False,69,"Ariana Grande");
Insert into User values(37,"Berlon","173rvvu7kz","ggwe7b179d",False,197,"Camila Cabello");
Insert into User values(38,"Armands","kgfjcu0m1f","ldj2ugaqx2",False,104,"Bryan Adams");
Insert into User values(39,"Doreathea","qyugig5h8e","zle5k16lzs",True,79,"Neha Kakkar");
Insert into User values(40,"Laroya","ymznpfn3sk","baixqso7fj",False,64,"Jennifer Lopez");
Insert into User values(41,"Balaal","tdslwdydf1","1cez7w7bdj",True,121,"Anu Malik");
Insert into User values(42,"Jeopardy","tvo3hdqpch","kx7dk2f45y",False,80,"Imagine Dragons");
Insert into User values(43,"Jqwon","8mzzfx9h33","0sh7qgk3vt",True,183,"Aarti Munshi");
Insert into User values(44,"Zailyn","5vcex0j8ld","cm2ydox7w4",True,157,"Sonu Nigam");
Insert into User values(45,"Roarke","sl6bastqrv","v3n9ohunv1",True,105,"Cardi B");
Insert into User values(46,"Seananthony","6nw9elzl3e","vita3qi810",False,17,"Avicii");
Insert into User values(47,"Gavriilu","prjsreif87","rly9047ejj",True,193,"Parth Chaudhary");
Insert into User values(48,"Cipriana","xeck0n0uv3","rdph10j9z3",False,108,"Vatsala Patil");
Insert into User values(49,"Aamina","mj9sn8f9h0","ri71qu8eox",False,55,"Meet Bros");
Insert into User values(50,"Kyal","bzwcz1rg3h","06x3eehlkb",False,149,"Atif Aslam");
Insert into User values(51,"Tobia","hvrpiznje5","d8cl7ohv42",False,20,"Atul Purohit");
Insert into User values(52,"Zurie","pftl8n26rp","g00ai0egvt",False,167,"Shreya Ghoshal");
Insert into User values(53,"Jayra","vhzx7q8ebj","6zpo1pe46w",True,183,"Vatsala Patil");
Insert into User values(54,"Olufolayemi","0u40931591","vx8bbfanj9",True,139,"A.R. Rahman");
Insert into User values(55,"Giannarose","gyfu877egi","hf8a8aog57",True,69,"S.D.Burman");
Insert into User values(56,"Quisto","p4xpdyfobo","63gmzoe9a3",False,168,"Mounima");
Insert into User values(57,"Yousha","ssg9eun2zq","dy1t7pxswv",False,112,"Aarti Munshi");
Insert into User values(58,"Sunni","odv0qarfnq","liyofr93bx",True,61,"Prudhvi Chandra");
Insert into User values(59,"Devnet","77y6mn5316","kcqvri1c9k",True,147,"Satya Yamini");
Insert into User values(60,"Mahmudul","c14xd77mz2","0y4jvj54fj",False,185,"Mounima");
Insert into User values(61,"Arseny","5oorgznht0","ilyf24uwzb",True,198,"Kishore Kumar");
Insert into User values(62,"Ysanne","aezs2r88wj","21x32leo6g",False,76,"Hot Chelle Rae");
Insert into User values(63,"Zalika","v9asqtf8it","ojo27rqnnh",False,146,"Sachin Limaye");
Insert into User values(64,"Jessey","3x0fzqlf25","998gx24s3a",False,113,"Pritam");
Insert into User values(65,"Wendelyn","adnck9y75j","hf532pxi6w",False,120,"Krewella");
Insert into User values(66,"Knute","viseybbe06","tn9tpwobs5",False,132,"Arijit Singh");
Insert into User values(67,"Breonia","rlyytwss1y","vjklzj9a67",False,183,"Drake");
Insert into User values(68,"Emyiah","6w7l690ikf","a32se7btiq",False,76,"Parth Chaudhary");
Insert into User values(69,"Midnight","9gdg6q9q4c","3ixz8ll549",True,17,"Avicii");
Insert into User values(70,"Karoleena","fuskfpj3dn","xe7xes95jx",False,66,"Sonu Nigam");
Insert into User values(71,"Bluebelle","c97tb96czq","y58ox7clqa",False,131,"Sachin Limaye");
Insert into User values(72,"Isumi","nbmj11s4qv","ei7xxoy8zw",True,197,"Adele");
Insert into User values(73,"Jeevat","ofri8e6360","5cokd7wa2f",False,109,"Hot Chelle Rae");
Insert into User values(74,"Oweda","rurb4k6in4","oqoicdzd5h",False,48,"Aarti Munshi");
Insert into User values(75,"Tariq","d9xhqug8ic","thrx7jp7i0",False,150,"Richa Sharma");
Insert into User values(76,"Enalina","bfd46mn8bz","cylzci67vk",True,199,"Aarti Munshi");
Insert into User values(77,"Adaleia","5u2vepe7pm","2v5u7p2wm7",False,50,"Sanjay Oza");
Insert into User values(78,"Janeliz","5czep34kjk","v614e9ihxf",False,109,"Imagine Dragons");
Insert into User values(79,"Alyla","mjgunpz2j3","vn19i20bhu",False,98,"Prudhvi Chandra");
Insert into User values(80,"Derriana","ck6lhfx867","5yefe5v08a",False,48,"Sachin Limaye");
Insert into User values(81,"Brookson","fnbgxgoy7z","4020xlqro6",False,192,"Sachin-Jigar");
Insert into User values(82,"Umairah","zxlfjgpl4r","m6ofucpill",True,55,"Drake");
Insert into User values(83,"Kirkland","dsqlbkwdc0","aoqckd1vuw",False,132,"Enrique Iglesias");
Insert into User values(84,"Alexanderjames","dc3p0qrwho","yymrdtz2x4",False,144,"Billie Eilish");
Insert into User values(85,"Aari","42yuwos2n7","ht10tzhioj",False,54,"Ramya Behara");
Insert into User values(86,"Conlon","bj1f7jrce9","bi0jzej8jz",False,61,"Tame Impala");
Insert into User values(87,"Spomenka","zfs3ignk4g","tzkecszl5p",False,184,"Halsey");
Insert into User values(88,"Adesh","3w0wmxiefj","cjh9wzs78a",False,13,"Calvin Harris");
Insert into User values(89,"Shaleece","bdtu0wtcvw","1zmllvj61h",False,0,"Taylor Swift");
Insert into User values(90,"Oluwajoba","qzfcfp2ojx","bh4tuhr0sc",False,111,"Rita Ora");
Insert into User values(91,"Aker","nc74z30t3v","cvrpjedhha",False,78,"Tove Lo");
Insert into User values(92,"Tilly-anne","xed7zj4tdg","3gqj1i2xmu",True,118,"Pritam");
Insert into User values(93,"Shawneen","mog6axbxsw","mpdfy066xr",True,7,"PSY");
Insert into User values(94,"Talara","wklsy4aejy","1c4sx3g1gd",True,68,"BlackPink");
Insert into User values(95,"Tica","d0nck20pm9","3ki23grzk6",True,140,"Bappi Lahiri");
Insert into User values(96,"Ashvik","ifka90mmt8","79vmhk23sp",False,134,"Ariana Grande");
Insert into User values(97,"Veronia","t35t5hb8m8","fksckewwgr",True,156,"Pritam");
Insert into User values(98,"Shinesha","ngetkig1sj","4aeh8yi272",True,17,"Pritam");
Insert into User values(99,"Bettianne","qnh4xvy77p","34aj7uff4y",False,69,"Alan Walker");
Insert into User values(100,"Parjinder","macjgp8wic","fdzvbtt6tf",True,85,"Satya Yamini");
Insert into User values(101,"Vallarie","vq4huyxdmk","hb8fwxfkg9",False,175,"DJ Snake");
Insert into User values(102,"Maristella","s6klq73tfw","0wu0lvf2z0",True,29,"Yazin Nizar");
Insert into User values(103,"Jossiephine","bde9cm42wg","bcvp4va17d",False,85,"Sonu Nigam");
Insert into User values(104,"Riley-","bq6qqg2bj8","gy4fsvesk3",False,146,"Cardi B");
Insert into User values(105,"Minique","k87nh7w7px","01o1h5po5n",True,142,"Avicii");
Insert into User values(106,"Mckaela","277i86dnoz","noy93cscnl",False,112,"Khalid");
Insert into User values(107,"Nurislam","6ecfg5lju9","xtttfp1ptz",False,148,"Aarti Munshi");
Insert into User values(108,"Odessie","8aqlvrbpw6","kc5zge4qaf",False,6,"Taylor Swift");
Insert into User values(109,"Tvisha","lp6r479bbj","et5wkxr5us",False,179,"Alka Yagnik");
Insert into User values(110,"Gorham","c7fcn392v1","t2z9p4vbey",False,127,"Shyamal and Saumil");
Insert into User values(111,"Chardae","qtnotaqzqt","a0avkrzrvo",True,104,"Meet Bros");
Insert into User values(112,"Lucyle","9baen2gmfv","ve8c6a70j8",True,97,"Mounima");
Insert into User values(113,"Aracelly","kssbwvyujy","xbf42szv07",True,91,"Alan Walker");
Insert into User values(114,"Golshan","3lb0nmtinf","bm69zlgknk",False,106,"The Chainsmokers");
Insert into User values(115,"Olwin","gyv29oe4ch","f5tc5bi68n",False,42,"Ramya Behara");
Insert into User values(116,"Lilyian","gk9ecdq66x","65qkn8cni5",False,79,"Bon Iver");
Insert into User values(117,"Generose","zorva4nn8f","58rq22dg6o",False,108,"Badshah");
Insert into User values(118,"Patricia","m2ywu1y9w0","6p8lwvvb5e",False,67,"Vatsala Patil");
Insert into User values(119,"Alaana","5t9j3ow1bp","ls36yk01v7",True,40,"BlackPink");
Insert into User values(120,"Tyric","j2jmq9tndg","ya6kaxw9ek",False,88,"Paritosh Goswami");
Insert into User values(121,"Kyson","7xzij8fg3o","txdzarav0y",True,154,"Jaykar Bhojak");
Insert into User values(122,"Chestine","rgv5dzj565","vniowv5lrd",True,91,"Mohana Bhogaraju");
Insert into User values(123,"Ashraf","5r7ckz69mu","6pspj3pfn4",True,87,"Kesha");
Insert into User values(124,"Diepreye","h4btmi63p7","ash017rh6f",True,137,"Rihanna");
Insert into User values(125,"Sophia-louise","2l1dr3q64j","ehjegi4rrw",True,40,"Atif Aslam");
Insert into User values(126,"Quienton","rk7xjs8zqo","rdmfveevs3",True,181,"Rihanna");
Insert into User values(127,"Vlatka","f34kmb0uvd","65e1b6gqd8",True,75,"Mika Singh");
Insert into User values(128,"Nayoun","vyhnt2jmni","ir09y32nbn",True,192,"TWICE");
Insert into User values(129,"Taiana","sw1wtnwk0c","faup6l7nvi",True,128,"Shreya Ghoshal");
Insert into User values(130,"Breahna","na92qia74a","c4s0efzcp1",False,189,"Asha Bhosle");
Insert into User values(131,"Caelon","0fs30wkrg9","s3gtoiug44",True,158,"Sachin-Jigar");
Insert into User values(132,"Chantell","xtiq5f7s7h","29lsjwq1yo",True,95,"Meet Bros");
Insert into User values(133,"Rocklyn","gwkev4razi","etedojhyuv",True,199,"The Chainsmokers");
Insert into User values(134,"Zakyriah","abykls9vus","pcv6lpevxp",False,119,"Bon Iver");
Insert into User values(135,"Mollie-ann","70n5x8ut8d","nc12l2iicc",False,33,"Mohana Bhogaraju");
Insert into User values(136,"Kimberl","5r38u1i3h4","50tccl8mgv",False,41,"Jaykar Bhojak");
Insert into User values(137,"Nicolau","svqrphs837","bvlby1h6wf",True,180,"Mika Singh");
Insert into User values(138,"Tamirah","yzhjiy32vd","6hqgji3ku3",False,34,"Badshah");
Insert into User values(139,"Fonta","f92jfpfkac","eyjnq3vf0d",True,123,"Hot Chelle Rae");
Insert into User values(140,"Liran","h7bcz8omnd","krmj6wi4yy",False,109,"BlackPink");
Insert into User values(141,"Gunnhildur","jatysup7p6","3mfcx1ni2v",False,190,"Achal Mehta");
Insert into User values(142,"Abdulmalek","ydahf5du4n","0v0nki96rm",True,56,"Selena Gomez");
Insert into User values(143,"Lationa","2mavgr9sn7","4vvanv2f01",False,132,"The Weekend");
Insert into User values(144,"Maiki","6c6pai98o1","wyuthbdw96",True,133,"Cardi B");
Insert into User values(145,"Caly","glozy4gli5","s11za9juvb",False,40,"Cardi B");
Insert into User values(146,"Stacie","ak1fosfopm","cws4euilbe",True,5,"Geeta Rabari");
Insert into User values(147,"Ezekiel","w196283181","kyl3sdbgmj",False,62,"Rihanna");
Insert into User values(148,"Kristos","ki1fc65w4m","jswhwona82",True,106,"Drake");
Insert into User values(149,"Sureena","wgc5genw6t","cveuc3em76",False,0,"Gajendra Verma");
Insert into User values(150,"Arnaude","8ng4t8hwis","82n4i0ovce",False,116,"Sachin Limaye");
Insert into User values(151,"Heiley","gyk6sk0d18","539j5q7lth",False,57,"Bappi Lahiri");
Insert into User values(152,"Pancras","kikbvthe2j","8lo5qs7vk6",True,45,"The Weekend");
Insert into User values(153,"Crafton","qglxmcau7h","ao3dyh7xpe",False,175,"Hot Chelle Rae");
Insert into User values(154,"Keshaun","qfk1v8faz7","k22zdpl4rs",False,116,"Pritam");
Insert into User values(155,"Absalon","8c79xqsu4b","u0kyhpbu5o",False,115,"Mika Singh");
Insert into User values(156,"Emmee","e8b75vi7yw","yz6mhb4lei",True,180,"Mohana Bhogaraju");
Insert into User values(157,"Dexiree","a5rpd7ntqd","kk5lejdu2k",False,139,"Aarti Munshi");
Insert into User values(158,"Najibah","6qby977ap7","lw5w7bvh0c",True,112,"Aarti Munshi");
Insert into User values(159,"Gearld","z2jngzh7l4","m8yo0c1thq",False,186,"Kishore Kumar");
Insert into User values(160,"Zhariyah","83jjnxyl4h","m6ivwgnqjf",True,28,"Sonu Nigam");
Insert into User values(161,"Totty","efbqp4qx3y","ptkd08pg89",False,43,"Enrique Iglesias");
Insert into User values(162,"Giorgino","jo4kpxkyg6","ll6njouudh",False,98,"Tove Lo");
Insert into User values(163,"Abdihafid","vg3dlkzwes","mjhdqjryx4",True,102,"Selena Gomez");
Insert into User values(164,"Mung","72g6rxxdq7","8gcu96lrgs",False,174,"DJ Snake");
Insert into User values(165,"Tyrian","qblkv3krc2","pigzqiofhx",True,43,"Geeta Rabari");
Insert into User values(166,"Esbeydy","4apd1coxku","rapp4wqigu",True,126,"Michael Jackson");
Insert into User values(167,"Tinka","c8vccs55i6","qxwvpuki2p",True,13,"Shyamal and Saumil");
Insert into User values(168,"Kazlynn","tdfeab3ibw","2tz07j448x",False,5,"Meet Bros");
Insert into User values(169,"Simron","mwk9mrkqbq","013hwokw4z",True,48,"Calvin Harris");
Insert into User values(170,"Ambrosios","154al6ug83","aukwiqdpr5",False,53,"The Weekend");
Insert into User values(171,"Kimorah","4un6ux3y80","289b2ckkzm",False,98,"Bappi Lahiri");
Insert into User values(172,"Darzell","9nyly7j8sx","cksl4frqsw",True,94,"Imagine Dragons");
Insert into User values(173,"Laquila","opbf1h2iw5","cqpohg19px",True,126,"Bryan Adams");
Insert into User values(174,"Adilen","0h6jud04cd","if3i22lauj",False,118,"Tame Impala");
Insert into User values(175,"Pei","srxoo3t698","ejtwe5uikt",True,61,"Vijay Suvada");
Insert into User values(176,"Erdenechimeg","ryy6o3qp5u","i9j85aug02",False,51,"Sachin-Jigar");
Insert into User values(177,"Melisia","vjlvb7ru5c","42q03ynv9n",False,83,"Anu Malik");
Insert into User values(178,"Lysimachos","ywyvejjj51","0jf4n79xct",False,91,"Alan Walker");
Insert into User values(179,"Jazalin","28s3x8o7ko","6ykhll3dya",False,184,"Mounima");
Insert into User values(180,"Kayleigh-ann","t64s83khvg","bshu7geav2",True,134,"Jaykar Bhojak");
Insert into User values(181,"Jamacia","4es2zru746","9y4e1oklie",True,67,"Billie Eilish");
Insert into User values(182,"Jasek","nudxs7y328","ka2hhy62v7",False,185,"Avicii");
Insert into User values(183,"Tranice","37ugavkhl1","c0ls3ihkm2",True,160,"Calvin Harris");
Insert into User values(184,"Lalana","veutueye44","ffblrm92p4",False,117,"Vishal-Shekar");
Insert into User values(185,"Jurryt","1t5cp8canb","6dhcashcqw",False,68,"Imagine Dragons");
Insert into User values(186,"Almir","lk28m20xks","8gdis1t2z2",False,180,"Calvin Harris");
Insert into User values(187,"Herika","2v5ghtjozf","xt07enw9hx",True,84,"Shankar Mahadevan");
Insert into User values(188,"Ithiel","mspv35ywqu","v1z3dx78ou",False,102,"Kishore Kumar");
Insert into User values(189,"Shantalle","ti4n8yrm9t","t3ke8txtss",False,54,"Achal Mehta");
Insert into User values(190,"Willah","ljuxlwuw6o","38giwy4s6p",False,171,"Vijay Suvada");
Insert into User values(191,"Sariaha","xfwegidqo3","g0w89l1da9",True,19,"Parth Chaudhary");
Insert into User values(192,"Dawda","1eat5i0ti0","nkvmmcznb4",False,193,"Krewella");
Insert into User values(193,"Louana","xj023iyejo","4mul9ge0i6",True,83,"Sachin-Jigar");
Insert into User values(194,"Victoriamarie","fehzqboyav","qh0vjq39oj",False,95,"Arijit Singh");
Insert into User values(195,"Gershon","p8tcttnf8o","u69oad8upp",False,118,"Calvin Harris");
Insert into User values(196,"Aobha","zdneilxeyu","xkz1m57chh",False,10,"Satya Yamini");
Insert into User values(197,"Navian","zj0wyxr8tu","q2rbmfore3",False,12,"Drake");
Insert into User values(198,"Junae","75bqkablz7","4mq3e9rr0o",True,99,"Tame Impala");
Insert into User values(199,"Emma-ray","bv2ss2n9tq","mgsx4mifhe",True,6,"Atul Purohit");
Insert into User values(200,"Elvir","x6xrjuvpjm","yerq4xua91",True,164,"Halsey");

insert into English_Songs values(501,"bad guy",48,"Billie Eilish","/home/akshyta/Desktop/DBMS_Project/Lyrics/E1","2019-03-29",5,200,901,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E1","/home/akshyta/Desktop/DBMS_Project/Images/E1");
insert into English_Songs values(502,"all the good girls go to hell",48,"Billie Eilish","/home/akshyta/Desktop/DBMS_Project/Lyrics/E2","2019-03-29",5,175,901,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E2","/home/akshyta/Desktop/DBMS_Project/Images/E2");
insert into English_Songs values(503,"Ocean Eyes",48,"Billie Eilish","/home/akshyta/Desktop/DBMS_Project/Lyrics/E3","2016-09-15",4,150,901,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E3","/home/akshyta/Desktop/DBMS_Project/Images/E3");
insert into English_Songs values(504,"bellyache",48,"Billie Eilish","/home/akshyta/Desktop/DBMS_Project/Lyrics/E4","2016-04-02",4,160,901,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E4","/home/akshyta/Desktop/DBMS_Project/Images/E4");
insert into English_Songs values(505,"bury a friend",48,"Billie Eilish","/home/akshyta/Desktop/DBMS_Project/Lyrics/E5","2019-03-29",5,180,901,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E5","/home/akshyta/Desktop/DBMS_Project/Images/E5");
insert into English_Songs values(506,"Tik Tok",47,"Kesha","/home/akshyta/Desktop/DBMS_Project/Lyrics/E6","2010-10-09",5,165,901,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E6","/home/akshyta/Desktop/DBMS_Project/Images/E6");
insert into English_Songs values(507,"We R Who We R",47,"Kesha","/home/akshyta/Desktop/DBMS_Project/Lyrics/E7","2010-10-09",4,185,901,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E7","/home/akshyta/Desktop/DBMS_Project/Images/E7");
insert into English_Songs values(508,"Animal",47,"Kesha","/home/akshyta/Desktop/DBMS_Project/Lyrics/E8","2009-10-09",3,150,903,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E8","/home/akshyta/Desktop/DBMS_Project/Images/E8");
insert into English_Songs values(509,"Without Me",49,"Halsey","/home/akshyta/Desktop/DBMS_Project/Lyrics/E9","2018-11-23",5,190,901,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E9","/home/akshyta/Desktop/DBMS_Project/Images/E9");
insert into English_Songs values(510,"Eastside",49,"Halsey","/home/akshyta/Desktop/DBMS_Project/Lyrics/E10","2017-1-03",5,180,904,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E10","/home/akshyta/Desktop/DBMS_Project/Images/E10");
insert into English_Songs values(511,"Colour",49,"Halsey","/home/akshyta/Desktop/DBMS_Project/Lyrics/E11","2018-11-23",3,155,901,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E11","/home/akshyta/Desktop/DBMS_Project/Images/E11");
insert into English_Songs values(512,"11 Minutes",49,"Halsey","/home/akshyta/Desktop/DBMS_Project/Lyrics/E12","2017-5-10",3,150,902,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E12","/home/akshyta/Desktop/DBMS_Project/Images/E12");
insert into English_Songs values(513,"Talking Body",50,"Tove Lo","/home/akshyta/Desktop/DBMS_Project/Lyrics/E13","2014-09-23",5,180,901,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E13","/home/akshyta/Desktop/DBMS_Project/Images/E13");
insert into English_Songs values(514,"True Disaster",50,"Tove Lo","/home/akshyta/Desktop/DBMS_Project/Lyrics/E14","2014-9-23",4,150,901,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E14","/home/akshyta/Desktop/DBMS_Project/Images/E14");
insert into English_Songs values(515,"Runaway",51,"Krewella","/home/akshyta/Desktop/DBMS_Project/Lyrics/E15","2015-9-13",5,160,905,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E15","/home/akshyta/Desktop/DBMS_Project/Images/E15");
insert into English_Songs values(516,"Team",51,"Krewella","/home/akshyta/Desktop/DBMS_Project/Lyrics/E16","2014-4-17",3,120,905,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E16","/home/akshyta/Desktop/DBMS_Project/Images/E16");
insert into English_Songs values(517,"Alibi",51,"Krewella","/home/akshyta/Desktop/DBMS_Project/Lyrics/E17","2015-09-13",4,150,905,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E17","/home/akshyta/Desktop/DBMS_Project/Images/E17");
insert into English_Songs values(518,"The Less I Know The Better",52,"Tame Impala","/home/akshyta/Desktop/DBMS_Project/Lyrics/E18","2015-5-07",5,180,901,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E18","/home/akshyta/Desktop/DBMS_Project/Images/E18");
insert into English_Songs values(519,"Borderline",52,"Tame Impala","/home/akshyta/Desktop/DBMS_Project/Lyrics/E19","2015-7-07",4,160,901,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E19","/home/akshyta/Desktop/DBMS_Project/Images/E19");
insert into English_Songs values(520,"Starboy",53,"The Weeknd","/home/akshyta/Desktop/DBMS_Project/Lyrics/E20","2016-12-17",5,200,901,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E20","/home/akshyta/Desktop/DBMS_Project/Images/E20");
insert into English_Songs values(521,"The Hills",53,"The Weeknd","/home/akshyta/Desktop/DBMS_Project/Lyrics/E21","2015-1-06",4,170,903,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E21","/home/akshyta/Desktop/DBMS_Project/Images/E21");
insert into English_Songs values(522,"Earned It",53,"The Weeknd","/home/akshyta/Desktop/DBMS_Project/Lyrics/E22","2015-1-06",5,190,904,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E22","/home/akshyta/Desktop/DBMS_Project/Images/E22");
insert into English_Songs values(523,"I Feel It Coming",53,"The Weeknd","/home/akshyta/Desktop/DBMS_Project/Lyrics/E23","2016-12-17",5,170,904,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E23","/home/akshyta/Desktop/DBMS_Project/Images/E23");
insert into English_Songs values(524,"Back To You",54,"Selena Gomez","/home/akshyta/Desktop/DBMS_Project/Lyrics/E24","2018-04-25",5,170,901,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E24","/home/akshyta/Desktop/DBMS_Project/Images/E24");
insert into English_Songs values(525,"Hello",55,"Adele","/home/akshyta/Desktop/DBMS_Project/Lyrics/E25","2015-04-25",5,200,904,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E25","/home/akshyta/Desktop/DBMS_Project/Images/E25");
insert into English_Songs values(526,"Rolling in the Deep",55,"Adele","/home/akshyta/Desktop/DBMS_Project/Lyrics/E26","2010-06-05",5,190,901,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E26","/home/akshyta/Desktop/DBMS_Project/Images/E26");
insert into English_Songs values(527,"Someone Like You",55,"Adele","/home/akshyta/Desktop/DBMS_Project/Lyrics/E27","2011-06-05",5,190,904,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E27","/home/akshyta/Desktop/DBMS_Project/Images/E27");
insert into English_Songs values(528,"Smack That",56,"Akon","/home/akshyta/Desktop/DBMS_Project/Lyrics/E28","2006-02-21",5,190,903,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E28","/home/akshyta/Desktop/DBMS_Project/Images/E28");
insert into English_Songs values(529,"Beautiful",56,"Akon","/home/akshyta/Desktop/DBMS_Project/Lyrics/E29","2008-09-10",4,170,904,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E29","/home/akshyta/Desktop/DBMS_Project/Images/E29");
insert into English_Songs values(530,"Don't Matter",56,"Akon","/home/akshyta/Desktop/DBMS_Project/Lyrics/E30","2006-02-21",3,150,904,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E30","/home/akshyta/Desktop/DBMS_Project/Images/E30");
insert into English_Songs values(531,"Faded",57,"Alan Walker","/home/akshyta/Desktop/DBMS_Project/Lyrics/E31","2015-12-04",5,200,905,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E31","/home/akshyta/Desktop/DBMS_Project/Images/E31");
insert into English_Songs values(532,"Summer",58,"Calvin Harris","/home/akshyta/Desktop/DBMS_Project/Lyrics/E32","2014-07-12",5,200,905,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E32","/home/akshyta/Desktop/DBMS_Project/Images/E32");
insert into English_Songs values(533,"How Deep is your Love",58,"Calvin Harris","/home/akshyta/Desktop/DBMS_Project/Lyrics/E33","2013-05-14",5,170,904,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E33","/home/akshyta/Desktop/DBMS_Project/Images/E33");
insert into English_Songs values(534,"thank u,next",59,"Ariana Grande","/home/akshyta/Desktop/DBMS_Project/Lyrics/E34","2018-10-30",5,190,901,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E34","/home/akshyta/Desktop/DBMS_Project/Images/E34");
insert into English_Songs values(535,"God is a woman",59,"Ariana Grande","/home/akshyta/Desktop/DBMS_Project/Lyrics/E35","2018-10-30",4,150,901,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E35","/home/akshyta/Desktop/DBMS_Project/Images/E35");
insert into English_Songs values(536,"Love me harder",59,"Ariana Grande","/home/akshyta/Desktop/DBMS_Project/Lyrics/E36","2014-06-20",3,160,901,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E36","/home/akshyta/Desktop/DBMS_Project/Images/E36");
insert into English_Songs values(537,"Wake Me Up",60,"Avicii","/home/akshyta/Desktop/DBMS_Project/Lyrics/E37","2013-02-23",5,200,905,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E37","/home/akshyta/Desktop/DBMS_Project/Images/E37");
insert into English_Songs values(538,"Waiting For Love",60,"Avicii","/home/akshyta/Desktop/DBMS_Project/Lyrics/E38","2015-09-10",5,170,905,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E38","/home/akshyta/Desktop/DBMS_Project/Images/E38");
insert into English_Songs values(539,"Your Song",61,"Rita Ora","/home/akshyta/Desktop/DBMS_Project/Lyrics/E39","2018-04-12",4,170,904,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E39","/home/akshyta/Desktop/DBMS_Project/Images/E39");
insert into English_Songs values(540,"God's plan",62,"Drake","/home/akshyta/Desktop/DBMS_Project/Lyrics/E40","2018-05-19",5,200,903,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E40","/home/akshyta/Desktop/DBMS_Project/Images/E40");
insert into English_Songs values(541,"One Dance",62,"Drake","/home/akshyta/Desktop/DBMS_Project/Lyrics/E41","2016-03-09",5,170,903,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E41","/home/akshyta/Desktop/DBMS_Project/Images/E41");
insert into English_Songs values(542,"Mia",62,"Drake","/home/akshyta/Desktop/DBMS_Project/Lyrics/E42","2018-06-15",4,150,903,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E42","/home/akshyta/Desktop/DBMS_Project/Images/E42");
insert into English_Songs values(543,"Lovely",63,"Khalid","/home/akshyta/Desktop/DBMS_Project/Lyrics/E43","2017-01-23",5,190,901,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E43","/home/akshyta/Desktop/DBMS_Project/Images/E43");
insert into English_Songs values(544,"Young, dumb & broke",63,"Khalid","/home/akshyta/Desktop/DBMS_Project/Lyrics/E44","2018-08-05",4,150,903,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E44","/home/akshyta/Desktop/DBMS_Project/Images/E44");
insert into English_Songs values(545,"Holocene",64,"Bon Iver","/home/akshyta/Desktop/DBMS_Project/Lyrics/E45","2011-05-09",4,150,904,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E45","/home/akshyta/Desktop/DBMS_Project/Images/E45");
insert into English_Songs values(546,"Always",65,"Bon Jovi","/home/akshyta/Desktop/DBMS_Project/Lyrics/E46","1994-03-01",4,170,902,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E46","/home/akshyta/Desktop/DBMS_Project/Images/E46");
insert into English_Songs values(547,"It's My Life",65,"Bon Jovi","/home/akshyta/Desktop/DBMS_Project/Lyrics/E47","2000-10-29",5,190,902,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E47","/home/akshyta/Desktop/DBMS_Project/Images/E47");
insert into English_Songs values(548,"Summer of'69 ",65,"Bryan Adams","/home/akshyta/Desktop/DBMS_Project/Lyrics/E48","1984-7-23",5,200,902,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E48","/home/akshyta/Desktop/DBMS_Project/Images/E48");
insert into English_Songs values(549,"Heaven",66,"Bryan Adams","/home/akshyta/Desktop/DBMS_Project/Lyrics/E49","1984-8-23",5,180,904,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E48","/home/akshyta/Desktop/DBMS_Project/Images/E49");
insert into English_Songs values(550,"Everything I Do",66,"Bryan Adams","/home/akshyta/Desktop/DBMS_Project/Lyrics/E50","1991-8-23",5,180,904,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E50","/home/akshyta/Desktop/DBMS_Project/Images/E50");
insert into English_Songs values(551,"Somebody's Me",67,"Enrique Iglesias","/home/akshyta/Desktop/DBMS_Project/Lyrics/E51","2007-01-30",5,180,904,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E51","/home/akshyta/Desktop/DBMS_Project/Images/E51");
insert into English_Songs values(552,"Bialamos",67,"Enrique Iglesias","/home/akshyta/Desktop/DBMS_Project/Lyrics/E52","1998-06-20",4,180,903,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E52","/home/akshyta/Desktop/DBMS_Project/Images/E52");
insert into English_Songs values(553,"Dark Horse",68,"Katy Perry","/home/akshyta/Desktop/DBMS_Project/Lyrics/E53","2013-09-10",5,190,901,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E53","/home/akshyta/Desktop/DBMS_Project/Images/E53");
insert into English_Songs values(554,"Harleys in Hawaii",68,"Katy Perry","/home/akshyta/Desktop/DBMS_Project/Lyrics/E54","2019-10-16",4,160,901,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E54","/home/akshyta/Desktop/DBMS_Project/Images/E54");
insert into English_Songs values(555,"On the Floor",69,"Jennifer Lopez","/home/akshyta/Desktop/DBMS_Project/Lyrics/E55","2011-02-04",5,170,904,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E55","/home/akshyta/Desktop/DBMS_Project/Images/E55");
insert into English_Songs values(556,"Hotter Than Hell",70,"Dua Lipa","/home/akshyta/Desktop/DBMS_Project/Lyrics/E56","2016-09-01",3,150,901,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E56","/home/akshyta/Desktop/DBMS_Project/Images/E56");
insert into English_Songs values(557,"No Rules",70,"Dua Lipa","/home/akshyta/Desktop/DBMS_Project/Lyrics/E57","2017-05-15",5,200,901,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E57","/home/akshyta/Desktop/DBMS_Project/Images/E57");
insert into English_Songs values(558,"We Found Love",71,"Rihanna","/home/akshyta/Desktop/DBMS_Project/Lyrics/E58","2011-07-30",5,190,905,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E58","/home/akshyta/Desktop/DBMS_Project/Images/E58");
insert into English_Songs values(559,"Love on the brain",71,"Rihanna","/home/akshyta/Desktop/DBMS_Project/Lyrics/E59","2016-04-20",4,150,904,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E59","/home/akshyta/Desktop/DBMS_Project/Images/E59");
insert into English_Songs values(560,"Billie Jean",72,"Michael Jackson","/home/akshyta/Desktop/DBMS_Project/Lyrics/E60","1982-10-07",5,180,901,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E60","/home/akshyta/Desktop/DBMS_Project/Images/E50");
insert into English_Songs values(561,"Lovestory",73,"Taylor Swift","/home/akshyta/Desktop/DBMS_Project/Lyrics/E61","2009-09-20",5,200,901,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E61","/home/akshyta/Desktop/DBMS_Project/Images/E61");
insert into English_Songs values(562,"You Belong With Me",73,"Taylor Swift","/home/akshyta/Desktop/DBMS_Project/Lyrics/E62","2008-09-30",4,190,901,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E62","/home/akshyta/Desktop/DBMS_Project/Images/E62");
insert into English_Songs values(563,"Shallow",74,"Lady Gaga","/home/akshyta/Desktop/DBMS_Project/Lyrics/E63","2018-08-14",5,200,901,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E63","/home/akshyta/Desktop/DBMS_Project/Images/E63");
insert into English_Songs values(564,"Just Dance",74,"Lady Gaga","/home/akshyta/Desktop/DBMS_Project/Lyrics/E64","2008-10-25",5,180,901,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E64","/home/akshyta/Desktop/DBMS_Project/Images/E64");
insert into English_Songs values(565,"Havana",75,"Camila Cabello","/home/akshyta/Desktop/DBMS_Project/Lyrics/E65","2018-03-11",5,180,901,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E65","/home/akshyta/Desktop/DBMS_Project/Images/E65");
insert into English_Songs values(566,"Senorita",75,"Camila Cabello","/home/akshyta/Desktop/DBMS_Project/Lyrics/E66","2019-11-03",5,200,901,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E66","/home/akshyta/Desktop/DBMS_Project/Images/E66");
insert into English_Songs values(567,"Closer",76,"The Chainsmokers","/home/akshyta/Desktop/DBMS_Project/Lyrics/E67","2016-07-15",5,200,905,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E67","/home/akshyta/Desktop/DBMS_Project/Images/E67");
insert into English_Songs values(568,"Paris",76,"The Chainsmokers","/home/akshyta/Desktop/DBMS_Project/Lyrics/E68","2017-10-20",3,150,905,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E68","/home/akshyta/Desktop/DBMS_Project/Images/E68");
insert into English_Songs values(569,"Instant Crush",77,"Daft Punk","/home/akshyta/Desktop/DBMS_Project/Lyrics/E69","2013-11-22",5,200,905,106,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E69","/home/akshyta/Desktop/DBMS_Project/Images/E69");
insert into English_Songs values(570,"We Will Rock You",87,"Queen","/home/akshyta/Desktop/DBMS_Project/Lyrics/E70","1977-03-18",4,190,902,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E70","/home/akshyta/Desktop/DBMS_Project/Images/E70");
insert into English_Songs values(571,"Bohemian Rhapsody",87,"Queen","/home/akshyta/Desktop/DBMS_Project/Lyrics/E71","1975-07-23",5,200,902,106,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E71","/home/akshyta/Desktop/DBMS_Project/Images/E71");
insert into English_Songs values(572,"I Want to Break Free",87,"Queen","/home/akshyta/Desktop/DBMS_Project/Lyrics/E72","1984-08-08",5,160,902,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E72","/home/akshyta/Desktop/DBMS_Project/Images/E72");
insert into English_Songs values(573,"Hey You",88,"Pink Floyd","/home/akshyta/Desktop/DBMS_Project/Lyrics/E73","1979-11-28",3,150,902,106,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E73","/home/akshyta/Desktop/DBMS_Project/Images/E73");
insert into English_Songs values(574,"Another Brick in the Wall",88,"Pink Floyd","/home/akshyta/Desktop/DBMS_Project/Lyrics/E74","1979-11-28",4,160,902,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E74","/home/akshyta/Desktop/DBMS_Project/Images/E74");
insert into English_Songs values(575,"Wish You Were Here",88,"Pink Floyd","/home/akshyta/Desktop/DBMS_Project/Lyrics/E75","1975-09-12",5,190,902,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E75","/home/akshyta/Desktop/DBMS_Project/Images/E75");
insert into English_Songs values(576,"Comfortably Numb",88,"Pink Floyd","/home/akshyta/Desktop/DBMS_Project/Lyrics/E76","1979-11-28",5,200,902,106,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E79","/home/akshyta/Desktop/DBMS_Project/Images/E76");
insert into English_Songs values(577,"Kashmir",89,"Led Zeppelin","/home/akshyta/Desktop/DBMS_Project/Lyrics/E77","1971-06-14",3,160,902,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E77","/home/akshyta/Desktop/DBMS_Project/Images/E77");
insert into English_Songs values(578,"Immigrant Song",89,"Led Zeppelin","/home/akshyta/Desktop/DBMS_Project/Lyrics/E78","1970-05-31",4,170,902,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E78","/home/akshyta/Desktop/DBMS_Project/Images/E78");
insert into English_Songs values(579,"Stairway to Heaven",89,"Led Zeppelin","/home/akshyta/Desktop/DBMS_Project/Lyrics/E79","1971-06-14",5,200,902,106,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E79","/home/akshyta/Desktop/DBMS_Project/Images/E79");
insert into English_Songs values(580,"Don't Cry",90,"Guns n Roses","/home/akshyta/Desktop/DBMS_Project/Lyrics/E80","1991-04-13",3,150,902,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E80","/home/akshyta/Desktop/DBMS_Project/Images/E80");
insert into English_Songs values(581,"November Rain",90,"Guns n Roses","/home/akshyta/Desktop/DBMS_Project/Lyrics/E81","1987-07-23",5,200,902,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E81","/home/akshyta/Desktop/DBMS_Project/Images/E81");
insert into English_Songs values(582,"Sweet Child O' Mine",90,"Guns n Roses","/home/akshyta/Desktop/DBMS_Project/Lyrics/E82","1987-07-23",5,190,902,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E82","/home/akshyta/Desktop/DBMS_Project/Images/E82");
insert into English_Songs values(583,"Paradise City",90,"Guns n Roses","/home/akshyta/Desktop/DBMS_Project/Lyrics/E83","1987-07-23",4,170,902,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E83","/home/akshyta/Desktop/DBMS_Project/Images/E83");
insert into English_Songs values(584,"I don't wanna miss a thing",91,"Aerosmith","/home/akshyta/Desktop/DBMS_Project/Lyrics/E84","1998-12-30",4,150,902,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E84","/home/akshyta/Desktop/DBMS_Project/Images/E84");
insert into English_Songs values(585,"Yellow",92,"Coldplay","/home/akshyta/Desktop/DBMS_Project/Lyrics/E85","2000-02-23",5,200,902,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E85","/home/akshyta/Desktop/DBMS_Project/Images/E85");
insert into English_Songs values(586,"Paradise",92,"Coldplay","/home/akshyta/Desktop/DBMS_Project/Lyrics/E86","2011-03-15",4,190,902,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E86","/home/akshyta/Desktop/DBMS_Project/Images/E86");
insert into English_Songs values(587,"Highway to Hell",93,"AC/DC","/home/akshyta/Desktop/DBMS_Project/Lyrics/E87","1979-09-06",4,150,902,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E87","/home/akshyta/Desktop/DBMS_Project/Images/E87");
insert into English_Songs values(588,"The man who sold the world",94,"Nirvana","/home/akshyta/Desktop/DBMS_Project/Lyrics/E88","1994-06-2",5,200,902,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E88","/home/akshyta/Desktop/DBMS_Project/Images/E88");
insert into English_Songs values(589,"Smells like teen spirit",94,"Nirvana","/home/akshyta/Desktop/DBMS_Project/Lyrics/E89","1991-10-2",5,180,902,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E89","/home/akshyta/Desktop/DBMS_Project/Images/E89");
insert into English_Songs values(590,"Come as you are",94,"Nirvana","/home/akshyta/Desktop/DBMS_Project/Lyrics/E90","1991-10-22",4,190,902,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E90","/home/akshyta/Desktop/DBMS_Project/Images/E90");
insert into English_Songs values(591,"There is a light that never goes out",95,"The Smiths","/home/akshyta/Desktop/DBMS_Project/Lyrics/E91","1986-06-04",5,190,902,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E91","/home/akshyta/Desktop/DBMS_Project/Images/E91");
insert into English_Songs values(592,"I know it's over",95,"The Smiths","/home/akshyta/Desktop/DBMS_Project/Lyrics/E92","1986-06-04",4,180,902,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E92","/home/akshyta/Desktop/DBMS_Project/Images/E92");
insert into English_Songs values(593,"All of Me",96,"John Legend","/home/akshyta/Desktop/DBMS_Project/Lyrics/E93","2013-11-14",5,200,904,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E93","/home/akshyta/Desktop/DBMS_Project/Images/E93");
insert into English_Songs values(594,"Love Me Now",96,"John Legend","/home/akshyta/Desktop/DBMS_Project/Lyrics/E94","2016-02-13",4,190,904,103,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E94","/home/akshyta/Desktop/DBMS_Project/Images/E94");
insert into English_Songs values(595,"End of the Night",97,"The Doors","/home/akshyta/Desktop/DBMS_Project/Lyrics/E95","1967-10-31",4,130,902,104,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E95","/home/akshyta/Desktop/DBMS_Project/Images/E95");
insert into English_Songs values(596,"Counting Stars",98,"OneRepublic","/home/akshyta/Desktop/DBMS_Project/Lyrics/E96","2013-04-13",5,200,902,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E96","/home/akshyta/Desktop/DBMS_Project/Images/E96");
insert into English_Songs values(597,"Centuries",99,"Fall Out Boy","/home/akshyta/Desktop/DBMS_Project/Lyrics/E97","2014-07-30",5,190,902,105,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E97","/home/akshyta/Desktop/DBMS_Project/Images/E97");
insert into English_Songs values(598,"Cold Water",100,"Justin Bieber","/home/akshyta/Desktop/DBMS_Project/Lyrics/E98","2016-01-20",5,200,905,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E98","/home/akshyta/Desktop/DBMS_Project/Images/E98");
insert into English_Songs values(599,"Sorry",100,"Justin Bieber","/home/akshyta/Desktop/DBMS_Project/Lyrics/E99","2016-01-20",5,200,901,101,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E99","/home/akshyta/Desktop/DBMS_Project/Images/E99");
insert into English_Songs values(5100,"Let Me Love You",100,"Justin Bieber","/home/akshyta/Desktop/DBMS_Project/Lyrics/E100","2016-01-20",5,190,905,102,42,"/home/akshyta/Desktop/DBMS_Project/Songs/E100","/home/akshyta/Desktop/DBMS_Project/Images/E100");

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

            
Insert into Gujrati_Songs values(700,"Maine Payal Hai Chhanikai",24,"Falguni Pathak","/home/akshyta/Desktop/DBMS_Project/Lyrics/G1","2013-05-13",4,162,901,102,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G1","/home/akshyta/Desktop/DBMS_Project/Images/G1");
Insert into Gujrati_Songs values(701,"Yaad Piya ki Aane Lagi",24,"Falguni Pathak","/home/akshyta/Desktop/DBMS_Project/Lyrics/G2","2013-05-13",4,135,902,103,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G2","/home/akshyta/Desktop/DBMS_Project/Images/G2");
Insert into Gujrati_Songs values(702,"Meri Chunar Udd Udd jaye",24,"Falguni Pathak","/home/akshyta/Desktop/DBMS_Project/Lyrics/G3","2013-05-13",3,110,903,103,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G3","/home/akshyta/Desktop/DBMS_Project/Images/G3");
Insert into Gujrati_Songs values(703,"Saawan Mein",24,"Falguni Pathak","/home/akshyta/Desktop/DBMS_Project/Lyrics/G4","2015-06-18",5,130,904,103,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G4","/home/akshyta/Desktop/DBMS_Project/Images/G4");
Insert into Gujrati_Songs values(705,"Aiyo Rama",24,"Falguni Pathak","/home/akshyta/Desktop/DBMS_Project/Lyrics/G5","2012-08-20",4,100,905,102,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G5","/home/akshyta/Desktop/DBMS_Project/Images/G5");
Insert into Gujrati_Songs values(706,"Agamni Vaat Karsho Na",27,"Sanjay Oza","/home/akshyta/Desktop/DBMS_Project/Lyrics/G6","2010-11-14",3,140,906,105,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G6","/home/akshyta/Desktop/DBMS_Project/Images/G6");
Insert into Gujrati_Songs values(707,"Amari Jindagi No Aa",27,"Sanjay Oza","/home/akshyta/Desktop/DBMS_Project/Lyrics/G7","2012-04-13",5,160,907,105,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G7","/home/akshyta/Desktop/DBMS_Project/Images/G7");
Insert into Gujrati_Songs values(708,"Haque Thi Vadhare Lesh",27,"Sanjay Oza","/home/akshyta/Desktop/DBMS_Project/Lyrics/G8","2016-01-31",4,145,908,101,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G8","/home/akshyta/Desktop/DBMS_Project/Images/G8");
Insert into Gujrati_Songs values(709,"Matlabi Duniya Matlabi Pyar",28,"Parth Chaudhary","/home/akshyta/Desktop/DBMS_Project/Lyrics/G9","2016-05-22",4,170,909,104,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G9","/home/akshyta/Desktop/DBMS_Project/Images/G9");
Insert into Gujrati_Songs values(710,"Love You Love You Karta Ta",28,"Parth Chaudhary","/home/akshyta/Desktop/DBMS_Project/Lyrics/G10","2016-08-25",2,100,901,104,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G10","/home/akshyta/Desktop/DBMS_Project/Images/G10");
Insert into Gujrati_Songs values(711,"Dhol Nagada",29,"Geeta Rabari","/home/akshyta/Desktop/DBMS_Project/Lyrics/G11","2009-02-01",5,190,902,101,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G11","/home/akshyta/Desktop/DBMS_Project/Images/G11");
Insert into Gujrati_Songs values(712,"Koni Pade Entry",29,"Geeta Rabari","/home/akshyta/Desktop/DBMS_Project/Lyrics/G12","2009-08-20",3,113,903,102,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G12","/home/akshyta/Desktop/DBMS_Project/Images/G12");
Insert into Gujrati_Songs values(713,"Bewafa Have Taro Varo",30,"Vijay Suvada","/home/akshyta/Desktop/DBMS_Project/Lyrics/G13","2007-01-04",4,122,904,102,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G13","/home/akshyta/Desktop/DBMS_Project/Images/G13");
Insert into Gujrati_Songs values(714,"Lagdi Lahore Di",31,"Sachin Jigar","/home/akshyta/Desktop/DBMS_Project/Lyrics/G14","2011-08-03",2,29,905,105,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G14","/home/akshyta/Desktop/DBMS_Project/Images/G14");
Insert into Gujrati_Songs values(715,"Kamariya",31,"Sachin Jigar","/home/akshyta/Desktop/DBMS_Project/Lyrics/G15","2015-01-28",4,120,906,105,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G15","/home/akshyta/Desktop/DBMS_Project/Images/G15");
Insert into Gujrati_Songs values(716,"Kyu Sudhi Aene Yaad Karu",32,"Jayker Bhojak","/home/akshyta/Desktop/DBMS_Project/Lyrics/G16","2005-01-02",3,114,907,101,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G16","/home/akshyta/Desktop/DBMS_Project/Images/G16");
Insert into Gujrati_Songs values(717,"Lapet",32,"Jayker Bhojak","/home/akshyta/Desktop/DBMS_Project/Lyrics/G17","2014-03-18",3,130,908,102,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G17","/home/akshyta/Desktop/DBMS_Project/Images/G17");
Insert into Gujrati_Songs values(718,"Bhooli Shaksho Na Tame",32,"Jayker Bhojak","/home/akshyta/Desktop/DBMS_Project/Lyrics/G18","2005-01-29",3,155,909,103,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G18","/home/akshyta/Desktop/DBMS_Project/Images/G18");
Insert into Gujrati_Songs values(719,"Ukhana",33,"Shyamal Saumil","/home/akshyta/Desktop/DBMS_Project/Lyrics/G19","2016-04-05",4,177,901,104,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G19","/home/akshyta/Desktop/DBMS_Project/Images/G19");
Insert into Gujrati_Songs values(720,"He Nath Jodi Hath",33,"Shyama Saumil","/home/akshyta/Desktop/DBMS_Project/Lyrics/G20","2018-09-30",4,189,902,105,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G20","/home/akshyta/Desktop/DBMS_Project/Images/G20");
Insert into Gujrati_Songs values(721,"Dejo Tali",34,"Aarti Munshi","/home/akshyta/Desktop/DBMS_Project/Lyrics/G21","2017-09-27",5,200,903,101,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G21","/home/akshyta/Desktop/DBMS_Project/Images/G21");
Insert into Gujrati_Songs values(722,"Ghor Andhari Re",34,"Aarti Munshi","/home/akshyta/Desktop/DBMS_Project/Lyrics/G22","2010-10-28",4,188,904,102,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G22","/home/akshyta/Desktop/DBMS_Project/Images/G22");
Insert into Gujrati_Songs values(723,"Jai Devi Jai Jai Om",34,"Aarti Munshi","/home/akshyta/Desktop/DBMS_Project/Lyrics/G23","2010-10-28",4,120,905,102,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G23","/home/akshyta/Desktop/DBMS_Project/Images/G23");
Insert into Gujrati_Songs values(724,"Daru Pidho",35,"Vatsala Patil","/home/akshyta/Desktop/DBMS_Project/Lyrics/G24","2011-11-18",5,134,906,102,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G24","/home/akshyta/Desktop/DBMS_Project/Images/G24");
Insert into Gujrati_Songs values(725,"Ke Bole Koyaldi",35,"Vatsala Patil","/home/akshyta/Desktop/DBMS_Project/Lyrics/G25","2012-12-19",3,160,907,103,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G25","/home/akshyta/Desktop/DBMS_Project/Images/G25");
Insert into Gujrati_Songs values(726,"Ram Chahe Leela",36,"Bhoomi Trivedi","/home/akshyta/Desktop/DBMS_Project/Lyrics/G26","2001-01-20",3,156,908,104,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G26","/home/akshyta/Desktop/DBMS_Project/Images/G26");
Insert into Gujrati_Songs values(727,"Haiye Rakhi Hom",37,"Atul Purohit","/home/akshyta/Desktop/DBMS_Project/Lyrics/G27","2003-03-22",4,140,909,101,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G27","/home/akshyta/Desktop/DBMS_Project/Images/G27");
Insert into Gujrati_Songs values(728,"Jay Jay ho ganpati bapa",38,"Paritosh Goswami","/home/akshyta/Desktop/DBMS_Project/Lyrics/G28","2004-04-23",3,175,901,102,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G28","/home/akshyta/Desktop/DBMS_Project/Images/G28");
Insert into Gujrati_Songs values(729,"Hari Om Namah Shivah",39,"Sachin Limaye","/home/akshyta/Desktop/DBMS_Project/Lyrics/G29","2005-05-29",4,185,902,103,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G29","/home/akshyta/Desktop/DBMS_Project/Images/G29");
Insert into Gujrati_Songs values(730,"Jamuna Ne Kanthe",40,"Achal Mehta","/home/akshyta/Desktop/DBMS_Project/Lyrics/G30","2006-06-30",5,180,903,104,41,"/home/akshyta/Desktop/DBMS_Project/Songs/G30","/home/akshyta/Desktop/DBMS_Project/Images/G30");



INSERT INTO Hindi_Songs VALUES( 401,'Ratta Maar', 6,'Vishal Shekar',"/home/akshyta/Desktop/DBMS_Project/Lyrics/H1.txt",'2018-5-15',3,100,901,105,1,"/home/akshyta/Desktop/DBMS_Project/Songs/H1.mp3","/home/akshyta/Desktop/DBMS_Project/Images/H1.jpg");
INSERT INTO Hindi_Songs VALUES(	
			402,
			'Radha',
			5,
			'Shreya Ghoshal',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H2.txt",    
			'2016-10-10', 	
			5,
			129,
			901, 
			101, 
			1, 
			"/home/akshyta/Desktop/DBMS_Project/Songs/H2.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H2.jpg" 
);
INSERT INTO Hindi_Songs VALUES(
			403,
			'Aal Izz Well',
			19,
			'Shaan',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H3.txt",    
			'2016-5-2',
			5,
			100,
			901, 
			101, 
			2, 
			"/home/akshyta/Desktop/DBMS_Project/Songs/H3.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H3.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			404,
			'Zoobi Doobi',
			5,
			'Shreya Ghoshal',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H4.txt",    
			'2017-2-13',
			3,
			70,
			901, 
			101, 
			2,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H4.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H4.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			405,
			'Garmi',
			4,
			'Neha Kakkar',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H5.txt",    
			'2019-2-18',
			5,
			200,
			904, 
			102, 
			3,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H5.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H5.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			406,
			'Kho Jaane De',
			20,
			'S.D Burman',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H6.txt",    
			'2016-5-2',
			4,
			159,
			901, 
			105,
			4,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H6.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H6.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			407,
			'Bhagwaan Hai Kahan Re Tu',
			10,
			'Sonu Nigam',     
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H7.txt",    
			'2012-7-15',
			5, 	
			200,  	
			901,		
			104,		
			5,         
			"/home/akshyta/Desktop/DBMS_Project/Songs/H7.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H7.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			408,
			'Chann Chann',
			5,
			'Shreya Ghoshal',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H8.txt",    
			'2015-11-30',
			4,
			50,
			901, 
			101,
			6, 
			"/home/akshyta/Desktop/DBMS_Project/Songs/H8.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H8.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			409,
			'Subah Ho Gayi Maamu',
			19,
			'Shaan',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H9.txt",    
			'2014-6-8',
			4,
			100,
			901,
			101, 
			6, 
			"/home/akshyta/Desktop/DBMS_Project/Songs/H9.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H9.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			410,
			'Main Badiya Tu Bhi Badiya',
			10,
			'Sonu Nigam',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H10.txt",    
			'2010-10-21',
			3,
			130,
			905, 
			102, 
			7,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H10.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H10.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			411,
			'Yaad Piya ki aane lagi',
			4,
			'Neha Kakkar',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H11.txt",    
			'2010-10-21',
			3,
			200,
			905,
			104, 
			8,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H11.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H11.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			412,
			'Sauda Khara Khara',
			15,
			'Diljit Dosanjh',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H12.txt",    
			'2010-10-21',
			5,
			179,
			901, 
			102,
			11,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H12.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H12.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			413,
			'Chandigarh Mein',
			13,
			'Badshah',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H13.txt",    
			'2010-10-21',
			4,
			131,
			903,
			102, 
			11,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H13.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H13.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			414,
			'Badla',
			2,
			'Arijit Singh',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H14.txt",    
			'2010-10-21',
			3,
			130,
			905, 
			102, 
			12,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H14.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H14.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			415,
			'Awari',
			1,
			'Alka Yagnik',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H15.txt",    
			'2010-10-21',
			4,
			132,
			904, 
			101, 
			39,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H15.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H15.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			416,
			'Sher Aaya Sher',
			20,
			'S.D Burman',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H16.txt",    
			'2010-10-21',
			3,
			129,
			905,
			102, 
			13,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H16.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H16.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			417,
			'Chaandaniya',
			3,
			'Asha Bhosle',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H17.txt",    
			'2010-10-21',
			2,
			190,
			909, 
			103, 
			37,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H17.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H17.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			418,
			'Mujhe Chaand Pe Le Chalo',
			23,
			'Richa Sharma',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H18.txt",    
			'2010-10-21',
			4,
			134,
			905, 
			102, 
			7,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H18.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H18.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			419,
			'Mere Sapnon Ki Rani',
			7,
			'Kishore Kumar',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H19.txt",    
			'2010-10-21',
			3,
			120,
			901, 
			101, 
			41,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H19.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H19.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			420,
			'Hoor',
			9,
			'Atif Aslam',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H20.txt",    
			'2010-10-21',
			3,
			132,
			901, 
			101, 
			19,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H20.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H20.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			421,
			'Radio',
			8,
			'A.R. Rahman',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H21.txt",    
			'2010-10-21',
			3,
			140,
			901, 
			103, 
			21,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H21.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H21.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			422,
			'India Waale',
			16,
			'Sankar Mahadevan',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H22.txt",    
			'2010-10-21',
			2,
			130,
			901, 
			101, 
			38,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H22.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H22.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			423,
			'Badhaaiyan Tenu',
			22,
			'Benny Dayal',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H23.txt",    
			'2010-10-21',
			5,
			140,
			901, 
			102, 
			17,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H23.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H23.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			424,
			'Tera Ghata',
			21,
			'Gajendra Verma',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H24.txt",    
			'2010-10-21',
			3,
			145,
			901, 
			104, 
			41,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H24.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H24.jpg"
);
INSERT INTO Hindi_Songs VALUES(
			425,
			'East Aur West',
			14,
			'Anu Malik',
			"/home/akshyta/Desktop/DBMS_Project/Lyrics/H25.txt",    
			'2010-10-21',
			1,
			130,
			905, 
			102, 
			20,
			"/home/akshyta/Desktop/DBMS_Project/Songs/H25.mp3",
			"/home/akshyta/Desktop/DBMS_Project/Images/H25.jpg" );



Insert into Favorite_Songs values(403,1);
Insert into Favorite_Songs values(403,2);
Insert into Favorite_Songs values(413,3);
Insert into Favorite_Songs values(423,4);
Insert into Favorite_Songs values(422,5);
Insert into Favorite_Songs values(425,6);
Insert into Favorite_Songs values(583,156);
Insert into Favorite_Songs values(547,157);
Insert into Favorite_Songs values(579,158);
Insert into Favorite_Songs values(582,159);
Insert into Favorite_Songs values(575,160);
Insert into Favorite_Songs values(613,161);
Insert into Favorite_Songs values(620,162);
Insert into Favorite_Songs values(614,163);
Insert into Favorite_Songs values(603,164);
Insert into Favorite_Songs values(422,7);
Insert into Favorite_Songs values(406,8);
Insert into Favorite_Songs values(413,9);
Insert into Favorite_Songs values(716,81);
Insert into Favorite_Songs values(701,82);
Insert into Favorite_Songs values(722,83);
Insert into Favorite_Songs values(728,84);
Insert into Favorite_Songs values(725,85);
Insert into Favorite_Songs values(417,21);
Insert into Favorite_Songs values(416,22);
Insert into Favorite_Songs values(400,23);
Insert into Favorite_Songs values(401,24);
Insert into Favorite_Songs values(402,25);
Insert into Favorite_Songs values(411,26);
Insert into Favorite_Songs values(400,27);
Insert into Favorite_Songs values(412,28);
Insert into Favorite_Songs values(421,29);
Insert into Favorite_Songs values(409,30);
Insert into Favorite_Songs values(410,31);
Insert into Favorite_Songs values(415,32);
Insert into Favorite_Songs values(417,33);
Insert into Favorite_Songs values(403,34);
Insert into Favorite_Songs values(414,35);
Insert into Favorite_Songs values(411,36);
Insert into Favorite_Songs values(400,37);
Insert into Favorite_Songs values(412,38);
Insert into Favorite_Songs values(411,39);
Insert into Favorite_Songs values(418,40);
Insert into Favorite_Songs values(824,41);
Insert into Favorite_Songs values(819,42);
Insert into Favorite_Songs values(800,43);
Insert into Favorite_Songs values(804,44);
Insert into Favorite_Songs values(812,45);
Insert into Favorite_Songs values(807,46);
Insert into Favorite_Songs values(814,47);
Insert into Favorite_Songs values(820,48);
Insert into Favorite_Songs values(803,49);
Insert into Favorite_Songs values(801,50);
Insert into Favorite_Songs values(811,51);
Insert into Favorite_Songs values(803,52);
Insert into Favorite_Songs values(819,53);
Insert into Favorite_Songs values(807,54);
Insert into Favorite_Songs values(818,55);
Insert into Favorite_Songs values(821,56);
Insert into Favorite_Songs values(411,10);
Insert into Favorite_Songs values(403,11);
Insert into Favorite_Songs values(423,12);
Insert into Favorite_Songs values(401,13);
Insert into Favorite_Songs values(424,14);
Insert into Favorite_Songs values(423,15);
Insert into Favorite_Songs values(411,16);
Insert into Favorite_Songs values(419,17);
Insert into Favorite_Songs values(417,18);
Insert into Favorite_Songs values(422,19);
Insert into Favorite_Songs values(403,20);
Insert into Favorite_Songs values(821,57);
Insert into Favorite_Songs values(811,58);
Insert into Favorite_Songs values(812,59);
Insert into Favorite_Songs values(825,60);
Insert into Favorite_Songs values(816,61);
Insert into Favorite_Songs values(825,62);
Insert into Favorite_Songs values(810,63);
Insert into Favorite_Songs values(806,64);
Insert into Favorite_Songs values(808,65);
Insert into Favorite_Songs values(821,66);
Insert into Favorite_Songs values(812,67);
Insert into Favorite_Songs values(819,68);
Insert into Favorite_Songs values(807,69);
Insert into Favorite_Songs values(800,70);
Insert into Favorite_Songs values(802,71);
Insert into Favorite_Songs values(806,72);
Insert into Favorite_Songs values(816,73);
Insert into Favorite_Songs values(819,74);
Insert into Favorite_Songs values(809,75);
Insert into Favorite_Songs values(809,76);
Insert into Favorite_Songs values(809,77);
Insert into Favorite_Songs values(813,78);
Insert into Favorite_Songs values(811,79);
Insert into Favorite_Songs values(804,80);
Insert into Favorite_Songs values(707,86);
Insert into Favorite_Songs values(714,87);
Insert into Favorite_Songs values(710,88);
Insert into Favorite_Songs values(707,89);
Insert into Favorite_Songs values(700,90);
Insert into Favorite_Songs values(720,91);
Insert into Favorite_Songs values(703,92);
Insert into Favorite_Songs values(730,93);
Insert into Favorite_Songs values(704,94);
Insert into Favorite_Songs values(701,95);
Insert into Favorite_Songs values(722,96);
Insert into Favorite_Songs values(727,97);
Insert into Favorite_Songs values(727,98);
Insert into Favorite_Songs values(725,99);
Insert into Favorite_Songs values(711,100);
Insert into Favorite_Songs values(707,101);
Insert into Favorite_Songs values(730,102);
Insert into Favorite_Songs values(724,103);
Insert into Favorite_Songs values(719,104);
Insert into Favorite_Songs values(713,105);
Insert into Favorite_Songs values(728,106);
Insert into Favorite_Songs values(711,107);
Insert into Favorite_Songs values(723,108);
Insert into Favorite_Songs values(702,109);
Insert into Favorite_Songs values(716,110);
Insert into Favorite_Songs values(701,111);
Insert into Favorite_Songs values(716,112);
Insert into Favorite_Songs values(730,113);
Insert into Favorite_Songs values(713,114);
Insert into Favorite_Songs values(721,115);
Insert into Favorite_Songs values(719,116);
Insert into Favorite_Songs values(700,117);
Insert into Favorite_Songs values(711,118);
Insert into Favorite_Songs values(722,119);
Insert into Favorite_Songs values(720,120);
Insert into Favorite_Songs values(554,121);
Insert into Favorite_Songs values(550,122);
Insert into Favorite_Songs values(515,123);
Insert into Favorite_Songs values(598,124);
Insert into Favorite_Songs values(571,125);
Insert into Favorite_Songs values(529,126);
Insert into Favorite_Songs values(549,127);
Insert into Favorite_Songs values(591,128);
Insert into Favorite_Songs values(531,129);
Insert into Favorite_Songs values(511,130);
Insert into Favorite_Songs values(587,131);
Insert into Favorite_Songs values(585,132);
Insert into Favorite_Songs values(513,133);
Insert into Favorite_Songs values(547,134);
Insert into Favorite_Songs values(529,135);
Insert into Favorite_Songs values(554,136);
Insert into Favorite_Songs values(582,137);
Insert into Favorite_Songs values(543,138);
Insert into Favorite_Songs values(595,139);
Insert into Favorite_Songs values(533,140);
Insert into Favorite_Songs values(527,141);
Insert into Favorite_Songs values(535,142);
Insert into Favorite_Songs values(540,143);
Insert into Favorite_Songs values(529,144);
Insert into Favorite_Songs values(502,145);
Insert into Favorite_Songs values(521,146);
Insert into Favorite_Songs values(509,147);
Insert into Favorite_Songs values(507,148);
Insert into Favorite_Songs values(554,149);
Insert into Favorite_Songs values(516,150);
Insert into Favorite_Songs values(561,151);
Insert into Favorite_Songs values(582,152);
Insert into Favorite_Songs values(553,153);
Insert into Favorite_Songs values(506,154);
Insert into Favorite_Songs values(532,155);
Insert into Favorite_Songs values(609,165);
Insert into Favorite_Songs values(618,166);
Insert into Favorite_Songs values(616,167);
Insert into Favorite_Songs values(617,168);
Insert into Favorite_Songs values(620,169);
Insert into Favorite_Songs values(604,170);
Insert into Favorite_Songs values(601,171);
Insert into Favorite_Songs values(610,172);
Insert into Favorite_Songs values(601,173);
Insert into Favorite_Songs values(609,174);
Insert into Favorite_Songs values(609,175);
Insert into Favorite_Songs values(603,176);
Insert into Favorite_Songs values(616,177);
Insert into Favorite_Songs values(619,178);
Insert into Favorite_Songs values(603,179);
Insert into Favorite_Songs values(614,180);
Insert into Favorite_Songs values(604,181);
Insert into Favorite_Songs values(612,182);
Insert into Favorite_Songs values(609,183);
Insert into Favorite_Songs values(616,184);
Insert into Favorite_Songs values(607,185);
Insert into Favorite_Songs values(609,186);
Insert into Favorite_Songs values(619,187);
Insert into Favorite_Songs values(616,188);
Insert into Favorite_Songs values(609,189);
Insert into Favorite_Songs values(611,190);
Insert into Favorite_Songs values(613,191);
Insert into Favorite_Songs values(607,192);
Insert into Favorite_Songs values(601,193);
Insert into Favorite_Songs values(609,194);
Insert into Favorite_Songs values(610,195);
Insert into Favorite_Songs values(618,196);
Insert into Favorite_Songs values(615,197);
Insert into Favorite_Songs values(619,198);
Insert into Favorite_Songs values(616,199);
Insert into Favorite_Songs values(605,200);


Insert into Songs_Listened values(421,1);
Insert into Songs_Listened values(424,2);
Insert into Songs_Listened values(406,3);
Insert into Songs_Listened values(416,4);
Insert into Songs_Listened values(610,192);
Insert into Songs_Listened values(611,193);
Insert into Songs_Listened values(614,194);
Insert into Songs_Listened values(607,195);
Insert into Songs_Listened values(602,196);
Insert into Songs_Listened values(615,197);
Insert into Songs_Listened values(419,5);
Insert into Songs_Listened values(401,6);
Insert into Songs_Listened values(400,7);
Insert into Songs_Listened values(414,8);
Insert into Songs_Listened values(409,9);
Insert into Songs_Listened values(812,47);
Insert into Songs_Listened values(825,48);
Insert into Songs_Listened values(821,49);
Insert into Songs_Listened values(803,50);
Insert into Songs_Listened values(824,51);
Insert into Songs_Listened values(818,52);
Insert into Songs_Listened values(408,10);
Insert into Songs_Listened values(422,11);
Insert into Songs_Listened values(408,12);
Insert into Songs_Listened values(418,13);
Insert into Songs_Listened values(400,14);
Insert into Songs_Listened values(424,15);
Insert into Songs_Listened values(424,16);
Insert into Songs_Listened values(412,17);
Insert into Songs_Listened values(414,18);
Insert into Songs_Listened values(411,19);
Insert into Songs_Listened values(420,20);
Insert into Songs_Listened values(413,21);
Insert into Songs_Listened values(420,22);
Insert into Songs_Listened values(417,23);
Insert into Songs_Listened values(419,24);
Insert into Songs_Listened values(403,25);
Insert into Songs_Listened values(412,26);
Insert into Songs_Listened values(425,27);
Insert into Songs_Listened values(408,28);
Insert into Songs_Listened values(420,29);
Insert into Songs_Listened values(410,30);
Insert into Songs_Listened values(530,137);
Insert into Songs_Listened values(507,138);
Insert into Songs_Listened values(519,139);
Insert into Songs_Listened values(522,140);
Insert into Songs_Listened values(574,141);
Insert into Songs_Listened values(554,142);
Insert into Songs_Listened values(404,31);
Insert into Songs_Listened values(403,32);
Insert into Songs_Listened values(407,33);
Insert into Songs_Listened values(422,34);
Insert into Songs_Listened values(423,35);
Insert into Songs_Listened values(401,36);
Insert into Songs_Listened values(402,37);
Insert into Songs_Listened values(421,38);
Insert into Songs_Listened values(408,39);
Insert into Songs_Listened values(411,40);
Insert into Songs_Listened values(815,41);
Insert into Songs_Listened values(818,42);
Insert into Songs_Listened values(803,43);
Insert into Songs_Listened values(816,44);
Insert into Songs_Listened values(802,45);
Insert into Songs_Listened values(820,46);
Insert into Songs_Listened values(811,53);
Insert into Songs_Listened values(802,54);
Insert into Songs_Listened values(822,55);
Insert into Songs_Listened values(815,56);
Insert into Songs_Listened values(823,57);
Insert into Songs_Listened values(806,58);
Insert into Songs_Listened values(801,59);
Insert into Songs_Listened values(819,60);
Insert into Songs_Listened values(815,61);
Insert into Songs_Listened values(823,62);
Insert into Songs_Listened values(800,63);
Insert into Songs_Listened values(807,64);
Insert into Songs_Listened values(803,65);
Insert into Songs_Listened values(805,66);
Insert into Songs_Listened values(800,67);
Insert into Songs_Listened values(816,68);
Insert into Songs_Listened values(815,69);
Insert into Songs_Listened values(817,70);
Insert into Songs_Listened values(816,71);
Insert into Songs_Listened values(823,72);
Insert into Songs_Listened values(801,73);
Insert into Songs_Listened values(819,74);
Insert into Songs_Listened values(809,75);
Insert into Songs_Listened values(808,76);
Insert into Songs_Listened values(815,77);
Insert into Songs_Listened values(810,78);
Insert into Songs_Listened values(801,79);
Insert into Songs_Listened values(803,80);
Insert into Songs_Listened values(719,81);
Insert into Songs_Listened values(713,82);
Insert into Songs_Listened values(723,83);
Insert into Songs_Listened values(707,84);
Insert into Songs_Listened values(718,85);
Insert into Songs_Listened values(703,86);
Insert into Songs_Listened values(723,87);
Insert into Songs_Listened values(721,88);
Insert into Songs_Listened values(719,89);
Insert into Songs_Listened values(711,90);
Insert into Songs_Listened values(707,91);
Insert into Songs_Listened values(707,92);
Insert into Songs_Listened values(707,93);
Insert into Songs_Listened values(704,94);
Insert into Songs_Listened values(723,95);
Insert into Songs_Listened values(703,96);
Insert into Songs_Listened values(714,97);
Insert into Songs_Listened values(730,98);
Insert into Songs_Listened values(713,99);
Insert into Songs_Listened values(700,100);
Insert into Songs_Listened values(709,101);
Insert into Songs_Listened values(721,102);
Insert into Songs_Listened values(702,103);
Insert into Songs_Listened values(725,104);
Insert into Songs_Listened values(726,105);
Insert into Songs_Listened values(730,106);
Insert into Songs_Listened values(705,107);
Insert into Songs_Listened values(729,108);
Insert into Songs_Listened values(703,109);
Insert into Songs_Listened values(702,110);
Insert into Songs_Listened values(726,111);
Insert into Songs_Listened values(711,112);
Insert into Songs_Listened values(729,113);
Insert into Songs_Listened values(708,114);
Insert into Songs_Listened values(704,115);
Insert into Songs_Listened values(721,116);
Insert into Songs_Listened values(723,117);
Insert into Songs_Listened values(702,118);
Insert into Songs_Listened values(712,119);
Insert into Songs_Listened values(725,120);
Insert into Songs_Listened values(507,121);
Insert into Songs_Listened values(579,122);
Insert into Songs_Listened values(583,123);
Insert into Songs_Listened values(559,124);
Insert into Songs_Listened values(535,125);
Insert into Songs_Listened values(506,126);
Insert into Songs_Listened values(510,127);
Insert into Songs_Listened values(514,128);
Insert into Songs_Listened values(577,129);
Insert into Songs_Listened values(558,130);
Insert into Songs_Listened values(562,131);
Insert into Songs_Listened values(506,132);
Insert into Songs_Listened values(526,133);
Insert into Songs_Listened values(566,134);
Insert into Songs_Listened values(553,135);
Insert into Songs_Listened values(572,136);
Insert into Songs_Listened values(508,143);
Insert into Songs_Listened values(540,144);
Insert into Songs_Listened values(597,145);
Insert into Songs_Listened values(551,146);
Insert into Songs_Listened values(535,147);
Insert into Songs_Listened values(547,148);
Insert into Songs_Listened values(543,149);
Insert into Songs_Listened values(590,150);
Insert into Songs_Listened values(549,151);
Insert into Songs_Listened values(534,152);
Insert into Songs_Listened values(552,153);
Insert into Songs_Listened values(568,154);
Insert into Songs_Listened values(564,155);
Insert into Songs_Listened values(513,156);
Insert into Songs_Listened values(546,157);
Insert into Songs_Listened values(582,158);
Insert into Songs_Listened values(550,159);
Insert into Songs_Listened values(505,160);
Insert into Songs_Listened values(618,161);
Insert into Songs_Listened values(609,162);
Insert into Songs_Listened values(603,163);
Insert into Songs_Listened values(620,164);
Insert into Songs_Listened values(617,165);
Insert into Songs_Listened values(601,166);
Insert into Songs_Listened values(600,167);
Insert into Songs_Listened values(611,168);
Insert into Songs_Listened values(611,169);
Insert into Songs_Listened values(605,170);
Insert into Songs_Listened values(611,171);
Insert into Songs_Listened values(610,172);
Insert into Songs_Listened values(620,173);
Insert into Songs_Listened values(615,174);
Insert into Songs_Listened values(607,175);
Insert into Songs_Listened values(611,176);
Insert into Songs_Listened values(607,177);
Insert into Songs_Listened values(616,178);
Insert into Songs_Listened values(609,179);
Insert into Songs_Listened values(609,180);
Insert into Songs_Listened values(611,181);
Insert into Songs_Listened values(620,182);
Insert into Songs_Listened values(600,183);
Insert into Songs_Listened values(615,184);
Insert into Songs_Listened values(616,185);
Insert into Songs_Listened values(604,186);
Insert into Songs_Listened values(611,187);
Insert into Songs_Listened values(603,188);
Insert into Songs_Listened values(600,189);
Insert into Songs_Listened values(604,190);
Insert into Songs_Listened values(613,191);
Insert into Songs_Listened values(613,198);
Insert into Songs_Listened values(618,199);
Insert into Songs_Listened values(600,200);




INSERT INTO Punjabi_Songs VALUES (602,'Dhup chik',13,'Badshah','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2014-02-01',3,310,903,102,42,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES (603,'Abhi toh party shuru hui hain',13,'Badshah','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2014-04-02',4,360,903,102,43,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(604,'Patiala Peg',15,'Diljit Dosanjh','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2014-05-12',4,160,901,105,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(605,'5 Taara',15,'Diljit Dosanjh','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2015-09-22',3,111,903,101,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(606,'Patiala Peg',15,'Diljit Dosanjh','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2014-05-12',4,160,901,105,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(607,'Kar Har Maidan Fateh',42,'Sukhwinder Singh','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2018-08-13',4,413,904,101,7,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(608,'Bunty or Bubli',42,'Sukhwinder Singh','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2005-11-18',3,211,906,102,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(609,'Udi Udi Jaye',42,'Sukhwinder Singh','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2017-08-22',3,702,905,101,22,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(610,'Bhabhi Gal sun meri',43,'Malkit Singh','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2009-03-12',2,201,905,101,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(611,'Desi Beat',43,'Malkit Singh','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2013-03-12',2,201,905,101,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(612,'Yari Jattan Di',43,'Malkit Singh','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2016-03-12',2,201,905,101,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(613,'Jugni',44,'Gurdas Maan','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2017-03-12',3,201,905,101,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(614,'Shagna Di Mehndi',44,'Gurdas Maan','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2018-03-12',4,201,905,101,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(615,'Makhna',44,'Gurdas Maan','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2017-03-12',4,201,905,101,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(616,'High rated gabru',45,'Guru Randhawa','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2017-03-12',4,201,905,101,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(617,'Lahore',45,'Guru Randhawa','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2017-03-12',4,201,905,101,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(618,'Ishare Tere',45,'Guru Randhawa','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2018-03-12',3,201,905,101,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(619,'Nikle Current',46,'Jasdeep Singh Gill','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2018-03-12',4,201,905,101,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');
INSERT INTO Punjabi_Songs VALUES(620,'Dil Tohn Black',46,'Jasdeep Singh Gill','/home/akshyta/Desktop/DBMS_Project/Lyrics/','2018-03-12',4,201,905,101,41,'/home/akshyta/Desktop/DBMS_Project/Songs/','/home/akshyta/Desktop/DBMS_Project/Images/');


