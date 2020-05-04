import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;
import java.sql.*;

 
public class ArtistLogin extends Application {
	
    public static void main(String[] args) {
        launch(args);
    } 
    
    @Override
    public void start(final Stage primaryStage) {
        primaryStage.setTitle("Login");
        Button btn=new Button();
        btn.setText("SUBMIT");
        
        Button back = new Button();
        back.setText("Back");
        
        
        GridPane grid=new GridPane();
        grid.setPadding(new Insets(150,0,0,170)); // top,right,bottom,left
        grid.setVgap(20);
        grid.setHgap(10);    
        
        String w="-fx-font-weight: bolder; -fx-background-color: #000000; -fx-text-fill: #FFFFFF; -fx-font: 25px sans-serif";
        Button welcome = new Button();
        welcome.setText("Sign In to Musify");
        welcome.setStyle(w);
    	welcome.setMinSize(60,40);
        
    	
        String f="-fx-font-weight: bolder ; -fx-text-fill: white; -fx-font:20px sans-serif";
        Label namel=new Label("Login ID:");
        namel.setStyle(f);
        GridPane.setConstraints(namel,0,2);
        
        final TextField name=new TextField();
        name.setPromptText("Enter your Login ID");
        GridPane.setConstraints(name,1,2);
        
        Label passl=new Label("Password:");
        passl.setStyle(f);
        GridPane.setConstraints(passl,0,3);
        
        final PasswordField pass=new PasswordField();
		pass.setPromptText("Enter your password");
        GridPane.setConstraints(pass,1,3);
        
        btn.setMinSize(120,40);
        GridPane.setConstraints(btn,1,4);
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 17px Serif");
        
        back.setMinSize(120,40);
        GridPane.setConstraints(back,1,5);
        back.setStyle("-fx-text-fill: #0000ff; -fx-font: 17px Serif");
        	 
        EventHandler<ActionEvent> event1 = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try { 
            		String username=name.getText();
            		String password=pass.getText();
            		    	

            		Class.forName("com.mysql.cj.jdbc.Driver");  

            		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Musify","root","sql@iiitdelhi");
            		Statement stmt=con.createStatement();  
                    String q1= "select * from Artist"; 
                    ResultSet rs=stmt.executeQuery(q1);
                    boolean found=false;
                    while(rs.next()) 
                    {
//                    	System.out.println(rs.getString(3));
//                    	System.out.println(rs.getString(4));
                    	if(rs.getString(3).equals(username))
                    	{
                    		found=true;
                    		if(!rs.getString(4).equals(password))
                    		{
                    			Alert alert = new Alert(AlertType.INFORMATION);
                            	alert.setTitle("Warning");
                            	alert.setHeaderText(null);
                            	alert.setContentText("Wrong Password!");
                            	alert.showAndWait();
                    		}
                    		else
                    			
                    			new ArtistPage(Integer.parseInt(rs.getString(1))).start(primaryStage);
                    		break;
                    	}
                    }
                    if(!found)
                    {
                    	Alert alert = new Alert(AlertType.WARNING);
                    	alert.setTitle("Warning");
                    	alert.setHeaderText(null);
                    	alert.setContentText("Artist not found!");
                    	  alert.showAndWait();
                    }
                    	
                   	
                } 	catch (Exception w) {
                	System.out.println(w.toString()); 
                }
            } 
        };  
        btn.setOnAction(event1);
              
        EventHandler<ActionEvent> event2 = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	new play().start(primaryStage);
            } 
        };  
        back.setOnAction(event2);
        grid.setStyle("-fx-background-image: url('https://www.infogate.cl/wp-content/uploads/2015/12/mus-1024x680.jpg')");
        grid.getChildren().addAll(namel,name,passl,pass,btn, welcome,back);
        Scene scene=new Scene(grid,900,900);
		primaryStage.setScene(scene); 	
        primaryStage.show();  
    }
}
