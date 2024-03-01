
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This repository is the basis for this paper 
%% "A Novel Hybrid Beamforming Algorithm for Massive MIMO LEO
%% Satellite Communication"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Please, note that a considerable proportion of this code is taken from 
%% this paper "A Kalman based Hybrid Precoding for Multi-User Millimeter 
%% Wave MIMO Systems, Anna, 2016" 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
This repository contains five files:
1- main.m : This file is the main function, you can run the code to generate the Figure 3, 4, and 5 of the paper. 
2- Novel_Algorithm.m : This the file containing our novel algorithm.
3- PE_AltMin.m: This is the file containing PE_ALtMin.m algorithm taken from this paper: Alternating Minimization Algorithms for Hybrid Precoding in Millimeter Wave MIMO Systems, Yu, 2016.
4- DiscreteRFGeneration.m: This file is used for calculating F_RF matrix using OMP and Gram-Schmidt procedure. This is used for the algorithms that find F_BB only. Since we are assuming discrete phase shifters, so we unified all algorithms that find F_BB matrix only to this procedure. While algorithms that find F_BB and F_RF and depend on continous phase shifters were utlized as they are. 
5- doppler_generation_NovelAlgorithm.m: This is an algorithm to estimate the Doppler shift of the LEO satellite channel for specific carrier frequency, elevation angle, and Satellite velocity. 
