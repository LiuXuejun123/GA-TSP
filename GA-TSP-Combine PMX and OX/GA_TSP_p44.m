%GA_TSP�����Ŵ��㷨������������
clear
clc
close all
X = ceil(rand(30,2)*100) %���30�����е�����λ��
NIND=100;        %��Ⱥ��ģ��С
MAXGEN=1000;      %��������
Pc=0.9;              %�������
Pm=0.05;             %�������
GGAP=0.9;            %������generation gap)
D=Distanse(X);      %���ɾ������
N=size(D,1);        %���и������֣�20*20������34*34����
%%��ʼ����Ⱥ
Chrom=InitPop(NIND,N);
%%�ڶ�άͼ�ϻ��Ƴ����е������
%figure
%plot(X(:,1),X(:,2),'o');

%%���������·�ߺ��ܾ���
disp('��ʼ��Ⱥ�е�һ�����ֵ��')
OutputPath(Chrom(1,:));
Rlength=PathLength(D,Chrom(1,:));   %RlengthΪ·������
disp(['�ܾ��룺',num2str(Rlength)]);
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
%%�Ż�
gen=0;
figure;
hold on;
box on
xlim([0,MAXGEN])                      %�����Ż�����ͼ
title('PMX�Ż�����')
xlabel('����')
ylabel('����ֵ')                       %·�߳���
ObjV=PathLength(D,Chrom);                %����·�߳���
preObjV=min(ObjV);
while gen<900
    %%������Ӧ��
    ObjV=PathLength(D,Chrom);           %����·�߳���
    %fprintf('%d   %1.10f\n',gen,min(ObjV))
   line([gen-1,gen],[preObjV,min(ObjV)]);pause(0.0001)

   preObjV=min(ObjV);
   FitnV=Fitness(ObjV);
   %%ѡ��
   SelCh=Select(Chrom,FitnV,GGAP);
   %%�������
   SelCh=PMX_combin(SelCh,Pc);
   %%����
   SelCh=Mutate(SelCh,Pm);
   %%��ת����
   SelCh=Reverse(SelCh,D);
   %%�ز����Ӵ�������Ⱥ
   Chrom=Reins(Chrom,SelCh,ObjV);
   %%���µ�������
   gen=gen+1;
end
ten = 0;
Chrom2=InitPop(NIND,N);
figure;
hold on;
box on
xlim([0,MAXGEN])                      %�����Ż�����ͼ
title('OX�Ż�����')
xlabel('����')
ylabel('����ֵ')                       %·�߳���
ObjV2=PathLength(D,Chrom2);                %����·�߳���
preObjV=min(ObjV2);
while ten<900
    %%������Ӧ��
   ObjV2=PathLength(D,Chrom2);           %����·�߳���
    %fprintf('%d   %1.10f\n',gen,min(ObjV))
   line([ten-1,ten],[preObjV,min(ObjV2)]);pause(0.0001)
   preObjV=min(ObjV2);
   FitnV=Fitness(ObjV2);
   %%ѡ��
   SelCh=Select(Chrom2,FitnV,GGAP);
   %%�������
   SelCh=OX_combin(SelCh,Pc);
   %%����
   SelCh=Mutate(SelCh,Pm);
   %%��ת����
   SelCh=Reverse(SelCh,D);
   %%�ز����Ӵ�������Ⱥ
   Chrom2=Reins(Chrom2,SelCh,ObjV2);
   %%���µ�������
   ten=ten+1;
end
%%���Ƴ����Ž��·��ͼ
ObjV=PathLength(D,Chrom);%����·�߳���
ObjV2=PathLength(D,Chrom2);%����·�߳���
[minObjV,minInd]=min(ObjV);
[minObjV2,minInd2]=min(ObjV2);
DrawPath(Chrom(minInd(1),:),X)
DrawPath2(Chrom2(minInd2(1),:),X)
%%������Ž��·�ߺ��ܾ���
disp('PMS���Ž⣺')
p=OutputPath(Chrom(minInd(1),:));
disp(['PMS�ܾ��룺',num2str(ObjV(minInd(1)))]);
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
disp('OX���Ž⣺')
p=OutputPath(Chrom2(minInd2(1),:));
disp(['OX�ܾ��룺',num2str(ObjV2(minInd(1)))]);
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')

          
