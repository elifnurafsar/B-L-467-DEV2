function P = median_filtering(I)
    [h,t,d] = size(I);
    P=zeros(h,t,d);
    padding=floor(3/2);
    for i=1:h
       for j=1:t
           arr=zeros(9,3);
           for m=1:9
               arr(m,:)=-1;
           end
           num=1;
           for a=i-padding:i+padding
               if a<1
                   num=num+1;
                   continue;
               end
               if a>h
                   num=num+1;
                   continue;
               end
               for b=j-padding:j+padding
                   if b<1
                       num=num+1;
                       continue;
                   end
                   if b>t
                       num=num+1;
                       continue;
                   end
                   arr(num,1) = I(a,b,1);
                   arr(num,2) = I(a,b,2);
                   arr(num,3) = I(a,b,3);
                   num=num+1;
               end
           end  
           x=0;
           for k=1:9
               if arr(k,1) ~= -1
                   x=x+1;
               end
           end
           B=zeros(x,3);
           say=1;
           for k=1:9
               if arr(k,1)~=-1
                   B(say,1)=arr(k,1);
                   B(say,2)=arr(k,2);
                   B(say,3)=arr(k,3);
                   say=say+1;
               end
           end
           B=sort(B);
           mid=floor(x/2);
           P(i,j,1)=B(mid,1);
           P(i,j,2)=B(mid,2);
           P(i,j,3)=B(mid,3);
       end
    end
    P=uint8(P);
end