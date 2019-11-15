function p=funLSM(x,y,m)	%x,y为序列长度相等的数据向量，m为拟合多项式次数
format short;
A=zeros(m+1,m+1);
for i=0:m
    for j=0:m
    A(i+1,j+1)=sum(x.^(i+j));
end
b(i+1)=sum(x.^i.*y);
end
a=A\b';
p=fliplr(a');

2,11