%函数intercross
%输入：
%a和b为两个待交叉的个体
%输出：
%a和b为交叉后得到的两个个体
function [a,b]=pmxcross(a,b)
L=length(a);
r1=randsrc(1,1,[1:L]); %%%生成概率矩阵
r2=randsrc(1,1,[1:L]);
if r1~=r2
    a0=a;
    b0=b;
    s=min([r1,r2]);%%设定杂交点
    e=max([r1,r2]);
    for i=s:e      %%%循环遍历s,e中间的值
        a1=a;
        b1=b;
        a(i)=b0(i);   %%%%交换杂交点
        b(i)=a0(i);
        x=find(a==a(i));   %%%找到重复元素位置
        y=find(b==b(i));
        i1=x(x~=i);      %%%去掉交换的位置
        i2=y(y~=i);
        if ~isempty(i1)
            a(i1)=a1(i);   %%%不重复的位置不变，重复的位置用替换交叉后的元素替代
        end
        if ~isempty(i2)
            b(i2)=b1(i);
        end
    end
end
