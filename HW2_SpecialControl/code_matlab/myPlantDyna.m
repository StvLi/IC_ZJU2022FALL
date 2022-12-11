%   My Plant Dynamics Model used in Expert Control
%       created by StvLi 20221202

%       input: 
%       x1  angle
%       x2  angular velocity
%       x3  force
%       u   control value
%       Ts  sampling time

%       output: 
%       x1  angle
%       x2  angular velocity
%       x3  force
function x = myPlantDyna( x , u , Ts )
    x_temp = zeros(1,3);
    
    [ ~ , x_temp ] = ode45(@invePendDyna,[0 Ts],[ x(1) x(2) x(3) ]');
    function dx_temp = invePendDyna(~,x_temp)
        dx_temp = [ x_temp(2);
                    (9.8*sin(x_temp(1))+cos(x_temp(1))*...
                    (-x_temp(3)-0.25*(x_temp(2)^2*sin(x_temp(1))))/1.5)/...
                    (0.5*(4/3-1/3*cos(x_temp(1))^2));
                    -100*x_temp(3) + 100*u; 
                    ];
    end
    % Angle Regulation: [-pi,pi]
    while (x_temp(end,1) > pi)
        x_temp(end,1) = x_temp(end,1)-2*pi;
    end
    while (x_temp(end,1) < -pi)
        x_temp(end,1) = x_temp(end,1)+2*pi;
    end

    x(1) = x_temp(end,1);
    x(2) = x_temp(end,2);
    x(3) = x_temp(end,3);
%     disp('Plant DONE');
end