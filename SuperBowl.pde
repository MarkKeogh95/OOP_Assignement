class SuperBowl
{
  String team;
  float attended;
  float won;
  color colour;
  
  SuperBowl(String line)
  {
    String[] parts = line.split(",");
    team = parts[1];
    attended = Float.parseFloat(parts[2]);
    won =  Float.parseFloat(parts[3]);
    colour = color(random(0,255),random(1,255),random(0,255));
  }
}
