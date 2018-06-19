u = linspace(0,1);
v = linspace(0,1);

% Matrix of Bernstein Polynomial Coefficients:
A = [-1,3,-3,1;3,-6,3,0;-3,3,0,0;1,0,0,0];

%% IDEA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Right now, everything is in terms of the already discretized t. Maybe you
% need to construct both vectors in the same for-loop, then do the
% kronecker tensor multiplication with the tensors immediately in the
% for-loop.

%% Idea 2: more likely, harder to do.
% If above doesn't work, then probably you need to go define the extra
% control points (missing 8 or 9? now), then follow the math for a bezier
% surface. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Trying out a discretized bezier curve:


% Control Points:
p1 = [0,0,0];
p2 = [150,30,0];
p3 = [50,175,0];
p4 = [200,200,0];

ts_u = [u.^3; u.^2; u; ones(1,length(u))];

for(i = 1:length(u))
    K_u(i,:) = ts_u(:,i)'*A; % This is the Bernstein Polynomial for each value of u
    upoints(i,:) = K_u(i,1).*p1 + K_u(i,2).*p2 + K_u(i,3).*p3 + K_u(i,4).*p4;

end
scatter3(upoints(:,1), upoints(:,2), upoints(:,3),'.')
hold on
filename = 'texttest.txt';

fid = fopen(filename, 'w')

for(i = 1:length(upoints(:,1)))
    fprintf(fid, 'G1 X%f Y%f F%d E%d ;\n', round(upoints(i,1),1), round(upoints(i,2),1), 400, 10);
end

fclose(fid)

%% Now, for the Bezier 'Surface' point cloud:

% First, I'll try the Kronecker tensor product, since it should be pretty
% easy.

% Bezier curve 1: see above
% Bezier Curve 2:
q1 = [0,0,0];
q2 = [0,1,0.5];
q3 = [0,1,1];
q4 = [0,1,0];

ts_v = [v.^3; v.^2; v; ones(1,length(v))];
for(j = 1:length(v))
    K_v(j,:) = ts_v(:,j)'*A;
    vpoints(j,:) = K_v(j,1).*q1 + K_v(j,2).*q2 + K_v(j,3).*q3 + K_v(j,4).*q4;

end
%figure
%scatter3(vpoints(:,1), vpoints(:,2), vpoints(:,3),'.')


% Let's get schwifty:
%P = kron(upoints,vpoints); % Kroneck3r tensor product

% See what happens:
%scatter3(P(:,4), P(:,5), P(:,6),'.')
%scatter3(P(:,7),P(:,8), P(:,9),'.')
%legend('Bezier Curve 1','Bezier Curve 2', 'Bezier Surface')
