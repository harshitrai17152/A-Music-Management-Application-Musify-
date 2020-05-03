package spotify;


import java.sql.SQLException;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;
 
public class usersubs extends Application {
	
	int userID;
	 
	usersubs(int id)
	{ 
		userID=id;  
	}

	public static void main(String[] args) {
        launch(args); 
    }  
   
    @Override
    public void start(Stage primaryStage) throws SQLException {
    	primaryStage.setTitle("Change Subscription");
        Button btn=new Button();
        btn.setText("SAVE AND RETURN");
        btn.setMinSize(150,70); 
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
       
        GridPane grid=new GridPane();
        grid.setPadding(new Insets(200,0,100,50)); // top,right,bottom,left
        grid.setVgap(30); 
        grid.setHgap(20);    
        
        String f="-fx-font-weight: bolder ; -fx-text-fill: white; -fx-font:30px sans-serif";
        Label idl=new Label("Bank name:"); 
        GridPane.setConstraints(idl,0,0); 
        idl.setStyle(f);
        TextField id=new TextField(); 
		id.setPromptText("Enter your bank name");
        GridPane.setConstraints(id,1,0);
        
        Label namel=new Label("Card Number:");
        namel.setStyle(f);
        GridPane.setConstraints(namel,0,1);
        PasswordField name=new PasswordField();         
        name.setPromptText("Enter your card number");
        GridPane.setConstraints(name,1,1);
        
        Label accl=new Label("Account Number:");
        accl.setStyle(f);
        GridPane.setConstraints(accl,0,2);
        TextField acc=new TextField();         
        acc.setPromptText("Enter your account number");
        GridPane.setConstraints(acc,1,2);
        
        Label typel=new Label("Subscription Duration:");
        typel.setStyle(f);
        GridPane.setConstraints(typel,0,3);              
        ChoiceBox<String> cb1=new ChoiceBox<String>();
        cb1.getItems().addAll("1 Month","6 Months","1 Year");
        GridPane.setConstraints(cb1,1,3);  
           
        btn.setMinSize(200,80); 
        GridPane.setConstraints(btn,1,4);
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 25px Serif");   
        
        EventHandler<ActionEvent> event=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try 
            	{
            		new songscreen(userID).start(primaryStage);
            	}
            	catch (Exception w) {  
            		System.out.println(w.toString());  
            	}
            } 
        }; 
        btn.setOnAction(event); 
        
        grid.setStyle("-fx-background-image: url('https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-cool-black-background-promotion-main-map-image_188883.jpg')");
        grid.getChildren().addAll(idl,id,namel,name,accl,acc,typel,cb1,btn);
        Scene scene=new Scene(grid,700,700);
        primaryStage.setScene(scene);
        primaryStage.show(); 
    }
}
