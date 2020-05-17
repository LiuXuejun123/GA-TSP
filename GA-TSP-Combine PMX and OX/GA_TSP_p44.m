%GA_TSP基于遗传算法的旅行商问题
clear
clc
close all
X = ceil(rand(30,2)*100) %随机30个城市的坐标位置
NIND=100;        %种群规模大小
MAXGEN=1000;      %迭代次数
Pc=0.9;              %交叉概率
Pm=0.05;             %变异概率
GGAP=0.9;            %代沟（generation gap)
D=Distanse(X);      %生成距离矩阵
N=size(D,1);        %城市个数，现（20*20），（34*34），
%%初始化种群
Chrom=InitPop(NIND,N);
%%在二维图上绘制出所有的坐标点
%figure
%plot(X(:,1),X(:,2),'o');

%%输出随机解的路线和总距离
disp('初始种群中的一个随机值：')
OutputPath(Chrom(1,:));
Rlength=PathLength(D,Chrom(1,:));   %Rlength为路径长度
disp(['总距离：',num2str(Rlength)]);
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
%%优化
gen=0;
figure;
hold on;
box on
xlim([0,MAXGEN])                      %绘制优化迭代图
title('PMX优化过程')
xlabel('代数')
ylabel('最优值')                       %路线长度
ObjV=PathLength(D,Chrom);                %计算路线长度
preObjV=min(ObjV);
while gen<900
    %%计算适应度
    ObjV=PathLength(D,Chrom);           %计算路线长度
    %fprintf('%d   %1.10f\n',gen,min(ObjV))
   line([gen-1,gen],[preObjV,min(ObjV)]);pause(0.0001)

   preObjV=min(ObjV);
   FitnV=Fitness(ObjV);
   %%选择
   SelCh=Select(Chrom,FitnV,GGAP);
   %%交叉操作
   SelCh=PMX_combin(SelCh,Pc);
   %%变异
   SelCh=Mutate(SelCh,Pm);
   %%逆转操作
   SelCh=Reverse(SelCh,D);
   %%重插入子代的新种群
   Chrom=Reins(Chrom,SelCh,ObjV);
   %%更新迭代次数
   gen=gen+1;
end
ten = 0;
Chrom2=InitPop(NIND,N);
figure;
hold on;
box on
xlim([0,MAXGEN])                      %绘制优化迭代图
title('OX优化过程')
xlabel('代数')
ylabel('最优值')                       %路线长度
ObjV2=PathLength(D,Chrom2);                %计算路线长度
preObjV=min(ObjV2);
while ten<900
    %%计算适应度
   ObjV2=PathLength(D,Chrom2);           %计算路线长度
    %fprintf('%d   %1.10f\n',gen,min(ObjV))
   line([ten-1,ten],[preObjV,min(ObjV2)]);pause(0.0001)
   preObjV=min(ObjV2);
   FitnV=Fitness(ObjV2);
   %%选择
   SelCh=Select(Chrom2,FitnV,GGAP);
   %%交叉操作
   SelCh=OX_combin(SelCh,Pc);
   %%变异
   SelCh=Mutate(SelCh,Pm);
   %%逆转操作
   SelCh=Reverse(SelCh,D);
   %%重插入子代的新种群
   Chrom2=Reins(Chrom2,SelCh,ObjV2);
   %%更新迭代次数
   ten=ten+1;
end
%%绘制出最优解的路线图
ObjV=PathLength(D,Chrom);%计算路线长度
ObjV2=PathLength(D,Chrom2);%计算路线长度
[minObjV,minInd]=min(ObjV);
[minObjV2,minInd2]=min(ObjV2);
DrawPath(Chrom(minInd(1),:),X)
DrawPath2(Chrom2(minInd2(1),:),X)
%%输出最优解的路线和总距离
disp('PMS最优解：')
p=OutputPath(Chrom(minInd(1),:));
disp(['PMS总距离：',num2str(ObjV(minInd(1)))]);
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
disp('OX最优解：')
p=OutputPath(Chrom2(minInd2(1),:));
disp(['OX总距离：',num2str(ObjV2(minInd(1)))]);
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')

          
