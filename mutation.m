% population_size: ��Ⱥ��С
% chromosome_size: Ⱦɫ�峤��
% mutate_rate: �������

function mutation(population_size, chromosome_size, mutate_rate)
global population;

for i=1:population_size
    if rand < mutate_rate
        %�ҳ���Ŧ��
        num = 0; hub = zeros(1,1);  
            for k = 1:chromosome_size
                if (population(i,k)==k) %�ҳ�����Ŧ�ĵ� 
                    num = num + 1;
                    hub(num) = k;
                end
            end
        %���ѡ���������
        a = rand();
        b = a*3 + 1;
        b = floor(b);
        if(num == 1) 
            b = 3;
        end

        switch b
            case 1 %�����ڵ��ƶ�
                %�ҳ�һ���ڵ�
                while(true)
                    a = rand();
                    c = a*chromosome_size + 1;
                    c = floor(c);
                    if(population(i,c) ~= c) 
                        break;
                    end
                end
                d = 0;
                a  = rand();
                d = a*num + 1;
                d = floor(d);
                d = hub(d);
                population(i,c) = d;
            %�����ڵ㽻��
            case 2
                %�ҳ��������Ӳ�ͬ��Ŧ�Ľڵ㽻��
                while(true)
                    a = rand();
                    c = a*chromosome_size + 1;
                    c = floor(c);
                    if(population(i,c) ~= c) 
                        break;
                    end
                end
                while(true)
                    a = rand();
                    c2 = a*chromosome_size + 1;
                    c2 = floor(c2);
                    if(population(i,c2) ~= c2 ) 
                        break;
                    end
                end
                temp = population(i,c2);
                population(i,c2) = population(i,c);
                population(i,c) = temp;
            case 3
               %һ���ڵ��һ����Ŧ����
               a = rand();
               c = a*num + 1;
               c = floor(c);%�ҳ���Ŧ
               c = hub(c);
               %�ҳ�����Ŧ�����нڵ�
               node = zeros(1,1);nodeNum = 0;
               for k = 1:chromosome_size
                   if(population(i,k)==c && k~=c)
                       nodeNum = nodeNum + 1;
                       node(nodeNum) = k;
                   end
               end
               %���ѡȡһ���ڵ�
               a = rand();
               d = a*nodeNum + 1;
               d = floor(d);
               d = node(d);
               for k = 1:chromosome_size
                   if(population(i,k)==c)
                       population(i,k)=d;
                   end
               end
        end

    end
end

clear i;
clear mutate_position;

