PVector distortion(float x, float y, float percent) {
  float amount = 100; // effect intensity
  float scale = 0.01; // noise scale
  
  // change this values, you can try positive and negative values as well
  float xMod = 0.5;
  float yMod = 1.5;
  float xMult = 0.5;
  float yMult = 0.5;
  
  PVector result = new PVector(amount * (noise(scale*x, scale*y) - xMod) * xMult, 
                               amount * (noise(scale*x, scale*y) - yMod) * yMult);
  
  float intensity = map(sin(TWO_PI * (percent + noise(scale*x, scale*y))), -1, 1, 0, 2);
  result.mult(intensity);
  
  return result;
}
