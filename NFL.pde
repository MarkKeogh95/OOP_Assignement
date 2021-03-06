
ArrayList<SuperBowl> stats = new ArrayList<SuperBowl>();
//sets the border
float border = 40 ;
//saves what key is pressed
int mode = 0;
void setup()
{
   size(700,700); 
   //cp5 = new ControlP5(this);
   centX = width*0.5f;
   centY = height*0.5f;
   
   //Calls stats
   loadStats();
}



void loadStats()
{
  String[] lines = loadStrings("NFL.csv");
  for (int i = 0; i < lines.length ; i++)
  {
    SuperBowl stat = new SuperBowl(lines[i]);
    stats.add(stat);
    
  }
}


//Bargraph
void drawSuperBowlBars()
{
  background(0);
  float max = Float.MIN_VALUE;
  
  for (SuperBowl stat:stats)
  {
    if (stat.won > max)
    {
      max = stat.won;
      
    }//end if
    
  }//end for
  
  //checking the width of each bar
  float gap = map(1, 0, 14, 0, width - border - border);
   
  float scaleFactor = map(1, 0, max, 0, height - border - border);
  
  for (int i = 0 ; i < stats.size() ; i ++)
  {
    SuperBowl stat = stats.get(i);
    stroke(stat.colour);
    fill(stat.colour);
    float x = i * gap;
    rect(x + border, height - border, gap, - (stat.won * scaleFactor));
    stroke(255);
    fill(255);
    
    //drawing the axis
    line(border, border , border, height - border);
    line(border, height - border, width - border, height - border);
  
  }//end for loop
  
  for (int i = 0 ; i < 6 ; i ++)
  {
    float y = map(i, 0, 10, height - border,  border);
    line(border - (border * 0.1f), y, border, y);
    float hAxisLabel = map(i, 0, 10, 0, max);
        
    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - ((border * 0.1f) * 2.0f), y);
  }//end for
  
  //allows mouse hover to produce info.
  if (mouseX > border && mouseX < (width - border))
  {
    textAlign(LEFT, BASELINE); 
    int i = (int) map(mouseX, border, width - border, 0, stats.size());
    
    textSize(14);
    text("Team: " + stats.get(i).team, mouseX - 80, mouseY - 20);
    text("SuperBowl Wins: " + stats.get(i).won, mouseX - 80, mouseY - 6);
  }//end if
  
}//end bargraph

float centX, centY;

//Piechart
void SuperBowlPie()
{
  background(0);
  float max = Float.MIN_VALUE;
  
  for (SuperBowl stat:stats)
  {
    if (stat.won > max)
    {
      max = stat.won;
    }//end if
  }//end for
  
  float sum = 0;//sum
  for(int i = 0; i < stats.size(); i++)
  {
    SuperBowl ex = null;
    ex = stats.get(i);
    sum += ex.won;
  }//end for
  
  //inital angle
  float thetaPrev = 0;
  
  for(int i = 0 ; i < stats.size() ; i ++)
  {
    SuperBowl stat = stats.get(i);
    
    stroke(stat.colour);
    fill(stat.colour);
    
    SuperBowl ex = null;
    ex = stats.get(i);
       
    float theta = map(ex.won, 0, sum, 0, TWO_PI);
    
    textAlign(CENTER);
    
    float radius = centX * 0.65f;
    float x = centX + sin(thetaPrev + (theta * 0.5f) + HALF_PI) * radius;      
    float y = centY - cos(thetaPrev + (theta * 0.5f) + HALF_PI) * radius;

    //code for the segment
    arc(centX, centY, 500,500, thetaPrev, thetaPrev + theta);
    thetaPrev += theta;
    
    fill(255);
    text(stats.get(i).team, x, y);
    text(stats.get(i).won, x, y);
    
   }//end for
   
}//end piechart

void draw()
{
  //switch statement
  switch(mode)
  {
    case 1:
    {
      //Calls the bargraph
      drawSuperBowlBars();  
      break;
    }//end case 1
    
    case 2:
    {
      //Calls the piechart
       SuperBowlPie();
       break; 
    }//end case 2
    
    default:
    {
      
      break;
    }//end default
    
  }//end switch
  
  
}//end draw

//allows program to know what key is pressed
void keyPressed()
{
  if(key>='0' && key<='9')
  {
    mode = key - '0';
  }//end if
}//end function keyPressed
