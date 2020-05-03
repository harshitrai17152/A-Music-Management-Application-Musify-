create database d7;
use d7;

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
    TotalSongs INTEGER,
    UsersFollowing INTEGER,
    ArtistBio VARCHAR(1000),
    Payment INTEGER,
    PRIMARY KEY (ArtistID)
);

CREATE TABLE FilmMakers (
    FilmMakerID INTEGER NOT NULL,
    FilmMakerName VARCHAR(100),
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

insert into Mood values( 101, 'Happy', 33 );
insert into Mood values( 102, 'Party/Dance', 42 );
insert into Mood values( 103, 'Romantic', 30 );
insert into Mood values( 104, 'Melancholy', 33 );
insert into Mood values( 105, 'Energetic', 35 );
insert into Mood values( 106, 'Relax', 11 );













