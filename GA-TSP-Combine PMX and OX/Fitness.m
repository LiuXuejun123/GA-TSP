%求种群个体的适应度函数
%输入：
%len  个体的长度（TSP的距离）
%输出：
%FitnV  个体的适应度值
function FitnV=Fitness(len)
FitnV=1./len;
