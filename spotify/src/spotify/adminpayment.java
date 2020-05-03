package spotify;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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


public class adminpayment extends Application { 
	
    public static void main(String[] args) {
        launch(args);
    }  
    
    @Override
    public void start(final Stage primaryStage) {
    	Stage subStage=new Stage();
		subStage.setTitle("Check Artist Payment");
        Button btn=new Button();
        btn.setText("SUBMIT");  
        btn.setMinSize(150,70); 
        GridPane.setConstraints(btn,1,1);
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 17px Serif");
        
        GridPane grid=new GridPane();
        grid.setPadding(new Insets(200,0,0,90)); // top,right,bottom,left
        grid.setVgap(20); 
        grid.setHgap(20);    
        
        String f="-fx-font-weight: bolder ; -fx-text-fill: white; -fx-font:30px sans-serif";
        Label idl=new Label("Artist ID:"); 
        GridPane.setConstraints(idl,0,0);   
        idl.setStyle(f);
        TextField id=new TextField(); 
		id.setPromptText("Enter Artist ID");
        GridPane.setConstraints(id,1,0);
        
        TextField pay=new TextField(); 
        GridPane.setConstraints(pay,1,3);
    	
        EventHandler<ActionEvent> event1=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try{ 
            		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spo","root","Maeve@123");
            		Statement stmt=con.createStatement();  
                    String q1= "select * from artist"; 
                    ResultSet rs=stmt.executeQuery(q1); 
                    
                    while(rs.next())   
                    {
                    	if(rs.getString(1).equals(id.getText()))
                    		pay.setText("Total Payment: "+rs.getString(8));
                    }
                } 	catch (Exception w) { 
                	System.out.println(w.toString());  
                }
            } 
        }; 
        btn.setOnAction(event1);
           	
        Button bk=new Button();
        bk.setText("BACK");  
        bk.setMinSize(150,70);
        GridPane.setConstraints(bk,1,2);
        bk.setStyle("-fx-text-fill: #0000ff; -fx-font: 17px Serif");
        EventHandler<ActionEvent> event2=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try {
					new AdminPage().start(primaryStage);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
            } 
        }; 
        bk.setOnAction(event2);
        
        grid.setStyle("-fx-background-image: url('https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-cool-black-background-promotion-main-map-image_188883.jpg')");
        grid.getChildren().addAll(idl,id,btn,bk,pay);
        Scene scene=new Scene(grid,600,600);
		primaryStage.setScene(scene); 	
        primaryStage.show();  
    }
}
