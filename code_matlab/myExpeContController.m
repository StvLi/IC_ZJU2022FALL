%   My Controller used in Expert Control
%       created by StvLi 20221202

%       input: 3 state coorinates & Control State
%       x1  angle
%       x2  angular velocity
%       x3  force
%       ContState

%       output: 
%       u   output value
function u = myExpeContController( x , ContState )
    boundary = 100;
    switch( ContState )
        %       0   little angle slow velocity
        case 0
            A = [
                0       1   0   ;
                19.6    0   0   ;
                0       0   -100;
                ];
            B = [ 0 -0.444 100]';
            Q = diag([1 1 0]);
            R = 1;
            [K,~,~] = lqr(A,B,Q,R);
            u = -K*x;
            if( u > boundary )
                u = boundary;
            end
            if(u < -boundary )
                u = -boundary;
            end
%             disp("Controller DONE State: 0");

        %       1   little angle fast velocity
        case 1
            A = [
                0       1   0   ;
                19.6    0   0   ;
                0       0   -100;
                ];
            B = [ 0 -0.444 100]';
            Q = diag([1 16 0]);
            R = 9;
            [K,~,~] = lqr(A,B,Q,R);
            u = -K*x;
            if( u > boundary )
                u = boundary;
            end
            if(u < -boundary )
                u = -boundary;
            end
%             disp("Controller DONE State: 1");

        %       2   large angle
        case 2
            u = sign(x(1))*boundary;
%             disp("Controller DONE State: 2");
        case 3
            u = sign(x(2))*boundary;
        case 4
            u = 0 ;
        otherwise
            disp("ERROR STATE!")
    end
    
end