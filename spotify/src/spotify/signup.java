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
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.layout.GridPane;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontPosture;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;
import javafx.stage.Stage;
 
class subscription {
    
	subscription() 
    {
		final Stage subStage=new Stage();
		subStage.setTitle("Bank Details");
        Button btn=new Button();
        btn.setText("SUBMIT");  
        
        GridPane grid=new GridPane();
        grid.setPadding(new Insets(100,100,100,100)); // top,right,bottom,left
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
           
        btn.setMinSize(200,40); 
        GridPane.setConstraints(btn,1,4);
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 25px Serif");   
        
        EventHandler<ActionEvent> event=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try {
					new mainpage().start(subStage);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
            } 
        };
        btn.setOnAction(event); 
        
        Button bk=new Button();
        bk.setText("BACK"); 
        bk.setMinSize(200,40); 
        GridPane.setConstraints(bk,1,5);
        bk.setStyle("-fx-text-fill: #0000ff; -fx-font: 25px Serif");
        EventHandler<ActionEvent> event2=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	new signup().start(subStage); 
            } 
        };
        bk.setOnAction(event2);
        
        grid.setStyle("-fx-background-image: url('https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-cool-black-background-promotion-main-map-image_188883.jpg')");
        grid.getChildren().addAll(idl,id,namel,name,accl,acc,typel,cb1,btn,bk);
        Scene scene=new Scene(grid,800,800);
		subStage.setScene(scene);	
        subStage.show();  
    }

	public void start(Stage primaryStage) {
		// TODO Auto-generated method stub	
	}
} 
public class signup extends Application {
	
    public static void main(String[] args) { 
        launch(args);
    }
    
    
    @Override
    public void start(final Stage primaryStage) {
        primaryStage.setTitle("Create Account");
        Button btn=new Button();
        btn.setText("SUBMIT");
        
        GridPane grid=new GridPane();
        grid.setPadding(new Insets(120,0,0,100)); // top,right,bottom,left
        grid.setVgap(30);
        grid.setHgap(20);    
        
        String f="-fx-font-weight: bolder ; -fx-text-fill: white; -fx-font:25px sans-serif";
        Label namel=new Label("Name:");
        namel.setStyle(f);
        GridPane.setConstraints(namel,0,0);
        final TextField name=new TextField();         
        name.setPromptText("Enter your name");
        GridPane.setConstraints(name,1,0); 
        
        Label idl=new Label("Login ID:"); 
        GridPane.setConstraints(idl,0,1); 
        idl.setStyle(f); 
        final TextField id=new TextField();
		id.setPromptText("Enter your Login ID");
        GridPane.setConstraints(id,1,1);
        
        Label passl=new Label("Password:");
        GridPane.setConstraints(passl,0,2);
        passl.setStyle(f);
        final PasswordField pass=new PasswordField();
		pass.setPromptText("Enter your password");
        GridPane.setConstraints(pass,1,2); 
        
        Label typel=new Label("Account Type:");
        typel.setStyle(f);
        GridPane.setConstraints(typel,0,3);              
        final ChoiceBox<String> cb1=new ChoiceBox<String>();
        cb1.getItems().addAll("User","Artist","Film Maker");
        GridPane.setConstraints(cb1,1,3);  
       
        Label subl=new Label("Subscription:");
        subl.setStyle(f);
        GridPane.setConstraints(subl,0,4);        
        final ChoiceBox<String> cb2=new ChoiceBox<String>();
        cb2.getItems().addAll("Normal","Premium");
        GridPane.setConstraints(cb2,1,4);
        
        Label fa=new Label("Favourite Artist:");
        fa.setStyle(f);
        GridPane.setConstraints(fa,0,5);
        final TextField favAr=new TextField();         
        favAr.setPromptText("Enter your favorite artist");
        GridPane.setConstraints(favAr,1,5);
        
        btn.setMinSize(120,40);
        GridPane.setConstraints(btn,1,9);
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");   
      
        Text text1 = new Text("Only when signing up as Film Maker");
        text1.setFill(Color.WHITE);
        text1.setFont(Font.font("verdana", FontWeight.BOLD, FontPosture.REGULAR, 15));
        GridPane.setConstraints(text1, 0, 6);
        final Label filmName=new Label("Film name:"); 
        GridPane.setConstraints(filmName,0,7); 
        filmName.setStyle(f);
        final TextField fn=new TextField();
        
		fn.setPromptText("Enter your film name");
        GridPane.setConstraints(fn,1,7);

        final Label filmDesc=new Label("Film Description:");
        filmDesc.setStyle(f);
        GridPane.setConstraints(filmDesc,0,8);
        final TextField desc=new TextField();
		desc.setPromptText("Film Description");
        GridPane.setConstraints(desc,1,8);

        
        EventHandler<ActionEvent> event=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e)
            {
            	try {
            		Class.forName("com.mysql.cj.jdbc.Driver");
            		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spo","root","Maeve@123");
        			Statement stmt=con.createStatement();
        			
        			String qq = "Select * from User where LoginID = \"" + id.getText() + "\"" + "and Password = \"" + pass.getText() + "\";";
        			ResultSet rss = stmt.executeQuery(qq);
        			if(rss.next()==true)
        			{
        				Alert alert = new Alert(AlertType.INFORMATION);
                    	alert.setTitle("Warning");
                    	alert.setHeaderText(null);
                    	alert.setContentText("Duplicate LoginID and Password!");
                    	alert.showAndWait();         	
        			}
        			else
        			{
        			int subs=0;
        			if(cb2.getValue()=="Normal")
        				subs=0;
        			else
        				subs=1;
        			
        			String q1= "SELECT UserID FROM User WHERE UserID=(SELECT max(UserID) FROM User);"; 
        			ResultSet rs=stmt.executeQuery(q1);
        	        rs.next();
       	        
        	        int uid = Integer.parseInt(rs.getString(1)) +1;
        			String q= "Insert into User values(" + uid + "," + "\"" + name.getText()+ "\"" + "," + "\""+ id.getText()+ "\"" + "," + "\""+pass.getText()+ "\"" + "," + subs + "," +'0' + ',' + "\""+ favAr.getText()+ "\"" + ");"; 
        			System.out.println(q);
        			stmt.executeUpdate(q);
          	
            	if(cb1.getValue()=="Artist")
            	{
            		try
            		{
        			String q2= "SELECT ArtistID FROM Artist WHERE ArtistID=(SELECT max(ArtistID) FROM Artist);"; 
        			ResultSet rs1=stmt.executeQuery(q2);
        	        rs1.next();
        	              	        
        	        uid = Integer.parseInt(rs.getString(1))+1;
        			String q3= "Insert into Artist values(" + uid + "," + "\""+ name.getText()+ "\"" + "," + /*id.getText() + "," +pass.getText() +*/ "0,0," + "\"" + "\","+'0' + ");"; 
        			System.out.println(q3);
        			stmt.executeUpdate(q3);
            		}
            		catch(Exception exp)
            		{
            			exp.printStackTrace();
            		}
            	}
            	else if(cb1.getValue()=="Film Maker")
            	{
            		try
            		{
            			  
        			String q4= "SELECT FilmMakerID FROM FilmMakers WHERE FilmMakerID=(SELECT max(FilmMakerID) FROM FilmMakers);"; 
        			ResultSet rs3=stmt.executeQuery(q4);
        	        rs3.next();
        	        
        	        uid = Integer.parseInt(rs.getString(1))+1;
        	        String q5= "SELECT FilmID FROM FilmMakers WHERE FilmId=(SELECT max(FilmID) FROM FilmMakers);"; 
        			ResultSet rs4=stmt.executeQuery(q5);
        	        rs4.next();
        	        
        	        int filmID = Integer.parseInt(rss.getString(1))+1;
        	        
        	        
        			String qe= "Insert into FilmMakers values(" + uid + "," + "\""+ name.getText() + "\""+ "," + "\""+ /*id.getText() + "," +pass.getText() +*/ fn.getText() + "\""+ "," + filmID+"," + "\""+ desc.getText() + "\""+",0" + ");"; 
        			stmt.executeUpdate(qe);
            		}
            		catch(Exception exp)
            		{
            			exp.printStackTrace();
            		}
            	}

            	if(cb2.getValue().toString().equals("Normal"))
            	{
            		new mainpage().start(primaryStage);	
            	}
				else
					try {	
						
						new subscription().start(primaryStage);
						primaryStage.close();
						} catch (Exception e1) {
						e1.printStackTrace();
						}
            	}
            	} catch (Exception e2) {
    				
    				e2.printStackTrace();
    			} 
            	
            } 
        };
        btn.setOnAction(event);
        
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
        Button back = new Button();
        back.setText("BACK");
        back.setMinSize(120,40);
        GridPane.setConstraints(back,1,10);
        back.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
        back.setOnAction(event2);
        
        grid.setStyle("-fx-background-image: url('https://www.infogate.cl/wp-content/uploads/2015/12/mus-1024x680.jpg')");
        grid.getChildren().addAll(namel,name,idl,id,passl,pass,typel,cb1,subl,cb2,btn,back, favAr, fa, desc, filmDesc, filmName, fn, text1);
        Scene scene=new Scene(grid,900,900);
		primaryStage.setScene(scene);	
        primaryStage.show();  
    }
}
