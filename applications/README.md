# Applications

The following applications are referred to in the manuscript, and are available in this
repository:

### Application S1: Teaching material
An example exercise used to for teaching workshops on the CPM for beginning users. 
Readers are free to use this material in their own education. Open the pdf to view the
exercise. This file refers to an online simulation, but the same simulation is included 
as Interactive Simulation S6 in the `interactive-html/` folder. The `.tex` file is also
provided so that readers can adapt the exercise for their own purposes.


### Application S2: Slide set
An example slideshow containing a live Artistoo simulation. The slides were built using 
the [revealjs framework](https://revealjs.com), which allows users to build slidesets in 
HTML. To view, please download the repository and open 
`applications/slides-example/index.html` in your web browser. The simulations here use the 
artistoo build in the `build/` folder, so if files are moved elsewhere, please check and 
update the links in the HTML files in `applications/slides-example/simulations/`.

### Application S3: Poster website
A website accompanying a conference poster, which can be shared via a QR code on the 
poster itself. Please visit [https://computational-immunology.org/inge/poster-cpmjs/](https://computational-immunology.org/inge/poster-cpmjs/) 
to view this example.

### Application S4: Research examples
Examples of how to use Node.js scripts for simulation research. One example shows how 
to produce numerical output, the other shows how to deal with produced images.

To use these examples, ensure the following.

First, make sure you have Node.js and its package manager installed as described
[here](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm).

Then, ensure the dependencies are installed correctly. In the command line, make sure you
are in the main folder `artistoo-supplements` and type

```
npm install
```

(if you have run the scripts in the `code/` folder you may have already done this; 
you should see a folder `node_modules`). 

#### Analysing output data

As an example of a Node.js script that outputs data, go to 
`applications/ApplicationS4-research-examples/analysing_data/`:

```
cd applications/ApplicationS4-research-examples/analysing_data
```

From here, you can run the script by typing:

```
node diffusion.js > o.txt
```

Note that this stores output in a file called `o.txt`. We can then analyse the data in 
this file using any other program. In this example, we use R
(make sure you [have R installed](https://www.r-project.org/)):

```
Rscript plot.R
```

A pdf with the output plot will appear. In this example, we perform diffusion with 
Artistoo and compare the simulated output with a numerical solution for different 
'resolutions' and at different time points in the simulation. See the comments on top 
of the `diffusion.js` script for details.


#### A second example: making a movie and a mean-squared displacement plot

Another example of how to produce research outputs with a Node.js script.
We'll use the ActModel example from the code repository.

To run the script (assuming you have already installed Node.js, npm, and the node 
packages as described in the previous section):

```
node run-ActModel.js > data.txt
```

This runs the model, produces images every 10 MCS in `img/`, and outputs the cell's centroids
every 10 MCS to store in the file `data.txt`.

To make an animation, first ensure that you 
[have ffmpeg installed](https://ffmpeg.org/download.html), then run:

```
bash make-gif.bash
```

This will create the animation as `ActModel.gif`. 

Also, we once again might want to analyse the output. Here, we are looking at 
a migrating cell, for which we might wish to compute a mean-squared displacement plot.

Ensure that R is installed as described in the previous section. 
Open R, install the `celltrackR` package, and exit again:

```
R
install.packages( "celltrackR" )
q()
```
Then run the analysis script from the console:

```
Rscript analyse-msd.R
```

This will produce the analysis output `mean-squared-displacement.pdf`. 


