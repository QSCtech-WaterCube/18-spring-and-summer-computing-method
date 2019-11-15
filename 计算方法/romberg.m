function[t]=romberg(f,a,b,e)            
    t=zeros(15,4);                     
    t(1,1)=(b-a)/2*(f(a)+f(b));       
    for k=2:4                        
        sum=0;
        for i=1:2^(k-2)
            sum=sum+f(a+(2*i-1)*(b-a)/2^(k-1));
        end
        t(k,1)=0.5*t(k-1,1)+(b-a)/2^(k-1)*sum;
        for i=2:k
            t(k,i)=(4^(i-1)*t(k,i-1)-t(k-1,i-1))/(4^(i-1)-1);
        end
    end
    
    for k=5:15                    
        sum=0;
        for i=1:2^(k-2)
            sum=sum+f(a+(2*i-1)*(b-a)/2^(k-1));
        end
        t(k,1)=0.5*t(k-1,1)+(b-a)/2^(k-1)*sum;
        for i=2:4
            t(k,i)=(4^(i-1)*t(k,i-1)-t(k-1,i-1))/(4^(i-1)-1);
        end  
        if k>6                   
            if abs(t(k,4)-t(k-1,4))<e    
                disp(['´ð°¸ ',num2str(t(k,4))]);  
                break;
            end
        end
    end
    if k>=15
        disp(['Òç³ö']);    
end 
