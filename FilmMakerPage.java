
            	//FIlmMakerID-cqcfpfxwn
            	//Password- snkfvwvok

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Orientation;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.Separator;
import javafx.scene.control.TextField;
import javafx.scene.control.ToolBar;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

public class FilmMakerPage extends Application {
	
	int userID; 
    public FilmMakerPage(int id) { 
    	userID = id;
	}
    
	public static void main(String[] args) {
		launch(args);
	}

	@Override
	public void start(final Stage primaryStage) throws Exception {
		
		GridPane grid = new GridPane();
		grid.setPadding(new Insets(100,200,0,60));
        grid.setVgap(20);
        grid.setHgap(10); 
        
        String f="-fx-font-weight: bolder ; -fx-text-fill: white; -fx-font:20px sans-serif";
        
        Label searchSong = new Label("Search Song");
        searchSong.setStyle(f);
        GridPane.setConstraints(searchSong,10,0);
        
		final TextField search = new TextField();
		search.setPromptText("Enter Song name");
		GridPane.setConstraints(search,11,0);
		
		
		Label lang=new Label("Language:");
        lang.setStyle(f);
        GridPane.setConstraints(lang,10,1);            
        final ChoiceBox<String> cb1=new ChoiceBox<String>();
        cb1.getItems().addAll("English","Hindi","Punjabi","Korean","Gujrati","Any");
        GridPane.setConstraints(cb1,11,1);  
        
        Label genre=new Label("Genre:");
        genre.setStyle(f);
        GridPane.setConstraints(genre,10,2);            
        final ChoiceBox<String> cb2=new ChoiceBox<String>();
        cb2.getItems().addAll("Pop","Rock","Hip-Hop","R&B","Electronic","Classic","Country","Jazz","Romance","Any");
        GridPane.setConstraints(cb2,11,2);  
        
        Label mood=new Label("Mood:");
        mood.setStyle(f);
        GridPane.setConstraints(mood,10,3);        
        final ChoiceBox<String> cb3=new ChoiceBox<String>();
        cb3.getItems().addAll("Happy","Dance","Romantic","Meloncholy","Energetic","Romantic","Any");
        GridPane.setConstraints(cb3,11,3);
       
        Label filml = new Label("Film:");
        filml.setStyle(f);
        GridPane.setConstraints(filml,10,4); 
        final TextField film = new TextField();
		film.setPromptText("Choose Film");
		GridPane.setConstraints(film,11,4);  
		
		Label artistl = new Label("Artist:");
        artistl.setStyle(f);
        GridPane.setConstraints(artistl,10,5);
		final TextField artist = new TextField();
		artist.setPromptText("Choose Artist");
		artist.setStyle("-fx-text-fill: #000000");
		GridPane.setConstraints(artist,11,5);  
    
    	
    	Button searchButton=new Button();
    	searchButton.setText("Search");
    	searchButton.setStyle("-fx-text-fill: #0000ff; -fx-font: 17px Serif");
    	GridPane.setConstraints(searchButton,11,7);
    	
    	
    	Button back=new Button();
    	back.setText("Sign Out");
    	back.setStyle("-fx-text-fill: #0000ff; -fx-font: 17px Serif");
    	GridPane.setConstraints(back,11,8);
    	
   
    	grid.getChildren().addAll(searchSong, lang, film, artist, mood, genre, search, cb1,cb2,cb3, filml, artistl, back, searchButton);
    	grid.setStyle("-fx-background-image: url('https://cdn.hipwallpaper.com/i/73/52/e0Q23r.jpg')");
    	
    	
    	   EventHandler<ActionEvent> searchEvent=new EventHandler<ActionEvent>() { 
               public void handle(ActionEvent e) 
               { 
               	try { 
               		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Musify","root","sql@iiitdelhi");
               		Statement stmt=con.createStatement();  
               		
               		String query = "";
               		
               		String language=cb1.getValue(); 
                   	String genre=cb2.getValue();
                   	String mood=cb3.getValue();
               		String f = film.getText();
               		String a = artist.getText();
               		
               		String gID = "";
               		String mID = "";
               		String fID = "";
               		String aID = "";
               		
                   	String songName = search.getText();
                   	
                    if(film.getText() == null || film.getText().trim().isEmpty())
                    {
//                    	f = "any(select distinct FilmName from FilmMakers)";
                    	fID = "any(select distinct FilmID from FilmMakers)";
                    }
                    else
                    {
                    	fID = "(select distinct FilmID from FilmMakers where FilmName = " +"\"" +f + "\")";
                    }
                    if(artist.getText() == null || artist.getText().trim().isEmpty())
                    {
                    	aID = "any(select distinct ArtistID from Artist)";
                    	
                    }
                    else
                    {
                    	aID = "(select distinct ArtistID from Artist where ArtistName = " +"\"" +a + "\")";
                    }
               		if(genre==null || genre.equals("Any"))
                    {
//                    	genre = "any(select distinct GenreName from Genre)";
                    	gID = "any(select distinct GenreID from Genre)";
                    }
               		else
               		{
               			gID = "(select distinct GenreID from Genre where GenreName =  " + "\"" + genre + "\")";
               		}
                    if(mood == null || mood.equals("Any"))
                    {
//                    	mood = "any(select distint MoodName from Mood";	
                    	mID = "any(select distinct MoodID from Mood)";
                    }
                    else
                    {
                    	mID = "(select distinct MoodID from Mood where MoodName = " + "\"" + mood + "\")";
                    }
                   	if(language==null || language.equals("Any"))
                   	{
                   		String [] languages = {"Hindi_Songs", "English_Songs", "Korean_Songs", "Punjabi_Songs", "Gujrati_Songs"};
                   		String [] q = new String[5];
                   		
                   		for(int i=0;i<5;i++)
                   		{
                   			if(search.getText() == null || search.getText().trim().isEmpty()) 
                       		{
                                songName = "any(select distinct SongName from " + languages[i] +")"; 
                            }
                   			else
                   			{
                   				songName = "\"" + songName +"\"";
                   			}
                   			q[i] = "select * from " +languages[i]+" where SongName = " + songName + " and ArtistID = " + aID + " and MoodID = " + mID + " and GenreID = "+ gID + " and FilmID = " + fID; 
                   		}
                   		query = q[0] + " union " + q[1] + " union " +q[2]+" union "+q[3]+" union "+q[4]+";";
                   		System.out.println(query);
                        
                   	}
                   	else
                   	{
                   		if(search.getText() == null || search.getText().trim().isEmpty()) 
                   		{
                            songName = "any(select distinct SongName from " + language + "_Songs)"; 
                        }
                   		else
               			{
               				songName = "\"" + songName +"\"";
               			}
                   		query = "select * from " +language + "_Songs"+" where SongName = " + songName + " and ArtistID = " + aID + " and MoodID = " + mID + " and GenreID = "+ gID + " and FilmID = " + fID +";" ;  
                   		System.out.println(query);	           
                   	}
                   	

                    ResultSet rs=stmt.executeQuery(query);
                    new musiclibrary(rs, language, userID).start(primaryStage);
                    
                   } 	catch (Exception w) {
                   	System.out.println(w.toString());
                   }            	
               } 
           };   
           searchButton.setOnAction(searchEvent);
           
          EventHandler<ActionEvent> so = new EventHandler<ActionEvent>() { 
              public void handle(ActionEvent e) 
              { 
              	new play().start(primaryStage);
              } 
          }; 
          back.setOnAction(so);
    	
          GridPane g2=new GridPane();
          g2.setPadding(new Insets(80,200,0,50)); // top,right,bottom,left
          g2.setVgap(20);    
          g2.setHgap(20);   
          Button profile=new Button();
          profile.setText("My Profile");
          profile.setMinSize(100,70);
          GridPane.setConstraints(profile,0,0);
          profile.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
          EventHandler<ActionEvent> event1=new EventHandler<ActionEvent>() { 
              public void handle(ActionEvent e) 
              { 
              	try
              	{
              		
              		new FilmMakerProfile(userID).start(primaryStage);
//              	 
              	}  
              	catch (Exception w) {
                  	System.out.println(w.toString());  
                  }      
              }
          };  
          profile.setOnAction(event1);
          
          Button bio=new Button();
          bio.setText("Update Film Description");
          bio.setMinSize(100,70);
          GridPane.setConstraints(bio,0,2);
          bio.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
          EventHandler<ActionEvent> event2=new EventHandler<ActionEvent>() { 
              public void handle(ActionEvent e)  
              { 
              	try {
  					new UpdateFilm(userID).start(primaryStage);
  				} catch (Exception e1) {
  					e1.printStackTrace();
  				} 
              }   
              //tvoyrgpiw  
          	//kbmiaczcm
          };  
          bio.setOnAction(event2);  
          
          Button mysong=new Button();
          mysong.setText("Add Film"); 
          mysong.setMinSize(100,70); 
          GridPane.setConstraints(mysong,0,4);
          mysong.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
          EventHandler<ActionEvent> event3=new EventHandler<ActionEvent>() { 
              public void handle(ActionEvent e) 
              { 
              	try {
  					new AddFilm(userID).start(primaryStage);
  				} catch (Exception e1) {
  					e1.printStackTrace();
  				}        			
              }  
          };  
          mysong.setOnAction(event3);  
          
          Button payment=new Button();
          payment.setText("My Films");  
          payment.setMinSize(100,70); 
          GridPane.setConstraints(payment,0,6);
          payment.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
          EventHandler<ActionEvent> event4=new EventHandler<ActionEvent>() { 
              public void handle(ActionEvent e) 
              { 
              	try {
  					new BookArtist(userID).start(primaryStage);
  				} catch (Exception e1) { 
  					e1.printStackTrace();
  				}        			
              }  
              //tvoyrgpiw     
          	//kbmiaczcm   
          };  
          payment.setOnAction(event4);   
          
          
          Button bookedArtist=new Button();
          bookedArtist.setText("See Booked Artist");  
          bookedArtist.setMinSize(100,70); 
          GridPane.setConstraints(bookedArtist,0,7);
          bookedArtist.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
          EventHandler<ActionEvent> event5=new EventHandler<ActionEvent>() { 
              public void handle(ActionEvent e) 
              { 
              	try {
  					new BookedArtist(userID).start(primaryStage);
  				} catch (Exception e1) { 
  					e1.printStackTrace();
  				}        			
              }  
              //tvoyrgpiw     
          	//kbmiaczcm   
          };  
          bookedArtist.setOnAction(event5); 
          
          g2.setStyle("-fx-background-image: url('https://cdn.hipwallpaper.com/i/73/52/e0Q23r.jpg')");
          g2.getChildren().addAll(profile,bio,mysong,payment, bookedArtist);
          HBox hBox=new HBox();
          hBox.getChildren().addAll(g2, grid);
         
          Scene scene=new Scene(hBox,1200,900);
  		primaryStage.setScene(scene);
          primaryStage.show();
          
		
	}

}
