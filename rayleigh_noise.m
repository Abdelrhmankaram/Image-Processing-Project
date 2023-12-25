function [noisyImage] = rayleigh_noise(image, scale)
  image = im2double(image);
  
  rayleighNoise = scale * randn(size(image)) + scale * 1i * randn(size(image));
  rayleighNoise = abs(rayleighNoise);
  
  noisyImage = image + rayleighNoise;
  
  noisyImage = min(max(noisyImage, 0), 1);
end