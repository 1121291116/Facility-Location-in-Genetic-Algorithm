function [f] = Fijk(m, i,j,k,chromosome_size )
%�����m������ڵ�K����Ŧi��j֮�������
global population;
global Flow;
f = 0;
if (population(m,k) ~= i) 
    f = 0;
else
    %�ҳ���Ŧj���ýڵ�
    num = 0;
     for a = 1:chromosome_size
         if (population(m,a) == j && a~=j)
             num = num +1;
             hub(num) = a;
         end
     end

     %���ڵ�k��j���ӵ����нڵ����������ӣ�
     for a = 1:num
         f = f + Flow(k,hub(a));
     end
     f  = f + Flow(k,j);
end

end

