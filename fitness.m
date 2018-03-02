% ������Ⱥ������Ӧ�ȣ��Բ�ͬ���Ż�Ŀ�꣬�޸�����ĺ���
% population_size: ��Ⱥ��С
% chromosome_size: Ⱦɫ�峤��

function fitness(population_size, chromosome_size)
global fitness_value;
global population;
global Distance;
global TravelTime;
global Flow;
global FixedHubCost;

distance_con = 0.5;%�����ı���ϵ��
HubToHub_con = 0.5;%��Ŧ����Ŧ��˥��ϵ����
Time_con = 1;

% ������Ⱥ������Ӧ�ȳ�ʼ��Ϊ0
for i=1:population_size
    fitness_value(i) = 0.;    
end

for m=1:population_size
    NodeToHub = 0; %�ӽڵ㵽��Ŧ��ĳɱ�
    HubToHub = 0; %����Ŧ����Ŧ�ĳɱ�
    HubToNode = 0; %����Ŧ���ڵ�ĳɱ�
    FixedCost  = 0; %�̶��ɱ�
    TimeQ = 0;%��������

    Oi = 0; %��i�㷢�������У�һ���ţ�
    Di = 0; %��i����յ������У����ţ�
    
    %�������нڵ㵽��Ŧ�ĳɱ�
    for i = 1:chromosome_size %i����ڵ�
        Oi = 0;
        if (population(m,i)~=i)  %�ҳ��ǽڵ�ĵ�
            for j= 1:chromosome_size
                Oi  =  Oi + Flow(i,j);
            end
            %k������Ŧ��
            for k = 1:chromosome_size
                if (population(m,k)==k) %�ҳ�����Ŧ�ĵ� 
                    if(population(m,i )== k) %����ڵ�i����Ŧk������
                        NodeToHub = NodeToHub + distance_con*Distance(i,k)*Oi;
                    end
                end
            end
        end
    end
    
    %������Ŧ���ڵ�����гɱ�
    for i = 1:chromosome_size %i����ڵ�
        Di = 0;
        if (population(m,i)~=i)  %�ҳ��ǽڵ�ĵ�
            for j= 1:chromosome_size
                Di  =  Di + Flow(j,i);
            end
            %k������Ŧ��
            for k = 1:chromosome_size
                if (population(m,k)==k) %�ҳ�����Ŧ�ĵ� 
                    if(population(m,i)== k) %����ڵ�i����Ŧk������
                        HubToNode = HubToNode + distance_con*Distance(i,k)*Di;
                    end
                end
            end
        end
    end
          
    %������Ŧ����Ŧ֮������гɱ� ȫ����
    %�ҳ�������Ŧ��
    num = 0;
     for k = 1:chromosome_size
         if (population(m,k)==k) %�ҳ�����Ŧ�ĵ� 
             num = num + 1;
             hub(num) = k;
         end
     end
     for i = 1:num
         for j = 1:num
             for k = 1:chromosome_size
                 HubToHub = HubToHub + HubToHub_con*distance_con*Distance(hub(i),hub(j))*Fijk(m, hub(i),hub(j),k,chromosome_size);
             end
         end
     end

    
    %����̶��ɱ�
    for k = 1:chromosome_size 
        if (population(m,k)==k)  %�ҳ���Ŧ��
            FixedCost = FixedCost + FixedHubCost(k);
        end
    end
    
    %����ʱ�������ɱ�
     TimeQ = maxTravalTime(m,chromosome_size);
    
    %�����ܵ���Ӧ��
    fitness_value(m) = -(NodeToHub + HubToHub + HubToNode + FixedCost + Time_con*TimeQ) ;
 %   HubToHub
end

clear i;
clear j;
clear k;
clear m;
clear Oi;
clear Di;
