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
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;


public class AdminLogin extends Application {
	
    public static void main(String[] args) {
        launch(args);
    }   
    
    @Override
    public void start(final Stage primaryStage) { 
    	
    	final String AdminPassKey="Admin@Musify";   
    	
        primaryStage.setTitle("Login as Administration"); 
        Button btn=new Button(); 
        btn.setText("SUBMIT");
        
        Button back = new Button();
        back.setText("Back");
                
        GridPane grid=new GridPane();
        grid.setPadding(new Insets(130,0,0,170)); // top,right,bottom,left
        grid.setVgap(20);
        grid.setHgap(5);     
        
        String w="-fx-font-weight: bolder; -fx-background-color: #000000; -fx-text-fill: #FFFFFF; -fx-font: 35px sans-serif";
        Button welcome = new Button();
        welcome.setText("Verify Credentials"); 
        welcome.setStyle(w);
    	welcome.setMinSize(60,40);
          	
    	String f="-fx-font-weight: bolder ; -fx-text-fill: white; -fx-font:50px sans-serif";
        Label namel=new Label("Pass Key:"); 
        namel.setStyle(f);
        GridPane.setConstraints(namel,0,2);
        
        final PasswordField name=new PasswordField();
        name.setPromptText("Enter your PassKey");
        GridPane.setConstraints(name,1,2);
        
        btn.setMinSize(150,70);
        GridPane.setConstraints(btn,1,4);
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 17px Serif");
        
        back.setMinSize(150,70);
        GridPane.setConstraints(back,1,5);
        back.setStyle("-fx-text-fill: #0000ff; -fx-font: 17px Serif");
        	 
        EventHandler<ActionEvent> event1 = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try { 
            		String username=name.getText();
            		if(username.equals(AdminPassKey))
            			new AdminPage().start(primaryStage);
            		else
            		{
            			Alert alert = new Alert(AlertType.INFORMATION);
                    	alert.setTitle("Warning");
                    	alert.setHeaderText(null);
                    	alert.setContentText("Not an Admin!");
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
            	try {
					new mainpage().start(primaryStage);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
            } 
        };  
        back.setOnAction(event2);
        
        grid.setStyle("-fx-background-image: url('https://www.infogate.cl/wp-content/uploads/2015/12/mus-1024x680.jpg')");
        grid.getChildren().addAll(namel,name,btn,welcome,back);
        Scene scene=new Scene(grid,900,900);
		primaryStage.setScene(scene); 	
        primaryStage.show();  
    }
}
