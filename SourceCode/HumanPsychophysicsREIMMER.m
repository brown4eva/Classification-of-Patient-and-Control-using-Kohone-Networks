%% Author : REIMMER Meldrick F. (MsCV 1)
% 20/04/2018
% Visual Perception (Human Psychophysics).
% Kohonen Neural Networks
% Supervisor : Prof. Elizabeth Thomas

close all;
clear all;
clc;

%% Project 1
%Training Data
TrainData =  [1,1,0,0;0,0,0,1;1,0,0,0;0,0,1,1];
%Test Data
TestData = [0 0 0 0.9;0 0 0.8 0.9;0.7 0 0 0;0.7 0.9 0 0]; 
KohonenTrainNTest( TrainData,TestData )

%Project 2
% Training data 
RealTrainData = load('control.txt');
% Training data for Patients
RealTestData = load('patient.txt'); 

%To get weight to use for my  personal test data
weights = learn (RealTrainData, RealTestData);
Nweights = reshape(weights,2,650,[]);

% Joing both data to get the weight to use for Project 3
Data = KohonenProj2(RealTrainData,RealTestData);


%Project 3
%Loading My test Data
MyTestData = load('MeldrickTest.txt');
KohonenProj3(Data, MyTestData, Nweights);

%Plotting
figure('NAME','Comparing');
subplot(2,3,1);bar(weights(:,1))
subplot(2,3,2);bar(MyTestData(1,:));
subplot(2,3,3);bar(MyTestData(2,:));
subplot(2,3,4);bar(weights(:,2));
subplot(2,3,5);bar(MyTestData(3,:));
subplot(2,3,6);bar(MyTestData(4,:));