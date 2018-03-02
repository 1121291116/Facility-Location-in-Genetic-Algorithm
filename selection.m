%������ѡ��
% population_size: ��Ⱥ��С
% chromosome_size: Ⱦɫ�峤��
% elitism: �Ƿ�Ӣѡ��

function selection(population_size, chromosome_size, elitism)
global population;      % ǰ����Ⱥ
global population_new;  % ��һ����Ⱥ
global fitness_value;

%ÿһ��ȡ����������
Tournum = 4;
TakeOut = zeros(1,Tournum);
num = 0;%Ŀǰ��������һ����Ⱥ����

%ÿ��ȡTourNum������ �������ŵĸ��壬֪����Ⱥ����һ��
while(num ~= population_size)
    for i = 1:Tournum
        a = rand();
        b = a*population_size + 1;
        b= floor(b);
        TakeOut(i) = b;
    end
    take =-10000000000; 
    for i = 1:Tournum
        if(fitness_value(TakeOut(i))>take)
            c = TakeOut(i);
            take = fitness_value(TakeOut(i));
        end
    end
    num = num + 1;
    for i = 1:chromosome_size
        population_new(num,i) = population(c,i);
    end
end

% �Ƿ�Ӣѡ��
if elitism
    p = population_size-1;
else
    p = population_size;
end

for i=1:p
   for j=1:chromosome_size
       % �����Ӣѡ�񣬽�population��ǰpopulation_size-1��������£����һ�����Ÿ��屣��
       population(i,j) = population_new(i,j);
   end
end

clear i;
clear j;
clear population_new;
clear first;
clear last;
clear idx;
clear mid;
 

