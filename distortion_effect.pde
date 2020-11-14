int totalFrames = 60*2;
int counter = 0;

/* PROJECT VARIABLES */
color[] result;
PGraphics pg;
PFont font;


void setup() {
  size(800, 800);

  font = createFont("Roboto-Bold.ttf", 60);
  pg = createGraphics(width, height);

  result = new color[pg.width * pg.height];

  noStroke();
  
  renderText(); // render text in setup if static
}


void draw() {
  float percent = float(counter % totalFrames) / totalFrames;

  // renderText(); // render text in setup if animated
  render(percent);
  
  counter++;
}


void renderText() {
  pg.beginDraw();
  pg.background(0);
  pg.noStroke();
  pg.fill(255);
  pg.textFont(font, 800);
  pg.textSize(800);
  pg.translate(width/2, height/2 - 100);
  pg.textAlign(CENTER, CENTER);
  pg.text("X", 0, 0);
  pg.endDraw();
}


void render(float percent) {
  image(pg, 0, 0);

  loadPixels();
  for (int x = 0; x < pg.width; x++) {
    for (int y = 0; y < pg.height; y++) {
      PVector dist = distortion(x, y, percent);

      int X = constrain(floor(x + dist.x), 0, width-1);
      int Y = constrain(floor(y + dist.y), 0, height-1);

      result[x + width*y] = pixels[X + width*Y];
    }
  }
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      pixels[x + width*y] = result[x + width*y];
    }
  }
  updatePixels();
}
