
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
 
public class UserProfile extends Application {
	
	int userID;
	 
	UserProfile(int id)
	{ 
		userID=id; 
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
//           btn.setMinSize(100,70);
           btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
           
           TextArea textArea=new TextArea();

//           text.setStyle("-fx-font-weight:bold");
           textArea.setMaxSize(450,300); 
           textArea.setLayoutX(20);
           textArea.setLayoutY(20);
           
           textArea.setStyle("-fx-font-weight:bold; -fx-text-fill:black");
           
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Musify","root","sql@iiitdelhi");
		Statement sta=con.createStatement();
		System.out.println(userID);
		String q="select * from User where UserId = " + userID + ";";
		System.out.println(q);
		ResultSet rs=sta.executeQuery(q); 
		rs.next();
//		System.out.println(rs.getString(1));
//		System.out.println(rs.getString(2));
        
      
        
        textArea.appendText("UserID: "+rs.getString(1)+"\n");  
        textArea.appendText("User Name: "+rs.getString(2)+"\n"); 
        textArea.appendText("Login ID: "+rs.getString(3)+"\n");
        textArea.appendText("Password: "+rs.getString(4)+"\n");
        textArea.appendText("Subscription: "+rs.getString(5)+"\n");
        textArea.appendText("Followers: "+rs.getString(6)+"\n");
        textArea.appendText("Favourite Artist: "+rs.getString(7)+"\n");
        
        EventHandler<ActionEvent> event=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try {
					new UserPage(userID).start(primaryStage);
				} catch (Exception e1) {
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