
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontPosture;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;
import javafx.stage.Stage;
 
public class ArtistPayment extends Application {
	
	int artistID;
	 
	ArtistPayment(int id)
	{ 
		artistID = id; 
	}

	public static void main(String[] args) {
        launch(args);
    }  
   
    @Override
    public void start(final Stage primaryStage) throws SQLException {
    	primaryStage.setTitle("Payment");
        Button btn=new Button();
        btn.setText("Return");
        btn.setMinSize(100,70);
        btn.setStyle("-fx-text-fill: #0000ff; -fx-font: 20px Serif");
        
        GridPane grid=new GridPane();
        grid.setPadding(new Insets(100,0,0,50)); // top,right,bottom,left
        grid.setVgap(20);   
        grid.setHgap(20);     
         
        String f="-fx-font-weight: bolder ; -fx-text-fill: white; -fx-font:20px sans-serif";
        
        Label biol=new Label("Your current payment amount:"); 
        biol.setStyle(f);
        GridPane.setConstraints(biol,0,0);
//        TextField bio=new TextField();         
//        bio.setPromptText("Type New Bio");

        Text payment = new Text();
        payment.setFill(Color.WHITE);
        payment.setFont(Font.font("verdana", FontWeight.BOLD, FontPosture.REGULAR, 15));
        GridPane.setConstraints(payment,1,0);
       
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Musify","root","sql@iiitdelhi");
		Statement sta=con.createStatement();
		String query = "select SongID, count(distinct(Favorite_Songs.UserID)) as FavUser, count(distinct(Songs_Listened.UserID)) as RecUser from Favorite_Songs inner join Songs_Listened using(SongID) group by SongID";
		String q="select * from English_Songs where ArtistID = " + artistID+ " union " +"select * from Hindi_Songs where ArtistID = " + artistID+ " union " +"select * from Punjabi_Songs where ArtistID = " + artistID+ " union " +"select * from Korean_Songs where ArtistID = " + artistID+ " union " +"select * from Gujrati_Songs where ArtistID = " + artistID+ " ;";
		
		ResultSet artistSongs = sta.executeQuery(q);
		
		long incrPay = 0;
		
		ArrayList<Integer> as = new ArrayList<Integer>();
		
		while(artistSongs.next()) 
        {
			as.add(Integer.parseInt(artistSongs.getString(1)));
        } 
		ResultSet songs=sta.executeQuery(query);
		while(songs.next()) 
        {
			if(as.contains(songs.getString(1)))
			{
				incrPay = incrPay + 10*Integer.parseInt(songs.getString(2)) + 5*Integer.parseInt(songs.getString(3));
			}
        }
		String updatePaymentQuery = "Update Artist set Payment = Payment+" + incrPay+" where ArtistID = " + artistID +";";
		sta.executeUpdate(updatePaymentQuery);
		String getUpdatedPay = "select Payment from Artist where ArtistID = " + artistID +";";
		ResultSet updatedPayment = sta.executeQuery(getUpdatedPay);
		updatedPayment.next();
		payment.setText(updatedPayment.getString(1));
		EventHandler<ActionEvent> event1=new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e)  
            { 
            	try {
					new ArtistPage(artistID).start(primaryStage);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
            } 
        }; 
        btn.setOnAction(event1);
                
        GridPane.setConstraints(btn,0,1);
        grid.setStyle("-fx-background-image: url('https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-cool-black-background-promotion-main-map-image_188883.jpg')");
        grid.getChildren().addAll(biol,payment,btn);
        primaryStage.setScene(new Scene(grid,600,650));
        primaryStage.show();
    }
}