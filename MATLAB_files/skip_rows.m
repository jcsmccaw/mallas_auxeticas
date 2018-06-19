function [P_skipped, new_detail] = skip_rows(P, skip, detail)
the_professor_too = 1;
new_detail = floor(detail/skip);
P_skipped = ones(detail, 3, floor(detail/skip));
for gilligan = 1:skip:detail
    P_skipped(:,:,the_professor_too) = P(:,:,gilligan);
    the_professor_too = the_professor_too + 1;
end

% Checking skipped surface:
%figure
%hold on
%for q = 1:floor(detail/skip)
    %scatter3(P_skipped(:,1,q), P_skipped(:,2,q), P_skipped(:,3,q))
%end
end