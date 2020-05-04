import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Orientation;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.Separator;
import javafx.scene.control.TextField;
import javafx.scene.control.ToolBar;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

public class BookedArtist extends Application {
	
	int filmMakerID; 
    public BookedArtist(int id) { 
    	filmMakerID = id;
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
        
        final ListView<Object> lv=new ListView<Object>(); 
		lv.setPrefWidth(600);
		lv.setPrefHeight(300);
		GridPane.setConstraints(lv,0,0);
		
		String []language = {"Hindi", "English", "Punjabi", "Gujrati", "Korean"};
		String []innerQueries = new String[5];
		for(int i=0;i<5;i++)
		{
			innerQueries[i] = "select ArtistID from "+language[i]+"_Songs natural join FilmMakers where FilmMakerID ="+ filmMakerID; 
		}
		String innerQuery = innerQueries[0] +" union " +innerQueries[1] +" union " +innerQueries[2] +" union " +innerQueries[3] +" union " +innerQueries[4]; 
		String outerQuery = "select ArtistID, ArtistName from Artist where ArtistID in ";
		
		String query = outerQuery+"("+innerQuery+");";
		System.out.println(query);
		Class.forName("com.mysql.cj.jdbc.Driver");  

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Musify","root","sql@iiitdelhi");
		Statement stmt=con.createStatement();  
		
		ResultSet table = stmt.executeQuery(query);
		while(table.next()) 
        { 
			 lv.getItems().add(table.getString(1)+"   --   "+table.getString(2));			 
        }
		grid.getChildren().add(lv);
		grid.setStyle("-fx-background-image: url('https://cdn.hipwallpaper.com/i/73/52/e0Q23r.jpg')");
		Scene scene=new Scene(grid,1000,1000);
		primaryStage.setScene(scene);	
	    primaryStage.show();
	}
	}