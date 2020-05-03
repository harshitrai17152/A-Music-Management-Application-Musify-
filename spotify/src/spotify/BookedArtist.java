package spotify;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class BookedArtist extends Application {
	
	int filmMakerID; 
    public BookedArtist(int id) { 
    	filmMakerID=id; 
	}
    
	public static void main(String[] args) {
		launch(args);
	}

	@Override
	public void start(final Stage primaryStage) throws Exception {
		primaryStage.setTitle("Booked Artits");
        GridPane grid=new GridPane();
        grid.setPadding(new Insets(100,0,0,60)); // top,right,bottom,left
        grid.setVgap(20); 
        grid.setHgap(20); 
        
        Button btn=new Button(); 
        btn.setText("BACK");
        btn.setMinSize(150,70);
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
        GridPane.setConstraints(btn,0,0);
                 
        ListView<Object> lv=new ListView<Object>(); 
		lv.setPrefWidth(550);
		lv.setPrefHeight(250);  
		GridPane.setConstraints(lv,0,1);
        	
		String []language = {"Hindi", "English", "Punjabi", "Gujrati", "Korean"};
		String []innerQueries = new String[5];
		for(int i=0;i<5;i++)
			innerQueries[i] = "select ArtistID from "+language[i]+"_Songs natural join FilmMakers where FilmMakerID ="+ filmMakerID; 
		String innerQuery = innerQueries[0] +" union " +innerQueries[1] +" union " +innerQueries[2] +" union " +innerQueries[3] +" union " +innerQueries[4]; 
		String outerQuery = "select ArtistID, ArtistName from Artist where ArtistID in ";
		
		String query = outerQuery+"("+innerQuery+");";
		System.out.println(query);
		Class.forName("com.mysql.cj.jdbc.Driver");   
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spo","root","Maeve@123");
		Statement stmt=con.createStatement();  
		
		ResultSet table = stmt.executeQuery(query);
		while(table.next()) 
			lv.getItems().add(table.getString(1)+"   --   "+table.getString(2));			
		
		EventHandler<ActionEvent> event=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	new filmpage(filmMakerID).start(primaryStage);
            } 
        }; 
        btn.setOnAction(event);
       
		grid.getChildren().addAll(lv,btn);
		grid.setStyle("-fx-background-image: url('https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-cool-black-background-promotion-main-map-image_188883.jpg')");
	    Scene scene=new Scene(grid,700,700);
		primaryStage.setScene(scene);	 
	    primaryStage.show();	
	}
}
