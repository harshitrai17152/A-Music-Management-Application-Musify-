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
import javafx.scene.control.TextArea;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.CornerRadii;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
 
public class userlastplay extends Application {
	
	int userID;
	userlastplay(int id)
	{ 
		userID=id;
	}
	
	public static void main(String[] args) {
        launch(args);
    } 
   
    @Override
    public void start(Stage primaryStage) throws SQLException {
        primaryStage.setTitle("Last Listened Song");
        Pane root=new Pane();  
        Button btn=new Button();
        btn.setText("BACK");
        btn.setMinSize(160,70); 
        btn.setLayoutX(180);
        btn.setLayoutY(350); 
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
  
        TextArea textArea=new TextArea();
        textArea.setMaxSize(450,300); 
        textArea.setLayoutX(20);
        textArea.setLayoutY(20);
        
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spo","root","Maeve@123");
        Statement sta=con.createStatement();
		String [] languages = {"Hindi_Songs", "English_Songs", "Korean_Songs", "Punjabi_Songs", "Gujrati_Songs"};
		String q="(select SongID from Songs_Listened where UserID = " + userID +")";
		String [] qe = new String[5];
   		for(int i=0;i<5;i++)
   		{
   			qe[i] = "select * from " + languages[i] + " where SongID in " + q;
   		}
   		String q2 = qe[0] + " union " + qe[1] + " union " +qe[2]+" union "+qe[3]+" union "+qe[4]+";";
		System.out.println(q2);
		ResultSet rs=sta.executeQuery(q2);
		while(rs.next()) 
        {
                textArea.appendText("Song Name: "+rs.getString(2)+"\n"); 
                textArea.appendText("Artist Name: "+rs.getString(4)+"\n");
                textArea.appendText("Release Date: "+rs.getString(6)+"\n");
                textArea.appendText("Rating: "+rs.getString(7)+"\n");
                textArea.appendText("Genre ID: "+rs.getString(9)+"\n");
                textArea.appendText("Mood ID: "+rs.getString(10)+"\n");
                textArea.appendText("Film ID: "+rs.getString(11)+"\n");
        }
        
		EventHandler<ActionEvent> event=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	new songscreen(userID).start(primaryStage);
            } 
        }; 
        btn.setOnAction(event);
            
        BackgroundFill background_fill = new BackgroundFill(Color.BLACK, CornerRadii.EMPTY, Insets.EMPTY); 
        Background background = new Background(background_fill);
        root.setBackground(background);
        root.getChildren().addAll(textArea,btn);
        primaryStage.setScene(new Scene(root,500,500));
        primaryStage.show();
    }
}
