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

 public class ArtistSongs extends Application {
	
	int artistID;
	 
	ArtistSongs(int id)
	{ 
		artistID=id;
	}

	public static void main(String[] args) { 
        launch(args);
    } 
   
    @Override
    public void start(final Stage primaryStage) throws SQLException {
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
		
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Musify","root","sql@iiitdelhi");
		Statement sta=con.createStatement();
		String q="select * from English_Songs where ArtistID = " + artistID+ " union " +"select * from Hindi_Songs where ArtistID = " + artistID+ " union " +"select * from Punjabi_Songs where ArtistID = " + artistID+ " union " +"select * from Korean_Songs where ArtistID = " + artistID+ " union " +"select * from Gujrati_Songs where ArtistID = " + artistID+ " ;";
		ResultSet rs=sta.executeQuery(q);   
		while(rs.next())  
        {  
        	lv.getItems().add(rs.getString(2)+"      --      "+rs.getString(4)+"      --      "+rs.getString(6)+"      --      "+rs.getString(7));
        } 
		 
		EventHandler<ActionEvent> event=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try {
					new ArtistPage(artistID).start(primaryStage);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
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