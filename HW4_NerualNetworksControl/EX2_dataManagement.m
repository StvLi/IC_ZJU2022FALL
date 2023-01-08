%   Data management
%       from simulink data to training data
%       created by StvLi LiPZ 2023.01.08
for i = 1:10000
    data_in1(i,1) = out.cont1_P(i+100);
    data_in1(i,2) = out.cont1_I(i+100);
    data_in1(i,3) = out.cont1_D(i+100);
    data_out1(i,1)= out.cont1_out(i+100);
    data_in2(i,1) = out.cont2_P(i+100);
    data_in2(i,2) = out.cont2_I(i+100);
    data_in2(i,3) = out.cont2_D(i+100);
    data_out2(i,1)= out.cont2_out(i+100);
end

data_in1 = data_in1'    ;
data_out1 = data_out1'  ;
data_in2 = data_in2'    ;
data_out2 = data_out2'  ;