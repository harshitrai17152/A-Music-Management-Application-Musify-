
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javafx.event.ActionEvent; 
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.application.Application;  
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;  

public class AdminPage extends Application  
{  		  
    @Override    
    public void start (final Stage primaryStage) { 
    	   	
    	primaryStage.setTitle("MUSIFY");
    	GridPane grid=new GridPane();
        grid.setPadding(new Insets(70,0,0,200)); // top,right,bottom,left
        grid.setVgap(45);
        grid.setHgap(20);   
     
        String w="-fx-font-weight: bolder; -fx-background-color: #000000; -fx-text-fill: #FFFFFF; -fx-font: 30px sans-serif";
        Button welcome = new Button(); 
        welcome.setText("Welcome to Musify");
        welcome.setStyle(w);
    	welcome.setMinSize(60,40); 
    	
    	String f="-fx-font-weight: bolder; -fx-text-fill: #0000ff; -fx-font: 20px sans-serif"; 
    	Button b1=new Button();
    	b1.setText("Mostly Searched Song");
    	b1.setMinSize(320,50);
        GridPane.setConstraints(b1,0,1); 
        b1.setStyle(f);
        
        final TextField song=new TextField();
		GridPane.setConstraints(song,1,1); 
    	
        Button b2=new Button();
    	b2.setText("Find Premium Users");
    	b2.setMinSize(320,50);
        GridPane.setConstraints(b2,0,2);
        b2.setStyle(f);
    	
        Button b3=new Button(); 
    	b3.setText("Check Artist Payment"); 
    	b3.setMinSize(320,50);
        GridPane.setConstraints(b3,0,3);
        b3.setStyle(f);
        
        Button b4=new Button();
    	b4.setText("Artist followed by most users");
    	b4.setMinSize(320,50);
        GridPane.setConstraints(b4,0,4); 
        b4.setStyle(f);
        
        final TextField artist=new TextField();
		GridPane.setConstraints(artist,1,4);
        
        Button admin=new Button();
    	admin.setText("Total Songs in Application");
    	admin.setMinSize(320,50);
        GridPane.setConstraints(admin,0,5);
        admin.setStyle(f);
        
        final TextField total_songs=new TextField();
		GridPane.setConstraints(total_songs,1,5);
		
        Button b5=new Button();
    	b5.setText("Back");
    	b5.setMinSize(320,50);
        GridPane.setConstraints(b5,0,6);
        b5.setStyle(f);    	
        
        EventHandler<ActionEvent> event1a = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	Connection con;
				try {
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Musify","root","sql@iiitdelhi");
					Statement sta=con.createStatement();
//	        		String innerCountQuery = "(Select SongID, count(UserID) as Count from Songs_Listened group by SongID)a";
//	        		String query = "select a.SongID,a.Count from"+innerCountQuery+ " having a.Count = (select max(a.Count) from " +innerCountQuery +");";
	        		String query = "Select SongID, count(UserID) as Count from Songs_Listened group by SongID having Count = (select max(a.count) from (Select SongID, count(UserID) as Count from Songs_Listened group by SongID)a);";
	        		System.out.println(query);
	        		ResultSet mostPlayedSong = sta.executeQuery(query);
	        		mostPlayedSong.next();
	        		
	        		song.setText("ID: " +mostPlayedSong.getString(1));
				
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
        		
            } 
        };         
        b1.setOnAction(event1a);
        
        EventHandler<ActionEvent> event1b = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e)  
            { 
            	try {
					new AdminPremium().start(primaryStage);
				} catch (Exception e1) {
					// TODO Auto-generated catch block 
					e1.printStackTrace();
				} 
            } 
        }; 
        b2.setOnAction(event1b); 
        
        EventHandler<ActionEvent> event1c = new EventHandler<ActionEvent>() {  
            public void handle(ActionEvent e) 
            { 
            	new AdminPayment().start(primaryStage);
            } 
        }; 
        b3.setOnAction(event1c);
        
        EventHandler<ActionEvent> event4 = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	Connection con;
				try {
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Musify","root","sql@iiitdelhi");
					Statement sta=con.createStatement();
//	        		String innerCountQuery = "(select ArtistID, UsersFollowing from Artist group by ArtistID)a";
	        		String query = "select ArtistID from Artist where UsersFollowing = (select max(UsersFollowing) from Artist);";
	        		System.out.println(query);
	        		ResultSet mostPlayedSong = sta.executeQuery(query);
	        		mostPlayedSong.next();
	        		
	        		artist.setText("ID: " +mostPlayedSong.getString(1));
				
				} catch (SQLException e1) {
					// TODO Auto-generated catch block 
					e1.printStackTrace();
				}
            } 
        };
        b4.setOnAction(event4);
        
        EventHandler<ActionEvent> event3 = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	new AdminLogin().start(primaryStage);
            } 
        }; 
        b5.setOnAction(event3);
        
        EventHandler<ActionEvent> app = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	Connection con = null;
				try {
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Musify","root","sql@iiitdelhi");
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				Statement sta = null;
				try {
					sta = con.createStatement();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			
        		String q1="select count(*) from English_Songs";
        		String q2="select count(*) from Hindi_Songs";
        		String q3="select count(*) from Korean_Songs";
        		String q4="select count(*) from Punjabi_Songs";
        		String q5="select count(*) from Gujrati_Songs";
        		int total=0;
        		ResultSet rs1 = null;
				try {
					rs1 = sta.executeQuery(q1);
					while(rs1.next())
					{
						total=total+rs1.getInt(1); 
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
        		ResultSet rs2 = null;
				try {
					rs2 = sta.executeQuery(q2);
					while(rs2.next())
					{
						total=total+rs2.getInt(1); 
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
        		ResultSet rs3 = null;
				try {
					rs3 = sta.executeQuery(q3); 
					while(rs3.next())
					{
						total=total+rs3.getInt(1); 
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
        		ResultSet rs4 = null; 
				try {
					rs4 = sta.executeQuery(q4);
					while(rs4.next())
					{
						total=total+rs4.getInt(1); 
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
        		ResultSet rs5 = null;
				try {
					rs5 = sta.executeQuery(q5);
					while(rs5.next())
					{
						total=total+rs5.getInt(1); 
					}
				} catch (SQLException e1) {
					e1.printStackTrace(); 
				} 
				total_songs.setText("Total Songs: "+Integer.toString(total));          
            } 
        }; 
        admin.setOnAction(app);
//        grid.setStyle("-fx-background-image: url('https://i.pinimg.com/736x/4f/eb/9f/4feb9f5f60c5d0b87051473951456e37.jpg')");
        grid.setStyle("-fx-background-image: url('https://www.infogate.cl/wp-content/uploads/2015/12/mus-1024x680.jpg')");
        grid.getChildren().addAll(b1,b2,b3,b4,b5, welcome, admin, song,total_songs,artist);
        Scene scene=new Scene(grid,900,900);
		primaryStage.setScene(scene);	 
        primaryStage.show();
        
    }  
    
    public static void main(String[] args) {  
        launch(args); 
    }  
      
}

  	