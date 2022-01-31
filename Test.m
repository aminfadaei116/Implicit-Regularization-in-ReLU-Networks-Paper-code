clear; clc; close all
%% The Hyper Parameters and Constant Variables
lr = 1e-4;
alpha = 1;
NUM_itr = 1e6;
init = 1e-6;
Gammas = [0, 1, 2, 5, 20];

%% Using the function
Loss_Type = "L2";
plot_Implicit_Regularization(lr, alpha, NUM_itr, init, Gammas, Loss_Type)
%% Using the function
Loss_Type = "L1";
plot_Implicit_Regularization(lr, alpha, NUM_itr, init, Gammas, Loss_Type)
%% Using the function
Loss_Type = "Log-Cosh";
plot_Implicit_Regularization(lr, alpha, NUM_itr, init, Gammas, Loss_Type)
%% Using the function
Loss_Type = "Huber_Loss";
delta = 0.3;
plot_Implicit_Regularization(lr, alpha, NUM_itr, init, Gammas, Loss_Type, delta)
