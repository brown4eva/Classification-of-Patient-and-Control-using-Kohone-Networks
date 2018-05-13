function X = KohonenProj2( RealTrainData,RealTestData)
% Author : REIMMER Meldrick F. (MsCV 1)
% 20/04/2018
% Visual Perception (Human Psychophysics).
% Kohonen Neural Networks
% Supervisor : Prof. Elizabeth Thomas


X = [RealTrainData
    RealTestData];           % Concateninating two matrix   
Input_Vectors = size(X,2);   % Input classes
Output_Vectors = 2;          % Output classes
Learn_Rate = 0.8;            % Learning Rate

weights = mod(randn(Output_Vectors,Input_Vectors), 1); 

% Number of Iterations

Iterations = 50;   

%Each Input vector
for iter = 1:Iterations     
    for N = 1:size(X,1)     % Its distance from every weight vector
        for k = 1:size(weights,1)
            D(k) = sum((X(N,:) - weights(k,:)).^2); % Euclidian Distance
        end
        if D(1)>D(2) % Finding the closest weight vector
            weights(2,:) = (weights(2,:) + (Learn_Rate*(X(N,:) - weights(2,:))));
            % Updating the current weight vector while leaving other unchanged
        else
            weights(1,:) = (weights(1,:) + (Learn_Rate*(X(N,:) - weights(1,:))));
            % Updating the current weight vector while leaving other unchanged
        end
        
        Learn_Rate = 0.9 * Learn_Rate; % To reduce the learning rate
        
    end
end

for i = 1: size(weights,1)           % Reducing the errors in weight vector
    for j = 1: size(weights,2)       % By neglecting the values less than
        if weights(i,j) <=0.1        % 0.1 which is not applicable every time
            weights(i,j) = 0;        % But in this training data we can.
        end
    end
end