%����intercross
%���룺
%a��bΪ����������ĸ���
%�����
%a��bΪ�����õ�����������
function [a,b]=pmxcross(a,b)
L=length(a);
r1=randsrc(1,1,[1:L]); %%%���ɸ��ʾ���
r2=randsrc(1,1,[1:L]);
if r1~=r2
    a0=a;
    b0=b;
    s=min([r1,r2]);%%�趨�ӽ���
    e=max([r1,r2]);
    for i=s:e      %%%ѭ������s,e�м��ֵ
        a1=a;
        b1=b;
        a(i)=b0(i);   %%%%�����ӽ���
        b(i)=a0(i);
        x=find(a==a(i));   %%%�ҵ��ظ�Ԫ��λ��
        y=find(b==b(i));
        i1=x(x~=i);      %%%ȥ��������λ��
        i2=y(y~=i);
        if ~isempty(i1)
            a(i1)=a1(i);   %%%���ظ���λ�ò��䣬�ظ���λ�����滻������Ԫ�����
        end
        if ~isempty(i2)
            b(i2)=b1(i);
        end
    end
end
