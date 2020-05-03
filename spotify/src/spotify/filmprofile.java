package spotify;

import java.sql.ResultSet;
import java.sql.SQLException;
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
 
public class filmprofile extends Application {
	
	ResultSet table;
	 
	filmprofile(ResultSet rs) 
	{  
		table=rs; 
	}
	
	public static void main(String[] args) { 
        launch(args);  
    }
   
    @Override
    public void start(Stage primaryStage) throws SQLException {
        primaryStage.setTitle("My Profile");
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
        
        table.next();
         
        textArea.appendText("Film Maker ID: "+table.getString(1)+"\n");  
        textArea.appendText("Film Maker Name: "+table.getString(2)+"\n"); 
        textArea.appendText("Login ID: "+table.getString(3)+"\n");
        textArea.appendText("Password: "+table.getString(4)+"\n"); 
        textArea.appendText("Film Name: "+table.getString(5)+"\n");
        textArea.appendText("Film ID: "+table.getString(6)+"\n");
        textArea.appendText("Film Description: "+table.getString(7)+"\n");
        
        EventHandler<ActionEvent> event=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e)  
            { 
            	try {
					new filmpage(table.getInt(1)).start(primaryStage);
				} catch (SQLException e1) {
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
