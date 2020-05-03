package spotify;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;
import java.sql.*;

 
public class BonusRecommendation extends Application {
	
	int userID;
	public BonusRecommendation(int id)
	{
		userID=id;
	}
    public static void main(String[] args) {
        launch(args);
    } 
    
    @Override
    public void start(final Stage primaryStage) { 
        primaryStage.setTitle("Recommendations");   
        
        GridPane grid=new GridPane();
        grid.setPadding(new Insets(100,0,0,60)); // top,right,bottom,left
        grid.setVgap(20); 
        grid.setHgap(20);         
         
        ListView<Object> lv=new ListView<Object>(); 
		lv.setPrefWidth(500);
		lv.setPrefHeight(300);  
		GridPane.setConstraints(lv,0,0);
		
        try
        {
	        Class.forName("com.mysql.cj.jdbc.Driver");  
	
	        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spo","root","Maeve@123");
			Statement stmt=con.createStatement();  
	        String userFavSongs= "(select SongID from Favorite_Songs where userID = " + userID+")";
	        String matchingUser = "(select UserID from Favorite_Songs where songID in " + userFavSongs+")";
	        String matchingArtist = "select ArtistID from English_Songs where SongID in ("+userFavSongs+") union " +"select ArtistID from Hindi_Songs where SongID in ("+userFavSongs+") union "+"select ArtistID from Punjabi_Songs where SongID in ("+userFavSongs+") union "+"select ArtistID from Korean_Songs where SongID in ("+userFavSongs+") union "+"select ArtistID from Gujrati_Songs where SongID in ("+userFavSongs+")";
	       
	        String songQuery1 = "select SongID from Favorite_Songs where userID in " + matchingUser;
	        String songQuery2 = "select SongID from English_Songs where ArtistID in ("+matchingArtist+") union " +"select SongID from Hindi_Songs where ArtistID in ("+matchingArtist+") union "+"select SongID from Punjabi_Songs where ArtistID in ("+matchingArtist+") union "+"select SongID from Korean_Songs where ArtistID in ("+matchingArtist+") union "+"select SongID from Gujrati_Songs where ArtistID in ("+matchingArtist+")";
	        String songQuery = songQuery1 +" union "+songQuery2;
	        String query ="select SongName from English_Songs where SongID in ("+songQuery+") union " +"select SongName from Hindi_Songs where SongID in ("+songQuery+") union "+"select SongName from Punjabi_Songs where SongID in ("+songQuery+") union "+"select SongName from Korean_Songs where SongID in ("+songQuery+") union "+"select SongName from Gujrati_Songs where SongID in ("+songQuery+");"; 
	        System.out.println(query);
	        ResultSet rs=stmt.executeQuery(query);   
			while(rs.next())  
	        {  
	        	lv.getItems().add(rs.getString(1));
	        }
        }
        catch(Exception e) 
        {
        	e.printStackTrace();
        }
        
        Button bk=new Button(); 
        bk.setText("BACK");
        bk.setMinSize(150,70); 
        GridPane.setConstraints(bk,0,1);
        bk.setStyle("-fx-font-weight: bolder; -fx-text-fill: #0000ff; -fx-font: 25px sans-serif");
        EventHandler<ActionEvent> event2=new EventHandler<ActionEvent>() {  
            public void handle(ActionEvent e)  
            { 
            	try {
					new songscreen(userID).start(primaryStage);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
            } 
        }; 
        bk.setOnAction(event2);
        		
        grid.setStyle("-fx-background-image: url('https://www.infogate.cl/wp-content/uploads/2015/12/mus-1024x680.jpg')");
        grid.getChildren().addAll(lv,bk);
        Scene scene=new Scene(grid,900,900);
		primaryStage.setScene(scene); 	
        primaryStage.show();  
    }
}
