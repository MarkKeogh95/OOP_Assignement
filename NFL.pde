void setup()
{
   size(500,500); 
   loadData();
}

ArrayList<ArrayList<Float>> data = new ArrayList<ArrayList<Float>>();

void loadData()
{
  String[] strings = loadStrings("NFL.csv");
  
  for(String s:strings)
  {
    String[] line = s.split(",");
    
    ArrayList<Float> lineData = new ArrayList<Float>();
    
     
    for (int i = 2 ; i < line.length ; i ++)
    {
      lineData.add(Float.parseFloat(line[i]));              
    }
    data.add(lineData);
    
    
  }
  for(int i =0 ; i < data.size(); i++)
    {
       println(data.get(i)); 
    }
}
