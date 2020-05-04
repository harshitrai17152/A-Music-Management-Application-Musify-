
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontPosture;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;
import javafx.stage.Stage;
 
public class AddFilm extends Application {
	
	int filmMakerID;
	 
	AddFilm(int id)
	{ 
		filmMakerID = id; 
	}

	public static void main(String[] args) {
        launch(args);
    }  
   
    @Override
    public void start(final Stage primaryStage) throws SQLException {
    	primaryStage.setTitle("Add Film");
        Button btn=new Button();
        btn.setText("Add");
        btn.setMinSize(100,70);
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
        
        GridPane grid=new GridPane();
        grid.setPadding(new Insets(100,0,0,50)); // top,right,bottom,left
        grid.setVgap(20);   
        grid.setHgap(20);     
         
        String f="-fx-font-weight: bolder ; -fx-text-fill: white; -fx-font:20px sans-serif";
        
        Label film=new Label("Film Name:");
        film.setStyle(f);
        GridPane.setConstraints(film,0,0);  
       
        final TextField filmName = new TextField();
		filmName.setPromptText("Enter Film name");
		GridPane.setConstraints(filmName,1,0);
		
		Label desc = new Label("Film Description:");
        desc.setStyle(f);
        GridPane.setConstraints(desc,0,2); 
        final TextField fd = new TextField();
		fd.setPromptText("Description");
		GridPane.setConstraints(fd,1,2);
		
		EventHandler<ActionEvent> event1=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e)  
            { 
            	try {
            		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Musify","root","sql@iiitdelhi");
            		Statement sta=con.createStatement();
            		String q1= "SELECT FilmID FROM FilmMakers WHERE FilmID=(SELECT max(FilmID) FROM FilmMakers);"; 
            		ResultSet rs=sta.executeQuery(q1);
        	        rs.next();
        	        int filmID = Integer.parseInt(rs.getString(1)) +1;
        	        
        	        q1 = "Select * from FilmMakers where FilmMakerID = "+filmMakerID +";";
        	        rs = sta.executeQuery(q1);
        	        rs.next();
        	        
        	        String filmMakerName = rs.getString(2);
        	        String loginID = rs.getString(3);
        	        String pass = rs.getString(4);
        	        
            		String query = "Insert into FilmMakers values(" + filmMakerID + ",\"" + filmMakerName + "\",\"" + loginID +"\",\""+pass+"\",\""+filmName.getText() +"\","+ filmID+",\"" +fd.getText() + "\");" ;
//            		String q="select * from English_Songs where ArtistID = " + artistID+ " union " +"select * from Hindi_Songs where ArtistID = " + artistID+ " union " +"select * from Punjabi_Songs where ArtistID = " + artistID+ " union " +"select * from Korean_Songs where ArtistID = " + artistID+ " union " +"select * from Gujrati_Songs where ArtistID = " + artistID+ " ;";
            		System.out.println(query);
            		sta.executeUpdate(query);
//            		ResultSet artistSongs = sta.executeQuery(q);
//            		
					new FilmMakerPage(filmMakerID).start(primaryStage);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
            } 
        }; 
        btn.setOnAction(event1);
                
        GridPane.setConstraints(btn,1,3);
        grid.setStyle("-fx-background-image: url('https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-cool-black-background-promotion-main-map-image_188883.jpg')");
        grid.getChildren().addAll(btn, film , filmName, desc, fd);
        primaryStage.setScene(new Scene(grid,600,650));
        primaryStage.show();
    }
}