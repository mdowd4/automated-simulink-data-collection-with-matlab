# automated-simulink-data-collection-with-matlab
<p align="center">
<img src="/images/model.PNG" height=300>
</p>

<p align="center">
<img src="/images/plot.png" width=550> 
</p>

<p align="center">
<img src="/images/table.PNG" height=200>
</p>

## Description
This is a Matlab script that automates the process of simulating a Simulink model and recording output data. Rather than manually changing values in a Simulink model and looking at the graph each time to determine output parameters, this script loops through those model values and calculates the output parameters for each. Automating this process saves time and increases accuracy. The example project here is a PID controller with adjustable integral and derivative gains. However, the Matlab code could be applied to other Simulink projects. 

## Instructions
Open both the Matlab and Simulink files. There is no need to run the Simulink file. Before running the Matlab file, keep in mind that the for-loop runs several simulations that get bigger every time. If your computer is a little bit slower, you may want to edit the loop range to run the code in portions. You could do something like ```for i=1:3``` for the first run. Before running a second time, be sure to comment out ```table = zeros(7, 7)``` because you will lose the data you collected in the previous run. 

For each simulated gain value, the output will look different so you’ll want to run the simulation for an appropriate amount of time. This will give you a good idea of what the output response is, but more importantly will affect whether or not the calculated performance parameters are valid. Check all the Simulink scope plots to make sure that the output response reaches steady-state, then continues for a certain amount of time. The steady-state error is calculated based on the rms value of the response curve, so a longer simulation time will result in a more accurate value. 

You will need to go into the scope settings and enable data logging to an array. This code uses the default array name. 

## Troubleshooting
If you get an error indicating that the variable ```ScopeData``` does not exist, Simulink may be using a single output rather than the array that this code is written for. Go to configuration parameters (gear icon) -> Data Import/Export -> and uncheck single simulation output.  

## History
When I was taking a control systems class, we had a simulation lab for observing the effects of integral and derivative gains in a controller. We had to fill out four different 7x5 tables by changing gain values and manually determining output parameters (such as settle time and overshoot) by looking at the graph. This sounded very tedious and potentially very frustrating if you realized mistakes too late and had to redo tables. I decided instead to spend the lab period figuring out a way to automate this process with the help of my lab partner. He helped me troubleshoot syntax errors and understand the documentation on ```stepinfo()```. I spent the same amount of time writing the script as it probably would have taken to collect the data manually, but I enjoyed it more and got more out of it. I was even able to use the code again in a later lab.
