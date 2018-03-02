% ��ʼ����Ⱥ
% population_size: ��Ⱥ��С
% chromosome_size: Ⱦɫ�峤��

function init(population_size, chromosome_size,least,most)
global population;
population = zeros(population_size, chromosome_size);
num_hub = 0;
for m=1:population_size
    %���������Ŧ��num_hub
    a = rand();
    num_hub = a*(most-least+1) + least;
    num_hub= floor(num_hub);
    %����Խڵ�ָ��Ϊ��Ŧ�㣬������num_hub����ΧΪ1-�ܽڵ������������
    hub = zeros(1,num_hub);
    for i = 1:num_hub
        f=1;
       while(f==1)
            a = rand();
            j = a*chromosome_size +1;
            j = floor(j);
            f = 0;
            for k=1:i-1
                if(hub(k) == j) f = 1;
                end
            end
        end
   
        hub(i) = j;
        population(m,j) = j;
    end
    %��ʣ�µĽڵ����ѡ��һ����Ŧ���������
    for i=1:chromosome_size
        if(population(m,i) == 0)  %�ҳ��ڵ�
            a = rand();
            j = a*sqrt(num_hub) +1;
            j = floor(j);
            population(m,i) = hub(j);
        end
    end
    num_hub  = 0;
end

for m = 1:population_size
    %�ҳ�������Ŧ
    num = 0; hub = zeros(1,1);  
    for k = 1:chromosome_size
        if (population(m,k)==k) %�ҳ�����Ŧ�ĵ� 
            num = num + 1;
            hub(num) = k;
        end
    end
    %�������Ŧû�����㣬����Ѹ���Ŧ���������Ŧ�Ľڵ�
    for k = 1:num
        number = 0;
        for n = 1:chromosome_size
            if(population(m,n)==hub(k))
                number = number + 1;
            end
        end
        if(number == 1)
            b=k;
            while(b == k || hub(b)==0)
                a = rand();
                b = a*num + 1;
                b = floor(b);
            end
            %hub(k)
            %hub(b)
            population(m,hub(k)) = hub(b);
            hub(k) = 0;
        end
    end
end

clear i;
clear j;

end

