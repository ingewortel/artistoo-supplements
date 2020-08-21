# Interactive simulations

Interactive simulations are HTML pages that run in the web browser. To view an 
interactive simulation from your web browser, please download the complete repository,
 and double click the simulation inside the interactive-html directory. Please note that 
 these web pages load files from `./build/` and from `./interactive-html/src/`. 
 An isolated HTML file copied to some other folder will therefore not work;
please copy the entire directory or update the paths in the HTML file.

Alternatively, for online access, visit 
[https://ingewortel.github.io/artistoo-supplements](https://ingewortel.github.io/artistoo-supplements).


### Interactive Simulation S1
An example of an explorable simulation, as depicted in Figure 1b. Drag the sliders to 
change parameters in this simulation of a migrating cell; see (Niculescu et al., 2015) 
for details on the model used.


### Interactive Simulation S2
Interactive version of the ”Game of Life” simulation in Figure 1c. This classic model by 
John Conway is a Cellular Automaton (CA), in which pixels switch between two states (0-1)
 according to the number of neighbouring pixels in state 1.


### Interactive Simulation S3 
Interactive version of the ”Cell migration” simulation in Figure 1c. This model once 
again depicts a migrating cell as defined in (Niculescu et al., 2015), but now lets the 
cell migrate between two obstacles.


### Interactive Simulation S4 
Interactive version of the ”Cell sorting” simulation in 
Figure 1c. This classic model was the first CPM as developed by Graner and Glazier 
(Graner and Glazier, 1992). It contains two types of cells, and the adhesion between 
neighbouring cells depends on their type. This results in spontaneous sorting of the 
two mixed cell populations, as is visible in this simulation.


### Interactive Simulation S5
Interactive version of the ”Dividing cells” simulation in Figure 1c. In this model, 
cells have a probability of dividing after each step of the CPM simulation.



### Interactive Simulation S6 
Interactive simulation of ”collective migration”. This simulation is an extension of 
Interactive Simulation S1, but now contains more than one cell and allows users to tune 
more different CPM parameters. See also Application S1. This simulation also serves as 
an example of how interactive CPM simulations can be used to tune parameters.