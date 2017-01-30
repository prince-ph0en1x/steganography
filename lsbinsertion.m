cover = imread('im08a.png');
message = imread('im08b.png');

% figure(1), imshow(cover); title('Original Image (Cover Image)');
% figure(2), imshow(message);title('Image to Hide (Message Image)');

cover=double(cover);
message=double(message);



imbed=1;%imbed = no. of bits of message image to embed in cover image
messageshift=bitshift(message,-(8-imbed));%shift the message image over (8-imbed) bits to right
imshow(messageshift)

%show the message image with only embed bits on screen : must shift from LSBs to MSBs
showmess=uint8(messageshift);
showmess=bitshift(showmess,8-imbed);
% figure(3),imshow(showmess);title('4 Bit Image to Hide');


%now zero out imbed bits in cover image
coverzero = cover;
for i=1:imbed
coverzero=bitset(coverzero,i,0);
end

sz = size(messageshift);
%now add message image and cover image
stego = uint8(coverzero(1:sz(1),1:sz(2))+messageshift);
% figure(4),imshow(stego);title('Stego image');


%save files if need to
%4 bit file that was embedded = same as file extracted
imwrite(showmess,'showmesscolor.bmp'); %use bmp to preserve lower bits


%jpg will get rid of them
%stego file
imwrite(stego,'stegocolor.bmp');