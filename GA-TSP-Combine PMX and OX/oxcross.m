function [a,b]=oxcross(a,b)
L=length(a); %%求长度
r1=randsrc(1,1,[1:L]);
r2=randsrc(1,1,[1:L]); %%%生成概率矩阵
x = [];
y = [];
if r1~=r2
    a0=a; 
    b0=b; 
    a1 = a;
    b1 = b;
    s=min([r1,r2]);
    e=max([r1,r2]);
    for i=s:e 
        x=[x;find(b0==a0(i))];  
        y=[y;find(a1==b1(i))]; 
    
    end
    count = 1; 
    for i=1:L
        if find(i==x) | count==range(s,e) 
            continue
        elseif count<s 
            a(count) = b0(i);

            count = count+1;
        else
            a(count+e-s+1) = b0(i);

            count=count+1;
    end
    end
    tip = 1;
    for i=1:L
        if find(i==y) | tip==range(s,e)
            continue
        elseif tip<s
            b(tip) = a1(i);

            tip = tip+1;
        else
            b(tip+e-s+1) = a1(i);
            tip=tip+1;
    end
    end 
end


