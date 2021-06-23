x=0;
while rem(x,2)==0
    x=input('Please enter an odd integer for define mask size: ');
end
mask=ones(x,x);
total=0;
for i=1:x
   for j=1:x
       prompt = strcat('Please enter an integer for ', int2str(i),  ' th row and ' , int2str(j), ' th column: ');
       mask(i,j)=input(prompt);
       %if we use weighted matrix we should use total and weight values
       %total=total+ mask(i,j);
   end
end
%weight=1/total;
img = imread('img.jpeg');
I = im2gray(img);
[h,t]=size(I);
P = zeros(h,t);
padding=floor(x/2);
for i=1:h
   for j=1:t
       a=1;
       pls=0;
       tot=0;
       for k=i-padding:i+padding
           b=1;
           for w=j-padding:j+padding
               if k>=1 && w>=1 && k<=h && w<=t
                   tot=tot+mask(a,b)*I(k,w);
               end
               b=b+1;
           end
           a=a+1;
       end
       val=tot;
       %if it is a weighted masking algo change as val=tot*weight;
       P(i,j)=val;
   end
end
figure 
imshow(uint8(P));
