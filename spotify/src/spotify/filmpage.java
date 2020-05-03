package spotify;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.stage.Stage;
import java.sql.*;

 
public class filmpage extends Application {
	
	int userID; 
    public filmpage(int id) { 
    	userID=id;
	}

	public static void main(String[] args) {
        launch(args);  
    } 
    
    @Override
    public void start(Stage primaryStage) { 
        primaryStage.setTitle("Song Search");  
        Button btn=new Button(); 
        btn.setText("SEARCH SONG");
         
        GridPane grid=new GridPane();
        grid.setPadding(new Insets(130,200,0,50)); // top,right,bottom,left
        grid.setVgap(20);   
        grid.setHgap(30);    
         
        String f="-fx-font-weight: bolder ; -fx-text-fill: white; -fx-font:45px sans-serif";
        
        Label namel=new Label("Search Name:"); 
        namel.setStyle(f);
        GridPane.setConstraints(namel,0,0);
        TextField name=new TextField();         
        name.setPromptText("Enter song name");
        GridPane.setConstraints(name,1,0);
     
        Label langl=new Label("Language:");
        langl.setStyle(f);
        GridPane.setConstraints(langl,0,1);            
        ChoiceBox<String> cb1=new ChoiceBox<String>();
        cb1.getItems().addAll("English","Hindi","Punjabi","Korean","Gujrati","Any");
        GridPane.setConstraints(cb1,1,1);  
         
        Label genl=new Label("Genre:");
        genl.setStyle(f);
        GridPane.setConstraints(genl,0,2);            
        ChoiceBox<String> cb2=new ChoiceBox<String>();
        cb2.getItems().addAll("Pop","Rock","Hip-Hop","R&B","Electronic","Classic","Country","Jazz","Romance","Any");
        GridPane.setConstraints(cb2,1,2);  
        
        Label moodl=new Label("Mood:");
        moodl.setStyle(f);
        GridPane.setConstraints(moodl,0,3);        
        ChoiceBox<String> cb3=new ChoiceBox<String>();
        cb3.getItems().addAll("Happy","Dance","Romantic","Meloncholy","Energetic","Romntic","Any");
        GridPane.setConstraints(cb3,1,3);
        
        Label filml=new Label("Film:");
        filml.setStyle(f);
        GridPane.setConstraints(filml,0,4);
        TextField film=new TextField();         
        film.setPromptText("Enter film name");
        GridPane.setConstraints(film,1,4); 
        
        Label artistl=new Label("Artist:");
        artistl.setStyle(f);
        GridPane.setConstraints(artistl,0,5);
        TextField artist=new TextField();         
        artist.setPromptText("Enter artist name");
        GridPane.setConstraints(artist,1,5);
        
        btn.setMinSize(160,70);
        GridPane.setConstraints(btn,1,6); 
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
        
        EventHandler<ActionEvent> event=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try{
            		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spo","root","Maeve@123");
            		Statement stmt=con.createStatement();  
            		String query="";
           		
            		String language=cb1.getValue(); 
            		String genre=cb2.getValue();
            		String mood=cb3.getValue();
            		String f=film.getText();
            		String a=artist.getText();
            		String songName=name.getText();
            		
            		String gID="";
            		String mID="";
            		String fID="";
            		String aID=""; 
           		
                    if(film.getText() == null || film.getText().trim().isEmpty())
                    	fID = "any(select distinct FilmID from FilmMakers)";
                    else
                    	fID = "(select distinct FilmID from FIlmMakers where FilmName = " +"\"" +f + "\")";
                    if(artist.getText() == null || artist.getText().trim().isEmpty())
                    	aID = "any(select distinct ArtistID from Artist)";
                	else
                		aID = "(select distinct ArtistID from Artist where ArtistName = " +"\"" +a + "\")";
                    if(genre==null || genre.equals("Any"))
                    	gID = "any(select distinct GenreID from Genre)";
                    else
                    	gID = "(select distinct GenreID from Genre where GenreName =  " + "\"" + genre + "\")";
           	        if(mood == null || mood.equals("Any"))
           	        	mID = "any(select distinct MoodID from Mood)";
           	        else
           	        	mID = "(select distinct MoodID from Mood where MoodName = " + "\"" + mood + "\")";
           	        if(language==null || language.equals("Any"))
           	        {	
	               		String [] languages = {"Hindi_Songs", "English_Songs", "Korean_Songs", "Punjabi_Songs", "Gujrati_Songs"};
	               		String [] q = new String[5];
	               		songName = "\"" + songName +"\"";
	               		
	               		for(int i=0;i<5;i++)
	               		{
	               			if(name.getText() == null || name.getText().trim().isEmpty()) 
	               				songName = "any(select distinct SongName from " + languages[i] +")"; 
	               			 
	               			q[i] = "select * from " +languages[i]+" where SongName = " + songName + " and ArtistID = " + aID + " and MoodID = " + mID + " and GenreID = "+ gID + " and FilmID = " + fID;
	               		}
	               		query = q[0] + " union " + q[1] + " union " +q[2]+" union "+q[3]+" union "+q[4]+";";
	               		System.out.println(query);
           	        }
           	        else
           	        {
           	        	if(name.getText() == null || name.getText().trim().isEmpty()) 
           	        		songName = "any(select distinct SongName from " + language + "_Songs)"; 
           	        	else
           	        		songName = "\"" + songName +"\"";
           			 
           	        	query = "select * from " +language + "_Songs"+" where SongName = " + songName + " and ArtistID = " + aID + " and MoodID = " + mID + " and GenreID = "+ gID + " and FilmID = " + fID +";" ;  
           	        	System.out.println(query);	           
           	        }
               	
           	        ResultSet rs=stmt.executeQuery(query);
           	        new musiclibrary(rs,language,userID,"filmmaker").start(primaryStage);
                
            	} 	catch (Exception w) {
               	System.out.println(w.toString());
               }            	
            }  
        };   
        btn.setOnAction(event);
             
        grid.setStyle("-fx-background-image: url('https://www.infogate.cl/wp-content/uploads/2015/12/mus-1024x680.jpg')");
        grid.getChildren().addAll(namel,name,langl,cb1,genl,cb2,moodl,cb3,filml,film,artistl,artist,btn);
               
        GridPane g2=new GridPane();
        g2.setPadding(new Insets(130,200,0,50)); // top,right,bottom,left
        g2.setVgap(20);    
        g2.setHgap(20);   
        Button profile=new Button();
        profile.setText("My Profile");
        profile.setMinSize(160,70); 
        GridPane.setConstraints(profile,0,0);
        profile.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
        EventHandler<ActionEvent> event1=new EventHandler<ActionEvent>() {
            public void handle(ActionEvent e) 
            { 
            	try
            	{
            		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spo","root","Maeve@123");
            		Statement sta=con.createStatement();
              		String q="select * from FilmMakers where FilmMakerID = "+Integer.toString(userID);
              		ResultSet rs=sta.executeQuery(q);
              		
            		new filmprofile(rs).start(primaryStage); 
            	} 
            	catch (Exception w) {
                	System.out.println(w.toString());  
                }       
            }
        };  
        profile.setOnAction(event1);
        
        Button bio=new Button();
        bio.setText("Change Decsription");  
        bio.setMinSize(160,70);
        GridPane.setConstraints(bio,0,2);
        bio.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
        EventHandler<ActionEvent> event2=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e)  
            { 
            	try {
            		new UpdateFilm(userID).start(primaryStage);
				} catch (SQLException e1) {
					e1.printStackTrace(); 
				} 
            } 
        };  
        bio.setOnAction(event2); 
        
        Button mymovie=new Button();
        mymovie.setText("My movies");    
        mymovie.setMinSize(160,70); 
        GridPane.setConstraints(mymovie,0,4);
        mymovie.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
        EventHandler<ActionEvent> event3=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e)  
            { 
            	try { 
					new filmmovie(userID).start(primaryStage);
				} catch (Exception e1) {
					e1.printStackTrace();
				}   			 
            }  
        };  
        mymovie.setOnAction(event3);   
        
        Button bookedArtist=new Button();
        bookedArtist.setText("See Booked Artist");  
        bookedArtist.setMinSize(160,70); 
        GridPane.setConstraints(bookedArtist,0,6);
        bookedArtist.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
        EventHandler<ActionEvent> event4=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try {
					new BookedArtist(userID).start(primaryStage);
				} catch (Exception e1) {  
					e1.printStackTrace();
				}        			
            }   
        };  
        bookedArtist.setOnAction(event4); 
        
        Button addfilm=new Button();
        addfilm.setText("Add Film"); 
        addfilm.setMinSize(160,70); 
        GridPane.setConstraints(addfilm,0,8);
        addfilm.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
        EventHandler<ActionEvent> event5=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try {
					new AddFilm(userID).start(primaryStage);
				} catch (Exception e1) {
					e1.printStackTrace(); 
				}        			
            }  
        };  
        addfilm.setOnAction(event5);
        
        Button out=new Button();
        out.setText("Sign Out");  
        out.setMinSize(160,70);
        GridPane.setConstraints(out,0,10);  
        out.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif"); 
        EventHandler<ActionEvent> event6=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e)   
            {    
            	try {
					new mainpage().start(primaryStage);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
            }
        };  
        out.setOnAction(event6);
        
        g2.setStyle("-fx-background-image: url('https://www.infogate.cl/wp-content/uploads/2015/12/mus-1024x680.jpg')");
        g2.getChildren().addAll(profile,bio,mymovie,bookedArtist,addfilm,out); 
        HBox hBox=new HBox();
        hBox.getChildren().addAll(grid,g2);
       
        Scene scene=new Scene(hBox,1200,900);
		primaryStage.setScene(scene);
        primaryStage.show(); 
    }
}

