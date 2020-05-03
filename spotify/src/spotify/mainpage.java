package spotify;

import javafx.event.ActionEvent; 
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.application.Application;  
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;  

public class mainpage extends Application 
{  		  
    @Override     
    public void start (Stage primaryStage) throws Exception { 
    	 
    	primaryStage.setTitle("MUSIFY");
    	GridPane grid=new GridPane(); 
        grid.setPadding(new Insets(100,0,0,290)); // top,right,bottom,left 
        grid.setVgap(60);
        grid.setHgap(20);   
        
        String w="-fx-font-weight: bolder; -fx-background-color: #000000; -fx-text-fill: #FFFFFF; -fx-font: 35px sans-serif";
        Button welcome = new Button();
        welcome.setText("Welcome to Musify");
        welcome.setStyle(w);
    	welcome.setMinSize(60,40);
     
        String f="-fx-font-weight: bolder; -fx-text-fill: #0000ff; -fx-font: 25px sans-serif";
    	Button b1=new Button();
    	b1.setText("Sign In as User");
    	b1.setMinSize(320,70);
        GridPane.setConstraints(b1,0,0);
        b1.setStyle(f);
    	
        Button b2=new Button(); 
    	b2.setText("Sign In as Artist");
    	b2.setMinSize(320,70);
        GridPane.setConstraints(b2,0,1);
        b2.setStyle(f);
    	
        Button b3=new Button(); 
    	b3.setText("Sign In as Film Maker");
    	b3.setMinSize(320,70);
        GridPane.setConstraints(b3,0,2);
        b3.setStyle(f);
        
        Button b4=new Button();
    	b4.setText("Create Account");
    	b4.setMinSize(320,70);
        GridPane.setConstraints(b4,0,3);
        b4.setStyle(f);
        
        Button admin=new Button();
    	admin.setText("Check App Details");
    	admin.setMinSize(320,70);
        GridPane.setConstraints(admin,0,4);
        admin.setStyle(f);
         
        Button b5=new Button();
    	b5.setText("Exit");
    	b5.setMinSize(320,70);
        GridPane.setConstraints(b5,0,5);
        b5.setStyle(f);    	
        
        EventHandler<ActionEvent> event1 = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	new loginuser().start(primaryStage); 
            } 
        };         
        b1.setOnAction(event1);
        
        EventHandler<ActionEvent> event2 = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e)  
            { 
            	new loginartist().start(primaryStage);
            }  
        };         
        b2.setOnAction(event2); 
        
        EventHandler<ActionEvent> event3 = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	new loginfilm().start(primaryStage); 
            }  
        };         
        b3.setOnAction(event3); 
        
        EventHandler<ActionEvent> event4 = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	new signup().start(primaryStage); 
            } 
        };
        b4.setOnAction(event4);
        
        EventHandler<ActionEvent> app = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	new AdminLogin().start(primaryStage);
            } 
        }; 
        admin.setOnAction(app);
         
        EventHandler<ActionEvent> event5 = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            {  
            	primaryStage.close();
            } 
        }; 
        b5.setOnAction(event5); 
         
        //grid.setStyle("-fx-background-image: url('https://i.pinimg.com/736x/4f/eb/9f/4feb9f5f60c5d0b87051473951456e37.jpg')");
        grid.setStyle("-fx-background-image: url('https://i.pinimg.com/736x/4f/eb/9f/4feb9f5f60c5d0b87051473951456e37.jpg')");
        grid.getChildren().addAll(welcome,b1,b2,b3,b4,admin,b5);
        Scene scene=new Scene(grid,900,900);
		primaryStage.setScene(scene);	
        primaryStage.show(); 
         
    }  
    
    public static void main(String[] args) {  
        launch(args); 
    }   
      
}

  	