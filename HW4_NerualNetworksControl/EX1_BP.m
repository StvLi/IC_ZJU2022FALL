%   Neural Network Backward Propagation
%   IC_ZJU2022FALL_HW4_1
%   a BP network designed to solve a difference equation
%   created by StvLi LiPeize 2022-12-28
%       input layer nodes   : 3 - y(k-1) y(k) u(k)
%       output layer nodes  : 1 - y(k+1)
%       hiden layer         : 1
clear;clc;
%   Initiation
    %   set hyper-parameters
    inputNodes  = 3  ;
    hidenNodes  = 50 ;
    outputNodes = 1  ;
    %   set step-length, intertial para
    eta     = 0.99 ;    % learning rate
    alpha   = 0.05 ;    % smooth factor
    scalar  = 2.50 ;    % scalar factor
    Wij = unifrnd(-1,1,hidenNodes,inputNodes+1);  % weight matrix input-hiden
    Wjk = unifrnd(-1,1,outputNodes,hidenNodes+1); % weight matrix hiden-output
    Wij_pre = Wij;  % wij previous step
    Wjk_pre = Wjk;  % wjk previous step
    %   allocate space
    Oi = zeros(inputNodes,1);
    Oj = zeros(hidenNodes,1);
    Ok = zeros(outputNodes,1);
    
for p=1:100000
    %   input and preprocess data
    Oi = 2*rand(inputNodes,1)-ones(inputNodes,1);
    d  = ((Oi(2)-Oi(1))/sqrt(1+Oi(2)*Oi(2))+Oi(3)*Oi(3)*Oi(3))  ...
        /(2*scalar)+0.5;
    %d = Oi(1)*Oi(1)+Oi(2)*Oi(2)+Oi(3)*Oi(3);
    %   Forward Propagation
    temp = Wij*[Oi;1];          % hiden layer 1
    for i = 1:hidenNodes
        Oj(i) = 1/(1+exp(-temp(i)));
    end
    temp = Wjk*[Oj;1];          % output layer
    for i = 1:outputNodes
        Ok(i) = 1/(1+exp(-temp(i)));
    end
    E(p) = 0.5*(d-Ok)*(d-Ok);   % loss function

    %   Backward Propagation
    deltak = Ok.*(1-Ok).*(d-Ok);
    Wij_pre = Wij ;
    Wjk_pre = Wjk ;
    Wij = Wij + eta*sum(deltak*Wjk)*Oj.*(1-Oj)*[Oi;1]'+alpha*(Wij-Wij_pre) ;
    Wjk = Wjk + eta*deltak*[Oj;1]'+alpha*(Wjk-Wjk_pre) ;
    %   Stop Judgement
        %   too many steps
        %   small loss function
end
plot(E)
