 function [l,u,p]=mylu(A)
        
        [m,n]=size(A);
        
        if m~=n
        
            error('矩阵不是方阵')
        
            return
        end
        
        if det(A)==0
            error('矩阵不能被三角分解')
        end
        
        u=A;p=eye(m);l=eye(m);
        
        for i=1:m
            for j=i:m
                t(j)=u(j,i);
                for k=1:i-1
                    t(j)=t(j)-u(j,k)*u(k,i);
                end
            end
            a=i;b=abs(t(i));
            for j=i+1:m
                if b<abs(t(j))
                    b=abs(t(j));
                    a=j;
                end
            end
        
            if a~=i
        
                for j=1:m
        
                    c=u(i,j);
        
                    u(i,j)=u(a,j);
        
                    u(a,j)=c;
        
                end
        
                 for j=1:m
        
                    c=p(i,j);
        
                    p(i,j)=p(a,j);
        
                    p(a,j)=c;
        
                 end
        
               c=t(a);
        
               t(a)=t(i);
        
               t(i)=c;
        
            end
        
            u(i,i)=t(i);
        
            for j=i+1:m
        
                u(j,i)=t(j)/t(i);
        
            end
        
            for j=i+1:m
        
                for k=1:i-1
        
                    u(i,j)=u(i,j)-u(i,k)*u(k,j);
        
                end
        
            end
        
        end
        
        l=tril(u,-1)+eye(m);
        
        u=triu（u，0）；

        

