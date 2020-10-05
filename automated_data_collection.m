% M file find S file
open_system('automated_sim', 'loadonly'); 

% Create arrays of design input values to try 
gain_i = [0.5, 1, 5, 0.5, 0.5, 0.5, 0.5]; 
gain_d = [0.1, 0.1, 0.1, 0.5, 1.5, 5, 100]; 
table = zeros(7, 7);
hold on;

% Loop through each design input value and run in Simulink
for i=1:7
    kp = 1; 
    ki = gain_i(i);
    kd = gain_d(i); 
    
    % Simulate for the appropriate amount of time
    if i<3
	  sim('automated_sim', 10) % 10s sim time
    elseif i<6
        sim('automated_sim', 25) % 25s sim time
    elseif i==6
        sim('automated_sim', 100) % 100s sim time
    else
        sim('automated_sim', 1000) % 1000s sim time
    end
    
    % Collect and plot output parameters
    A = stepinfo(ScopeData(:, 2), ScopeData(:, 1)); 
    plot(ScopeData(:, 1), ScopeData(:, 2)); 
    
    % Record output parameters 
    table(i, 1) = ki; % Proportional gain
    table(i, 2) = kd; % Derivative gain 
    table(i, 3) = A.RiseTime; % Rise time 
    table(i, 4) = A.PeakTime; % Peak time
    table(i, 5) = A.SettlingTime; % Settling time
    table(i, 6) = A.Overshoot; % Percent overshoot 
    table(i, 7) = (1 - rms(ScopeData(:, 2)))*100; % Percent steady-state error
end

% Edit the graph
title('Effects of Derivative and Integral Gain');
xlabel('Time'); 
ylabel('Output'); 
xlim([0 10]);
legend('ki=0.5', 'ki=1', 'ki=5', 'kd=0.5', 'kd=1.5', 'kd=5', 'kd=100');
grid on;
hold off;
