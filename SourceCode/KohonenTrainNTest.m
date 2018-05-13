function KohonenTrainNTest(TrainData,TestData )
% Author : REIMMER Meldrick F. (MsCV 1)
% 20/04/2018
% Visual Perception (Human Psychophysics).
% Kohonen Neural Networks
% Supervisor : Prof. Elizabeth Thomas

%% 1) Construct a Kohonen network in order to carry out the classification of the vectors 
disp('Task 1:'); % Displaying Project number
disp(' ');
Input_Vectors = size(TrainData,1);   % Input classes
Output_Vectors = 2;          % Output classes
Learn_Rate = 0.8;            % Learning Rate

disp('Initial Random Weight matrix is:');
weights = mod(randn(Output_Vectors,Input_Vectors), 1) % Initial Weight matrix

% Number of Iterations
Iterations = 50;  

% Each Input vector
for iter = 1:Iterations     
    for N = 1:size(TrainData,1)     % Its distance from every weight vector
        for k = 1:size(weights,1)
            D(k) = sum((TrainData(N,:) - weights(k,:)).^2); % Euclidian Distance
        end
        if D(1)>D(2) % Finding the closest weight vector
            weights(2,:) = (weights(2,:) + (Learn_Rate*(TrainData(N,:) - weights(2,:))));
            % Updating the current weight vector while leaving other unchanged
        else
            weights(1,:) = (weights(1,:) + (Learn_Rate*(TrainData(N,:) - weights(1,:))));
            % Updating the current weight vector while leaving other unchanged
        end
        
        Learn_Rate = 0.9 * Learn_Rate; % To reduce the learning rate
        
    end
end

disp(['Learned Weight matrix is:']);
weights = round((weights*100))./100  % Learned Weights

a = [TrainData(1,:)
    TrainData(3,:)];
X = mean(a(1:2,:));        % Taking mean of first learning cluster

if weights(1,:) == X       % Comparing that mean value with cluster output
    cluster1 = 'Class 2';  % If there will be changes in weight vector the
    cluster2 = 'Class 1';  % Values assigned to output clusters will reversed
end
if weights(2,:) == X
    cluster1 = 'Class 1';
    cluster2 = 'Class 2';
end

%% 2) Once the training is completed carry out a test with the vectors

disp('Test Data for Task 1:');
TestData                     
disp('Results: ');

% Its distance from every weight vectors
for N = 1:size(TestData,1)     
    for k = 1:size(weights,1)
        % Getting euclidian Distance
        D(k) = sum((TestData(N,:) - weights(k,:)).^2); 
    end
    if D(1)>D(2)        % Finding the closest weight vector
        disp(['[',num2str(TestData(N,:)),' ] This Vector Belongs to ',cluster1]);
    else
        disp(['[',num2str(TestData(N,:)),' ] This Vector Belongs to ',cluster2]);
    end
end
            
end