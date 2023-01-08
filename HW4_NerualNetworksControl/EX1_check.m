inputNodes  = 3  ;
hidenNodes  = 50 ;
outputNodes = 1  ;
trueValueReco = zeros(100);
fitValueReco = zeros(100);
for j = 1:100
    %   input and preprocess data
    Oi(1) = Oi(2);
    Oi(2) = Ok(1);
    Oi(3) = 2*rand(1,1)-ones(1,1);
    d  = ((Oi(2)-Oi(1))/sqrt(1+Oi(2)*Oi(2))+Oi(3)*Oi(3)*Oi(3))  ...
        /(2*scalar)+0.5;
    %   Forward Propagation
    temp = Wij*[Oi;1];          % hiden layer 1
    for i = 1:hidenNodes
        Oj(i) = 1/(1+exp(-temp(i)));
    end
    temp = Wjk*[Oj;1];          % output layer
    for i = 1:outputNodes
        Ok(i) = 1/(1+exp(-temp(i)));
    end
    trueValueReco(j) = d;
    fitValueReco(j) = Ok(1);
end
plot(trueValueReco)
hold on
plot(fitValueReco)