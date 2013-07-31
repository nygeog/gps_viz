PImage worldMapImage;
MercatorMap mercatorMap;
float[] latNumbers = { 40.712, 40.713, 40.714, 40.715, 40.716, 40.717, 40.9, 40.712 };
float[] lngNumbers = { -74.005, -74.006, -74.007, -74.008, -74.009, -74.010, -74.2, -74.005 };

float lat = 40.712;
float lng = -74.005;

PVector berlin;
PVector sydney;
PVector sanFrancisco;
PVector newYork;
PVector newYork2;

void setup() {
  size(400, 400);
  smooth();
  
  // World map from http://en.wikipedia.org/wiki/File:Mercator-projection.jpg 
  worldMapImage = loadImage("nyc.png");
  // Using default bounding box
  mercatorMap = new MercatorMap(400, 400, 40.9908, 40.3690, -74.2889, -73.469 ); 
  // size, size, north extent, south exten, west extent, east extent 
  berlin = mercatorMap.getScreenLocation(new PVector(52, 13));
  sydney = mercatorMap.getScreenLocation(new PVector(-33.86, 151.21));
  sanFrancisco = mercatorMap.getScreenLocation(new PVector(37.8, -122.4));
  newYork = mercatorMap.getScreenLocation(new PVector(lat,lng));
  for (int i=0; i < 8; i++){
    newYork2 = mercatorMap.getScreenLocation(new PVector(latNumbers[i],lngNumbers[i]));
  }
  image(worldMapImage, 0, 0, width, height);
}

void draw() {
  image(worldMapImage, 0, 0, width, height);
  
  //newYork = mercatorMap.getScreenLocation(new PVector(lat,lng));
  
  noStroke();
  fill(255, 0, 0, 200);
  
  ellipse(berlin.x, berlin.y, 6, 6);
  ellipse(sydney.x, sydney.y, 6, 6);
  ellipse(sanFrancisco.x, sanFrancisco.y, 6, 6);
  ellipse(newYork.x, newYork.y, 30, 30);
  ellipse(newYork2.x, newYork2.y, 20, 20);
  
  newYork.x = newYork.x + 0.1;
  newYork.y = newYork.y + 0.1;  
}

SimpleMercatorWorld_Danny_Backup.
