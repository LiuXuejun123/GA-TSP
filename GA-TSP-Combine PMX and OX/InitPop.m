%��Ⱥ��ʼ������
%���룺
%NIND ��Ⱥ��ģ��С
%N    ����Ⱦɫ�峤�ȣ�����Ϊ���и�����
%�����
%��ʼ��Ⱥ
function Chrom=InitPop(NIND,N)
Chrom=zeros(NIND,N);      %���ڴ洢��Ⱥ
for i=1:NIND
    Chrom(i,:)=randperm(N);%������ɳ�ʼ��Ⱥ
end