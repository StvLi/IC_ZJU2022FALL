%   My Classifier used in Expert Control
%       created by StvLi 20221202

%       input: 3 state coorinates
%       x1  angle
%       x2  angular velocity
%       x3  force

%       output: 
%       3 control states
%           0   little angle slow velocity
%           1   little angle fast velocity
%           2   large angle
%       2 start states
%           3   slow velocity
%           4   fast velocity

function ContState = myExpeContClassifier( x )
%   Threshold Value Steup
angleThre_0       = 90/180*pi  ;    %   Start or Control
angleThre_1       = 30/180*pi  ;    %   Control:    small or large angle
anguVeloThre_0    = 180/180*pi ;    %   Start:      slow or fast velocity
anguVeloThre_1    = 60/180*pi  ;    %   Control:    slow or fast velocity

    if(abs(x(1)) < angleThre_0)
        if ( abs(x(1)) < angleThre_1)
            if( abs(x(2)) < anguVeloThre_1 )
                ContState = 0 ;
            else
                ContState = 1 ;
            end
        else
            ContState = 2 ;
        end
    else
        if( abs(x(2)) < anguVeloThre_0 )
            ContState = 3 ;
        else
            ContState = 4 ;
        end
    end
%     disp('Classifier DONE State: ');
%     disp(ContState);
end
