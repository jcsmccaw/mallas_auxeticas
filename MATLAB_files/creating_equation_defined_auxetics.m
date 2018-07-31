%% Creating equation-defined 3D auxetics.

u = linspace(-pi/2,3*pi/2, 500)';
v = linspace(-pi/2,3*pi/2, 500)';
t = linspace(-pi/2,3*pi/2, 500)';
unit_size = pi;
amp = 1;
% hold on
% xlabel('X')
% ylabel('Y')
% zlabel('Z')
% % Bottom box:
% x = u ;
% y = amp*sin(x);
% z = 0*ones(500,1) - sin(x);
% scatter3(x,y,z, 'k')
% 
% y = -y + pi;
% scatter3(x,y,z, 'k')
% 
% 
% y = u;
% x = -amp*sin(y);
% z = 0*ones(500,1) - sin(y);
% scatter3(x,y,z, 'k')
% 
% x = -x + unit_size;
% scatter3(x,y,z, 'k')
% 
% % Sides:
% 
% z = u;
% x = amp*sin(z);
% y = unit_size*ones(500,1) - sin(z);
% scatter3(x,y,z, 'k')
% 
% x = -x + unit_size;
% scatter3(x,y,z,'k')
% 
% z = u;
% x = amp*sin(z);
% y = 0*ones(500,1) + sin(z);
% scatter3(x,y,z, 'k')
% 
% x = -x + unit_size;
% scatter3(x,y,z, 'k')
% 
% 
% % Top:
% 
% x = u ;
% z = unit_size*ones(500,1) + sin(x);
% y = amp*sin(x);
% scatter3(x,y,z, 'k')
% 
% y = -y + unit_size;
% scatter3(x,y,z, 'k')
% 
% 
% y = u;
% x = -amp*sin(y);
% z = unit_size*ones(500,1) + sin(y);
% scatter3(x,y,z, 'k')
% 
% x = -x + unit_size;
% scatter3(x,y,z, 'k')

diff_n = 0; % x
diff_m = 0; % y
diff_p = 0; % z

unit_cell(1, diff_n, unit_size, amp)



function [] = unit_cell(n, diff_n, unit_size, amp)
    figure
    hold on
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
     for i = 1:n
        u = linspace(diff_n-0.5*unit_size,diff_n + 1.5*unit_size, 500)';
        v = linspace(diff_n-0.5*unit_size,diff_n + 1.5*unit_size, 500)';
        p = linspace(diff_n-0.5*unit_size,diff_n + 1.5*unit_size, 500)';

        % Bottom box:
        x = u;
        y = amp*sin(x);
        z = 0*ones(500,1) - sin(x);
        scatter3(x,y,z, 'k')

        y = -y + pi;
        scatter3(x,y,z, 'k')


        y = u;
        x = -amp*sin(y);
        z = 0*ones(500,1) - sin(y);
        scatter3(x,y,z, 'k')

        x = -x + unit_size;
        scatter3(x,y,z, 'k')

        % Sides:

        z = u;
        x = amp*sin(z);
        y = unit_size*ones(500,1) - sin(z);
        scatter3(x,y,z, 'k')

        x = -x + unit_size;
        scatter3(x,y,z,'k')

        z = u;
        x = amp*sin(z);
        y = 0*ones(500,1) + sin(z);
        scatter3(x,y,z, 'k')

        x = -x + unit_size;
        scatter3(x,y,z, 'k')


        % Top:

        x = u ;
        z = unit_size*ones(500,1) + sin(x);
        y = amp*sin(x);
        scatter3(x,y,z, 'k')

        y = -y + unit_size;
        scatter3(x,y,z, 'k')


        y = u;
        x = -amp*sin(y);
        z = unit_size*ones(500,1) + sin(y);
        scatter3(x,y,z, 'k')

        x = -x + unit_size;
        scatter3(x,y,z, 'k')
        
        diff_n = diff_n + unit_size;
     end
end

