package spotify;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
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
 public class artistsongs extends Application {
	
	 int artistID;
	 
		artistsongs(int id)
		{ 
			artistID=id;
		}

	public static void main(String[] args) {  
        launch(args);
    } 
   
    @Override 
    public void start(Stage primaryStage) throws SQLException {
        primaryStage.setTitle("My Songs");
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
		lv.setPrefWidth(400);
		lv.setPrefHeight(250);  
		GridPane.setConstraints(lv,0,1);
		
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spo","root","Maeve@123");
		Statement sta=con.createStatement();
		String q="select * from English_songs union select * from Hindi_songs union select * from Punjabi_songs union select * from Korean_songs union select * from Gujrati_songs";
		System.out.println(q);
		ResultSet rs=sta.executeQuery(q);   
		while(rs.next())  
        {  
        	if(rs.getInt(3)==artistID)
        		lv.getItems().add(rs.getString(2)+"      --      "+rs.getString(4)+"      --      "+rs.getString(6)+"      --      "+rs.getString(7));
        } 
		 
		EventHandler<ActionEvent> event=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	new artistpage(artistID).start(primaryStage);
            } 
        }; 
        btn.setOnAction(event);
        
        grid.setStyle("-fx-background-image: url('https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-cool-black-background-promotion-main-map-image_188883.jpg')");
	    grid.getChildren().addAll(lv,btn);
	    Scene scene=new Scene(grid,700,700);
		primaryStage.setScene(scene);	 
	    primaryStage.show();
    }
}
