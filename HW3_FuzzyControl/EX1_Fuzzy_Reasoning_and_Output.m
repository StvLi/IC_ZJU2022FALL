%   Fuzzy Reasoning & Output
%   IC_ZJU2022FALL_HW3_1
%   Reasoning (A,B)→C
%   created by StvLi LiPeize 2022-12-17
%       Reasonin: max-min
%       Output  : Mamdani
clear;  clc;
%   Input
A_ = [0.2 1.0 0.5 ];
B_ = [0.1 1.0 0.5 ];

%   Fuzzy Sets
A   = [1.0 0.5 0.3; 0.5 0.7 1.0; 0.4 1.0 0.9];
B   = [1.0 0.7 0.4; 0.3 1.0 0.5; 1.0 0.6 0.5];
C   = [0.8 1.0 0.3; 0.3 0.6 1.0; 1.0 0.9 0.6];
cdd = [3 4 5];

%   similarity between Major & Minor Premise
A_simi  = zeros(1,3);
B_simi  = zeros(1,3);
temp    = zeros(1,3);
for i = 1:3 %   similarity between A & A_
    temp    = min([A_;A(i,:)]);
    A_simi(1,i) = max(temp);
end
for i = 1:3 %   similarity between B & B_
    temp    = min([B_;B(i,:)]);
    B_simi(1,i) = max(temp);
end

%   Output
Simi = zeros(3,3);  %   Similarity Matrix
for i = 1:3
    for j = 1:3
        Simi(i,j) = min(A_simi(1,i),B_simi(1,j));
    end
end
nume = 0    ;
deno = 0    ;
for i = 1:3
    temp = min([Simi(i,i)*ones(1,3);C(i,:)]);
    nume = nume + sum(cdd.*temp);
    deno = deno + sum(temp);
end
y = nume/deno;
disp("output = ")
disp(y)
