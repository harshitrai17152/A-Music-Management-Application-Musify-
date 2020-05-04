
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TextArea;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.CornerRadii;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Pane;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

class lyrics {
    
	private Scanner sc;

	lyrics(String imgPath, String lyrPath) throws FileNotFoundException   
    {
    	Stage subStage=new Stage();
        subStage.setTitle("Lyrics");
        Pane pane=new Pane();
          
        Image image=new Image(new FileInputStream(imgPath));  
	    ImageView imageView=new ImageView(image);    
	    imageView.setX(225);  
	    imageView.setY(460); 
	    imageView.setFitHeight(450); 
	    imageView.setFitWidth(580); 
	    imageView.setPreserveRatio(true); 
       
        File lyrics=new File(lyrPath); 
        sc=new Scanner(lyrics);  
        
        BackgroundFill background_fill = new BackgroundFill(Color.BLACK, CornerRadii.EMPTY, Insets.EMPTY); 
        // create Background 
        Background background = new Background(background_fill);
        	  
        TextArea textArea=new TextArea();
        textArea.setLayoutX(150); 
        textArea.setLayoutY(25); 
        textArea.setMinSize(400,400);
        while(sc.hasNextLine())   
        	textArea.appendText(sc.nextLine()+"\n");  
         
        pane.setBackground(background);
        pane.getChildren().addAll(imageView,textArea); 
        Scene scene=new Scene(pane,900,900);
        //scene.setFill(Color.BLACK);
        subStage.setScene(scene);	
		subStage.show();
    }
} 

public class musiclibrary extends Application {
	
	ResultSet table;
	String language;
	int id;
 
	musiclibrary(ResultSet rs, String l, int i)
	{
		table=rs;
		language = l;
		id = i;
	}

	//String path = "C:/Users/hp/Documents/Study/Semester 6/DBMS/Project/English Songs Data/Songs/E71.mp3";   
    //Media media = new Media(new File(path).toURI().toString());
	MediaPlayer mediaPlayer;
	
	@Override
	public void start(final Stage primaryStage) throws SQLException 
	{ 
		primaryStage.setTitle("Music Library");
    	GridPane grid=new GridPane();
        grid.setPadding(new Insets(90,0,0,0)); // top,right,bottom,left
        grid.setVgap(20);
        grid.setHgap(20);
        
        String f="-fx-font-weight: bolder; -fx-text-fill: #FFFFFF; -fx-font: 20px sans-serif; -fx-background-color: #0000ff";
    	Button b1=new Button();
    	
    	b1.setText("Play");
//    	b1.setMinSize(200,100);
        GridPane.setConstraints(b1,1,0);
        b1.setStyle(f);
         
    	Button b2=new Button(); 
    	b2.setText("Pause");
//    	b2.setMinSize(200,100);
        GridPane.setConstraints(b2,2,0);
        b2.setStyle(f);
        
        Button b3=new Button();
    	b3.setText("Resume");
//    	b3.setMinSize(200,100);
        GridPane.setConstraints(b3,3,0);
        b3.setStyle(f);
        
		final ListView<Object> lv=new ListView<Object>(); 
		lv.setPrefWidth(600);
		lv.setPrefHeight(600);
		GridPane.setConstraints(lv,0,0);
		
		while(table.next()) 
        { 
			 lv.getItems().add((String)(table.getString(1)+"   --   "+table.getString(2)+"   --   "+table.getString(4)+"   --   "+table.getString(6)+"   --   "+table.getString(7)));			 
        }
		
		EventHandler<ActionEvent> event1=new EventHandler<ActionEvent>() {		
            public void handle(ActionEvent e) 
            {
            	if(mediaPlayer!=null)
            		mediaPlayer.stop();
            	
            	String path = "";
            	
            	try {
            		
            		String imgPath ="";
            		String lyrPath ="";
            		
            		String selected = (String) lv.getSelectionModel().getSelectedItem();
            		int sid = Integer.parseInt(selected.substring(0, selected.indexOf(" ")));
            		
            		Class.forName("com.mysql.cj.jdbc.Driver");  

            		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Musify","root","sql@iiitdelhi");
            		Statement stmt=con.createStatement();  
            		String q1 = "";
            		if(language==null || language.equals("Any"))
            		{
            			String [] languages = {"Hindi_Songs", "English_Songs", "Korean_Songs", "Punjabi_Songs", "Gujrati_Songs"};
                   		String [] q = new String[5];
                   		
                   		for(int i=0;i<5;i++)
                   		{
                   			
                   			q[i] = "select * from " +languages[i]+" where SongID = " + sid; 
                   		}
                   		
                   		q1 = q[0] +" union "+q[1] +" union " +q[2] +" union "+q[3] +" union "+q[4] +";";
                   		System.out.println(q1);
            		}
            		else
            		{
            			q1 = "select * from " + language + "_Songs " + "where SongID = " + sid +";";
            		}
                     
                    ResultSet rs=stmt.executeQuery(q1);
                    rs.next();
                    lyrPath =rs.getString(5);
                    path = rs.getString(12);
                    imgPath = rs.getString(13);
                    
					new lyrics(imgPath,lyrPath);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace(); 
				}
            	Media hit = new Media(new File(path).toURI().toString());
//            	Media hit=new Media(Paths.get(path).toUri().toString());
            	mediaPlayer=new MediaPlayer(hit);
            	mediaPlayer.play(); 
               
            	System.out.println("Playing... "+lv.getSelectionModel().getSelectedItem().toString().split("   --   ")[0]);
            }  
        }; 
        b1.setOnAction(event1); 
        
        EventHandler<ActionEvent> event2=new EventHandler<ActionEvent>() {
            public void handle(ActionEvent e) 
            {
            	mediaPlayer.pause();
            } 
        };
        b2.setOnAction(event2); 
		  
        EventHandler<ActionEvent> event3=new EventHandler<ActionEvent>() {
            public void handle(ActionEvent e) 
            {
            	mediaPlayer.seek(mediaPlayer.getCurrentTime());
            	mediaPlayer.play();
            } 
        };
        b3.setOnAction(event3); 
        
        Button back=new Button();
    	back.setText("Back");
    	back.setStyle("-fx-text-fill: #0000ff; -fx-font: 17px Serif");
    	GridPane.setConstraints(back,3,1);
    	
        EventHandler<ActionEvent> so = new EventHandler<ActionEvent>() { 
            public void handle(ActionEvent e) 
            { 
            	try {
					new UserPage(id).start(primaryStage);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
            } 
        }; 
        back.setOnAction(so);
        
      
         
        grid.setStyle("-fx-background-image: url('https://i.pinimg.com/736x/4f/eb/9f/4feb9f5f60c5d0b87051473951456e37.jpg')");
	    grid.getChildren().addAll(b1,b2,b3,lv, back);
	    Scene scene=new Scene(grid,1000,1000);
		primaryStage.setScene(scene);	
	    primaryStage.show();
	}
	 
	public static void main(String[] args) {
        launch(args);
    
	}
}
