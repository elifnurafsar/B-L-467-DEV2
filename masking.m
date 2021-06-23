function res = masking(I,mask)
    [x,~]=size(mask);
    [h,t]=size(I);
    P=zeros(h,t);
    padding=floor(x/2);
    for i=1:h
        for j=1:t
            a=1;
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
            P(i,j)=val;
        end
    end
    res=P;
end

