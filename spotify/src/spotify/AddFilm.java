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
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
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
    	GridPane grid=new GridPane();
        grid.setPadding(new Insets(100,0,0,50)); // top,right,bottom,left
        grid.setVgap(20);   
        grid.setHgap(20);   
    	
        String f="-fx-text-fill: #0000ff; -fx-font: 20px Serif";
        Button btn=new Button();
        btn.setText("ADD");
        btn.setMinSize(150,50);
        btn.setStyle(f);
        GridPane.setConstraints(btn,1,2);
                 
        Label film=new Label("Film Name:");
        film.setStyle("-fx-font-weight: bolder ; -fx-text-fill: white; -fx-font:20px sans-serif");
        GridPane.setConstraints(film,0,0);  
       
        final TextField filmName = new TextField();
		filmName.setPromptText("Enter Film name");
		GridPane.setConstraints(filmName,1,0);
		
		Label desc = new Label("Film Description:");
        desc.setStyle("-fx-font-weight: bolder ; -fx-text-fill: white; -fx-font:20px sans-serif");
        GridPane.setConstraints(desc,0,1); 
        final TextField fd = new TextField();
		fd.setPromptText("Description");
		GridPane.setConstraints(fd,1,1);
		
		EventHandler<ActionEvent> event1=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e)  
            { 
            	try {
            		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spo","root","Maeve@123");
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
            		System.out.println(query);
            		sta.executeUpdate(query);
            		
					new filmpage(filmMakerID).start(primaryStage);
					
				} catch (Exception e1) { 
					e1.printStackTrace();   
				}
            } 
        }; 
        btn.setOnAction(event1);
        
        Button bk=new Button();
        bk.setText("BACK");
        bk.setMinSize(150,50); 
        bk.setStyle(f);
        GridPane.setConstraints(bk,1,3);
        EventHandler<ActionEvent> event2=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	new filmpage(filmMakerID).start(primaryStage);
            } 
        }; 
        bk.setOnAction(event2); 
               
        grid.setStyle("-fx-background-image: url('https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-cool-black-background-promotion-main-map-image_188883.jpg')");
        grid.getChildren().addAll(film,filmName,desc,fd,btn,bk);
        primaryStage.setScene(new Scene(grid,600,650));
        primaryStage.show();
    }
}