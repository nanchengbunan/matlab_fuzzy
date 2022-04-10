%% 清理数据
clc          %清出命令行窗口
clear all    %清除工作区所有数据
close all    %关闭所有图像
%% 编写模糊规则NB1\NM2\NS3\ZE4\PS5\PM6\PB7
%模糊规则表
rulea = [7,7,7,7,7,4,4,
         7,7,7,7,6,4,4,
         6,6,6,6,4,3,3,
         6,6,5,4,3,2,2,
         5,5,4,3,2,2,2,
         4,4,2,1,1,1,1,
         4,4,2,1,1,1,1];
%% 定义输入输出变量，并赋值
tip= newfis('fuzzy');      %创建一个模糊推理系统（FIS）
A1=-3;B1=3;                %定义e的取值范围[A1,B1]
C1=(B1-A1)/6;              %6为变量个数-1
A2=-6;B2=6;                %定义ec的取值范围[A2,B2]
C2=(B2-A2)/6;              %6为变量个数-1
A3=-9;B3=9;                %定义u的取值范围[A3,B3]
C3=(B3-A3)/6;              %6为变量个数-1
%% 编写输入输出变量，  均分论域
%设置输入参数e
tip = addvar(tip, 'input','e',[A1,B1]); 
tip = addmf(tip,'input',1,'NB','trimf',[A1,A1,A1+C1]);
% tip = addmf(tip,'input',1,'NB','zmf',[A1,A1+C1]);
tip = addmf(tip,'input',1,'NM','trimf',[A1,A1+C1,A1+2*C1]);
tip = addmf(tip,'input',1,'NS','trimf',[A1+C1,A1+2*C1,A1+3*C1]);
tip = addmf(tip,'input',1,'ZE','trimf',[A1+2*C1,A1+3*C1,A1+4*C1]);
tip = addmf(tip,'input',1,'PS','trimf',[A1+3*C1,A1+4*C1,A1+5*C1]);
tip = addmf(tip,'input',1,'PM','trimf',[A1+4*C1,A1+5*C1,B1]);
% tip = addmf(tip,'input',1,'PB','smf',[A1+5*C1,B1]);
tip = addmf(tip,'input',1,'PB','trimf',[A1+5*C1,B1,B1]);
%设置输入参数ec
tip = addvar(tip, 'input','ec',[A2,B2]); 
tip = addmf(tip,'input',2,'NB','trimf',[A2,A2,A2+C2]);
% tip = addmf(tip,'input',2,'NB','zmf',[A2,A2+C2]);
tip = addmf(tip,'input',2,'NM','trimf',[A2,A2+C2,A2+2*C2]);
tip = addmf(tip,'input',2,'NS','trimf',[A2+C2,A2+2*C2,A2+3*C2]);
tip = addmf(tip,'input',2,'ZE','trimf',[A2+2*C2,A2+3*C2,A2+4*C2]);
tip = addmf(tip,'input',2,'PS','trimf',[A2+3*C2,A2+4*C2,A2+5*C2]);
tip = addmf(tip,'input',2,'PM','trimf',[A2+4*C2,A2+5*C2,B2]);
% tip = addmf(tip,'input',2,'PB','smf',[A2+5*C2,B2]);
tip = addmf(tip,'input',2,'PB','trimf',[A2+5*C2,B2,B2]);
%输出参数u
tip = addvar(tip,'output','u',[A3,B3]); 
tip = addmf(tip,'output',1,'NB','trimf',[A3,A3,A3+C3]);
% tip = addmf(tip,'output',1,'NB','zmf',[A3,A3+C3]);
tip = addmf(tip,'output',1,'NM','trimf',[A3,A3+C3,A3+2*C3]);
tip = addmf(tip,'output',1,'NS','trimf',[A3+C3,A3+2*C3,A3+3*C3]);
tip = addmf(tip,'output',1,'ZE','trimf',[A3+2*C3,A3+3*C3,A3+4*C3]);
tip = addmf(tip,'output',1,'PS','trimf',[A3+3*C3,A3+4*C3,A3+5*C3]);
tip = addmf(tip,'output',1,'PM','trimf',[A3+4*C3,A3+5*C3,B3]);
% tip = addmf(tip,'output',1,'PB','smf',[A3+5*C3,B3]);
tip = addmf(tip,'output',1,'PB','trimf',[A3+5*C3,B3,B3]);
%% 模糊规则
rulelist = [ 1,1,rulea(1),1,1;          %模糊规则，共49条
             1,2,rulea(2),1,1;
             1,3,rulea(3),1,1;
             1,4,rulea(4),1,1;
             1,5,rulea(5),1,1;
             1,6,rulea(6),1,1;
             1,7,rulea(7),1,1;
             
             2,1,rulea(8),1,1;
             2,2,rulea(9),1,1;
             2,3,rulea(10),1,1;
             2,4,rulea(11),1,1;
             2,5,rulea(12),1,1;
             2,6,rulea(13),1,1;
             2,7,rulea(14),1,1;
             
             3,1,rulea(15),1,1;
             3,2,rulea(16),1,1;
             3,3,rulea(17),1,1;
             3,4,rulea(18),1,1;
             3,5,rulea(19),1,1;
             3,6,rulea(20),1,1;
             3,7,rulea(21),1,1;
             
             4,1,rulea(22),1,1;
             4,2,rulea(23),1,1;
             4,3,rulea(24),1,1;
             4,4,rulea(25),1,1;
             4,5,rulea(26),1,1;
             4,6,rulea(27),1,1;
             4,7,rulea(28),1,1;
             
             5,1,rulea(29),1,1;
             5,2,rulea(30),1,1;
             5,3,rulea(31),1,1;
             5,4,rulea(32),1,1;
             5,5,rulea(33),1,1;
             5,6,rulea(34),1,1;
             5,7,rulea(35),1,1;
             
             6,1,rulea(36),1,1;
             6,2,rulea(37),1,1;
             6,3,rulea(38),1,1;
             6,4,rulea(39),1,1;
             6,5,rulea(40),1,1;
             6,6,rulea(41),1,1;
             6,7,rulea(42),1,1;
             
             7,1,rulea(43),1,1;
             7,2,rulea(44),1,1;
             7,3,rulea(45),1,1;
             7,4,rulea(46),1,1;
             7,5,rulea(47),1,1;
             7,6,rulea(48),1,1;
             7,7,rulea(49),1,1;    
    ];
%% 解模糊
tip1 = addrule(tip,rulelist);                  %添加模糊推理的控制规则
tip1 = setfis(tip1,'DefuzzMethod','centroid'); %解模糊化 重心法解模糊化
writefis(tip1,'fuzzy');                        %保存文件
tip1 = readfis('fuzzy');                       %读入创建一个推理模糊系统
%% %绘图
figure(1);
plotmf(tip1,'input',1);
figure(2);
plotmf(tip1,'input',2);
figure(3);
plotmf(tip1,'output',1);
