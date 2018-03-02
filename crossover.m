% �������
% population_size: ��Ⱥ��С
% chromosome_size: Ⱦɫ�峤��
% cross_rate: �������



function crossover(population_size, chromosome_size, cross_rate)
global population;
global Distance;

% ����Ϊ2 ������Ⱥ
for i=1:2:population_size
    % rand<������ʣ������������Ⱦɫ�崮���н������
    if(rand < cross_rate)
        c = population(i,1);
        flag = 1;
        flag1 = 1;
        for k = 2:chromosome_size
            if(population(i,k) ~= c) 
                flag=0;
            end
        end
        c = population(i+1,1);
        for k = 2:chromosome_size
            if(population(i+1,k) ~= c) 
                flag1=0;
            end
        end
        if(flag == 1 || flag1 == 1) 
            continue; %flag=1˵��ֻ��һ����Ŧ�㣬������
        else%����
            %�ҳ���һ������Ŧ��
            num1 = 0; hub1 = zeros(1,1);  
            for k = 1:chromosome_size
                if (population(i,k)==k) %�ҳ�����Ŧ�ĵ� 
                    num1 = num1 + 1;
                    hub1(num1) = k;
                end
            end
            %�ҳ��ڶ�������Ŧ��
            num2 = 0; hub2 = zeros(1,1);  
            for k = 1:chromosome_size
                if (population(i+1,k)==k) %�ҳ�����Ŧ�ĵ� 
                    num2 = num2 + 1;
                    hub2(num2) = k;
                end
            end
            %���ѡ����н���
            %ѡ�񽻲����
            a = rand();
            if(num1>num2)
                num = a*(num2-1) +1;
            else 
                num = a*(num1-1) + 1;
            end
           num = floor(num);
           cross1 = zeros(1,num); %1�б���������Ŧ
           cross2 = zeros(1,num); %2�б���������Ŧ
           for n = 1:num
               a = rand();
               cross1(n) = hub1(floor(a*num1+1));
           end
           for n = 1:num
               a = rand();
               cross2(n) = hub2(floor(a*num2+1));       
           end

          
           for m = 1:num
               %�ҳ���������Ŧ�����нڵ�
               nodeNum1 = 0 ; nodeNum2 = 0;
               nodes1 = zeros(1,2);
               nodes2 = zeros(1,2);
               for n = 1:chromosome_size
                   if (population(i,n) == cross1(m))
                       population(i,n) = 0;
                       if n ~= cross1(m)
                           nodeNum1 = nodeNum1 + 1;
                           nodes1(nodeNum1) = n;
                       end
                   end
               end
               for n = 1:chromosome_size
                   if (population(i+1,n) == cross2(m))
                       population(i+1,n) = 0;
                       if n ~= cross2(m)
                           nodeNum2 = nodeNum2+ 1;
                           nodes2(nodeNum2) = n;
                       end
                   end
               end

               %��cross2����1
               %��Ŧ��ı�
               population(i,cross2(m)) = cross2(m);
               %��hub�е�������
               for n = 1:num1
                   if(hub1(n)==cross1(m)) 
                       hub1(n) = cross2(m);   
                   end
               end
               %��cross2���ӵĽڵ����1
               for n = 1:nodeNum2
                   if (population(i,nodes2(n)) == 0) %����ýڵ���1��û������Ŧ���򽫸ýڵ�����cross2��
                       population(i,nodes2(n)) = cross2(m);
                   else
                       %����ýڵ�������Ŧ���򽫸ýڵ�����������Ŧ���������Ŧ
                       f = Distance(hub1(1),nodes2(n));
                       g = hub1(1);
                       for e = 2:num1
                           if Distance(hub1(e),nodes2(n)) < f
                               f = Distance(hub1(e),nodes2(n));
                               g = hub1(e);
                           end
                       end
                       population(i,nodes2(n)) = g;
                   end
               end
               
               %��cross1����2 
               population(i+1,cross1(m)) = cross1(m);
               %��Ŧ��ı�
               for n = 1:num2
                   if(hub2(n)==cross2(m)) 
                       hub2(n) = cross1(m);
                   end
               end
               for n = 1:nodeNum1
                   if (population(i+1,nodes1(n)) == 0) %����ýڵ�û������Ŧ���򽫸ýڵ�����cross1��
                       population(i+1,nodes1(n)) = cross1(m);
                   else
                       %����ýڵ�������Ŧ���򽫸ýڵ�����������Ŧ���������Ŧ
                       f = Distance(hub2(1),nodes1(n));
                       g = hub2(1);
                       for e = 2:num2
                           if Distance(hub2(e),nodes1(n)) < f
                               f = Distance(hub2(e),nodes1(n));
                               g = hub2(e);
                           end
                       end
                       population(i+1,nodes1(n)) = g;
                   end
               end
           end
           %���ڻ�û���ӵĽڵ㣬�Ҿ������������
           for m = 1:chromosome_size
               %��һ��
               if population(i,m) == 0
                    f = Distance(m,hub1(1));
                    g = hub1(1);
                    for e = 2:num1
                        if Distance(hub1(e),m) < f
                            g = hub1(e);
                            f = Distance(hub1(e),m);
                        end
                    end
                    population(i,m) = g;
               end
               %�ڶ���
                if population(i+1,m) == 0
                    f = Distance(m,hub2(1));
                    g = hub2(1);
                       for e = 2:num2
                           if Distance(hub2(e),m) < f
                               f = Distance(hub2(e),m);
                               g = hub2(e);
                           end
                       end
                       population(i+1,m) = g;
               end
           end
        end
    end
end   
    
%clear i;
%clear j;
%clear k;
%clear m;



end




