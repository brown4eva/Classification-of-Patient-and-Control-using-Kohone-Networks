function kohonenProj3(Data, MyTestData, Nweights)
% Author : REIMMER Meldrick F. (MsCV 1)
% 20/04/2018
% Visual Perception (Human Psychophysics).
% Kohonen Neural Networks
% Supervisor : Prof. Elizabeth Thomas

x = mean(Data(:,:));             % Computing row mean vector of first training cluster
for N = 1:size(x,1)           % Its distance from both weight vector
    for k = 1:size(Nweights,1)
        D(k) = sum((x(N,:) - Nweights(k,:)).^2); % Euclidian Distance
    end
    if D(1)>D(2)              % Finding the closest weight vector
        cluster1 = 'Patient'; % Comparing that mean vector with cluster output
        cluster2 = 'Control'; % If there will be changes in weight vector the
    else
        cluster1 = 'Control'; % Values assigned to output clusters will reversed
        cluster2 = 'Patient';
    end
end

disp('  ');
disp('  ');
disp('Test Results using MeldrickTest Data: ');
disp('  ');
for N = 1:size(MyTestData,1)     % Its distance from every weight vector
    for k = 1:size(Nweights,1)
        D(k) = sum((MyTestData(N,:) - Nweights(k,:)).^2); % Euclidian Distance
    end
    if D(1)>D(2)      
        disp(['Test Vector ',num2str(N),' Belongs to ',cluster2]);
    else
        disp(['Test Vector ',num2str(N),' Belongs to ',cluster1]);
    end
 end