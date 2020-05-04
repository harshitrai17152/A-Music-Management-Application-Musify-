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
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
 
public class UserFavSong extends Application {

	int userID;
	 
	UserFavSong(int id)
	{ 
//		songid=rs; 
		userID = id;
	}

	public static void main(String[] args) {
        launch(args);
    } 
   
    @Override
    public void start(final Stage primaryStage) throws SQLException {
        primaryStage.setTitle("Favourite Song");
        Pane root=new Pane(); 
        Button btn=new Button();
        btn.setText("BACK");
        btn.setMinSize(160,70); 
        btn.setLayoutX(180); 
        btn.setLayoutY(350);
//        btn.setMinSize(100,70);
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
        
        TextArea textArea=new TextArea();

//        text.setStyle("-fx-font-weight:bold");
        textArea.setMaxSize(450,300); 
        textArea.setLayoutX(20);
        textArea.setLayoutY(20);
        
        textArea.setStyle("-fx-font-weight:bold; -fx-text-fill:black");
//        textArea.setLayoutX(1000);  
//        textArea.setLayoutY(1000); 
//        textArea.setMinSize(1000,1000);
        
        
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Musify","root","sql@iiitdelhi");
		Statement sta=con.createStatement();
		String [] languages = {"Hindi_Songs", "English_Songs", "Korean_Songs", "Punjabi_Songs", "Gujrati_Songs"};
		String q="(select SongID from Favorite_Songs where UserID = " + userID +")";
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
                textArea.appendText("\n");
//                textArea.appendText("\n");
//                textArea.appendText("\n");

        } 
        
		EventHandler<ActionEvent> event=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try {
					new UserPage(userID).start(primaryStage);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
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