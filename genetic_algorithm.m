% Genetic Algorithm for Functional Maximum Problem
% f(x) = x+10*sin(5*x)+7*cos(4*x), x��[0,9]
% Created by Shengjia Yan @2016/4/26

% population_size: ������Ⱥ��С
% chromosome_size: ����Ⱦɫ�峤��
% generation_size: �����������
% cross_rate: ���뽻�����
% mutate_rate: ����������
% elitism: �����Ƿ�Ӣѡ��
% m: �����Ѹ���
% n: ��������Ӧ��
% p: �����Ѹ�����ֵ�������
% q: �����Ѹ����Ա���ֵ
function [m,n,p,q] = genetic_algorithm(population_size, chromosome_size, generation_size, cross_rate, mutate_rate, elitism,least,most)

global G ;              % ��ǰ��������
global fitness_value;   % ��ǰ����Ӧ�Ⱦ���
global best_fitness;    % ���������Ӧֵ
global fitness_average; % ����ƽ����Ӧֵ����
global best_individual; % ������Ѹ���
global best_generation; % ��Ѹ�����ִ�
global best_fitness_store;
global Distance;

global Flow;
global FixedHubCost;

fitness_average = zeros(generation_size, 1); % �� generation_size*1 ������󸳸� fitness_average
best_fitness_store = zeros(1,generation_size);
disp [ysj genetic algorithm]

fitness_value(population_size) = 0.;
best_fitness = -10e10;
best_generation = 0;

init(population_size, chromosome_size,least,most); % ��ʼ��

for G=1:generation_size   
    fitness(population_size, chromosome_size);                % ������Ӧ�� 
    rank(population_size, chromosome_size);                   % �Ը��尴��Ӧ�ȴ�С��������
    selection(population_size, chromosome_size, elitism);     % ѡ�����
    crossover(population_size, chromosome_size, cross_rate);  % �������
    mutation(population_size, chromosome_size, mutate_rate);  % �������
end

plotGA(generation_size);% ��ӡ�㷨��������

best_individual   % �����Ѹ���
best_fitness       % ��������Ӧ��
p = best_generation;    % �����Ѹ������ʱ�ĵ�������


clear i;
clear j;

