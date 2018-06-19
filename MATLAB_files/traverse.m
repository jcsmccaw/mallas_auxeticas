function [] =  traverse(P, last_point, fid, feed, ext)


z_dist = abs(max(max(P(:,3,:))) - last_point(3));

fprintf(fid, 'G1 X%f Y%f Z%f F%d E%d ;\n', last_point(1), last_point(2),(z_dist+last_point(3)), feed, ext);

fprintf(fid, 'G1 X%f Y%f Z%f F%d E%d ;\n', P(1,1,end), P(1,2,end),(z_dist+last_point(3)), feed, ext);

fprintf(fid, 'G1 X%f Y%f Z%f F%d E%d ;\n', P(1,1,end), P(1,2,end),P(1,3,1), feed, ext);



end