%Justin Park 101013156
% PA4

nx = 20;
ny = 20;
maxIter = 50;
V = ones(nx,ny);

% Boundary conditions
V(:,1) = 0; 
V(:,ny) = 0;

V(1,:) = 1; 
V(nx,:) = 1;

[X,Y] = meshgrid(1:size(V,2),1:size(V,1));
for n = 1:maxIter
    
    % Electric field plot
    figure(1)
    surf(V)
    zlim([0,1])
    
    % Vector field plot
    figure(2)
    [DX,DY] = gradient(V,1,1);
    quiver(X,Y,DX,DY)
    
    pause(0.05)
    for c = 2: ny-1
        for r  = 2: nx-1
            % Boundary nodes
            V(r,c) = (V(r-1,c)+V(r+1,c)+V(r,c+1)+V(r,c-1))/4

        end
    end
end

%image processing function
figure (3)
boxfilt = imboxfilt(V,3);
imshowpair(V,boxfilt);
