PImage img;    
int cellgrootte = 2; 
int columns, rijen;   

void setup() {
  size(1080, 360, P3D); 
  img = loadImage("victory-boogie-woogie.jpg");
  img.resize(200,200);
  columns = img.width / cellgrootte;
  rijen = img.height / cellgrootte;  
}

void draw() {
  background(255);
  // loop voor colommen
  for ( int i = 0; i < columns; i++) {
   // loop voor rijen
    for ( int j = 0; j < rijen; j++) {
      int x = i*cellgrootte + cellgrootte/2;  // x pos
      int y = j*cellgrootte + cellgrootte/2;  // y pos
      int loc = x + y*img.width;  // Pixel array loc
      color c = img.pixels[loc];  // kies kleur
      
      float z = (mouseX / float(width)) * brightness(img.pixels[loc]) - 20.0;
      // translate locatie, teken kleur, stroke en afbeelden
      pushMatrix();
      translate(x + 150, y +100, z);
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellgrootte, cellgrootte);
      popMatrix();
    }
  }
}
