% �����������
%���룺
%SelCh  ��ѡ��ĸ���
%Pc   �������
%�����
%SelCh   �����ĸ���
function SelCh=PMX_combin(SelCh,Pc)
NSel=size(SelCh,1);
for i=1:2:NSel-mod(NSel,2)
    if Pc>=rand            %�������Pc
        [SelCh(i,:),SelCh(i+1,:)]=pmxcross(SelCh(i,:),SelCh(i+1,:));
    end
end