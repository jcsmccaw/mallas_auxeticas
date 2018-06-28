%% Playing with Eigenmodes
n = 0:1:2; % modes 0, 3, and 9
num_trace = 4;
L = linspace(0, 6*pi, 50);
k = n*pi/(2*pi);
amp = 1;
figure 
hold on
offset = 0;

for j = 1:num_trace
    for i = 1:numel(n)
        if(i-1 == 0)
            fnx = (-1)^(j)*amp*sin(k(i).*L) + offset;
            fny = (-1)^(j+1)*amp*sin(k(i).*L) + offset;
            color = [1,0,0];
            spec = 'k-';
            if j == num_trace
                lattice = plot(L, fnx, spec);
                plot(fny, L, spec)
            else
                plot(L, fnx, spec);
                plot(fny, L, spec)
            end
        elseif(i-1 == 1)
            fnx = (-1)^(j)*amp*sin(k(i).*L) + offset;
            fny = (-1)^(j+1)*amp*sin(k(i).*L) + offset;
            color = [1,0,0];
            spec = 'b--';
            if j == num_trace
                thirdmode = plot(L, fnx, spec);
                plot(fny, L, spec)
            else
                plot(L, fnx, spec);
                plot(fny, L, spec)
            end
        elseif(i-1 == 2)
            fnx = amp*sin(k(i).*L) + offset;
            fny = -amp*sin(k(i).*L) + offset;
            color = [0,1,0];
            spec = 'r.';
            if j == num_trace
                ninthmode = plot(L, fnx, spec);
                plot(fny, L, spec)
            else
                plot(L, fnx, spec);
                plot(fny, L, spec)
            end
        end   
%         elements(i) = plot(L, fnx, spec);
%         plot(fny, L, spec)
    end
    offset = offset + 2*pi;
end

xlim([-pi/2 13*pi/2])
ylim([-pi/2 13*pi/2])

ylabel('Y    ')
xlabel('X')
title('3^{rd} and 9^{th} Eigenmodes of the quadratic lattice')
set(gca, 'YTick', [])
set(gca, 'XTick', [])
box on
set(get(gca, 'YLabel'), 'Rotation', 0)
set(findobj(gca, 'Type', 'Line', 'Linestyle', '-'), 'LineWidth', 1.5);
legend([lattice, thirdmode, ninthmode], {'Quadratic Lattice', '3^{rd} Eigenmode', '9^{th} Eigenmode'})
legend('boxoff')

legend('Location', 'southoutside')
legend('Orientation', 'horizontal')