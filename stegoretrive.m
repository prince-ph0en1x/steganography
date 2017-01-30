
clear all
%open cover and message image files
stego = imread('stegocolor.bmp');

%display on screen the two images
figure(1), imshow(stego); title('Original Stego Image');

 
 %imbed = no. of bits of message image to embed in cover image
 imbed=4;


stegoret = stego;
for i=imbed+1:8
stegoret=bitset(stegoret,i,0);
end
stegoret=bitshift(stegoret,8-imbed);
figure(1),imshow(stegoret);title('Stego Retrived image');