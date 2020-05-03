package spotify;

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

 
public class loginuser extends Application {
	
    public static void main(String[] args) {
        launch(args);
    } 
     
    //9dq4di056k 
    //u8cvjwzq9s
    
    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Login as an User"); 
        Button btn=new Button();
        btn.setText("SUBMIT");     
        
        String w="-fx-font-weight: bolder; -fx-background-color: #000000; -fx-text-fill: #FFFFFF; -fx-font: 30px sans-serif"; 
        Button welcome = new Button();
        welcome.setText("Sign In to Musify");  
        welcome.setStyle(w);
    	welcome.setMinSize(60,40);
         
        GridPane grid=new GridPane(); 
        grid.setPadding(new Insets(150,0,0,170)); // top,right,bottom,left 
        grid.setVgap(25);
        grid.setHgap(10);    
        
        String f="-fx-font-weight: bolder ; -fx-text-fill: white; -fx-font:40px sans-serif";
        Label namel=new Label("User Name:"); 
        namel.setStyle(f);
        GridPane.setConstraints(namel,0,1);
        
        TextField name=new TextField();
        name.setPromptText("Enter your username");
        GridPane.setConstraints(name,1,1);
        
        Label passl=new Label("Password:");
        passl.setStyle(f);
        GridPane.setConstraints(passl,0,2);
        
        PasswordField pass=new PasswordField();
		pass.setPromptText("Enter your password");
        GridPane.setConstraints(pass,1,2);
        
        btn.setMinSize(150,50);
        GridPane.setConstraints(btn,1,3);
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 17px Serif");
        	 
        EventHandler<ActionEvent> event1 = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try { 
            		String username=name.getText();
            		String password=pass.getText();
            		
            		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spo","root","Maeve@123");
            		Statement stmt=con.createStatement();  
                    String q1= "select * from User"; 
                    ResultSet rs=stmt.executeQuery(q1);
                    boolean found=false;
                    while(rs.next()) 
                    {
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
                    			new songscreen(Integer.parseInt(rs.getString(1))).start(primaryStage);
                    		break;
                    	}
                    }
                    if(!found)
                    {
                    	Alert alert = new Alert(AlertType.WARNING);
                    	alert.setTitle("Warning");
                    	alert.setHeaderText(null);
                    	alert.setContentText("User not found!");
                    	alert.showAndWait(); 
                    } 	
                } 	catch (Exception w) {
                	System.out.println(w.toString()); 
                }
            } 
        };  
        btn.setOnAction(event1);
        
        Button bk=new Button();
        bk.setText("BACK");  
        bk.setMinSize(150,50);
        GridPane.setConstraints(bk,1,4);
        bk.setStyle("-fx-text-fill: #0000ff; -fx-font: 17px Serif");
        EventHandler<ActionEvent> event2=new EventHandler<ActionEvent>() {  
            public void handle(ActionEvent e) 
            { 
            	try {
					new mainpage().start(primaryStage);
				} catch (Exception e1) {
					e1.printStackTrace();
				} 
            } 
        }; 
        bk.setOnAction(event2);
        
        grid.setStyle("-fx-background-image: url('https://www.infogate.cl/wp-content/uploads/2015/12/mus-1024x680.jpg')");
        grid.getChildren().addAll(welcome,namel,name,passl,pass,btn,bk);
        Scene scene=new Scene(grid,900,900);
		primaryStage.setScene(scene); 	
        primaryStage.show();   
    }
}

