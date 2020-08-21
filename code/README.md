# Source Scripts

The source script files contain the code used to assess Artistoo performance. Artistoo 
node scripts require also the file `artistoo-cjs.js` in the `build/` folder. To run the 
code, please follow the following instructions: After installing nodejs and its package 
manager npm as described [here](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm), 
download the *complete* `artistoo-supplements` repository, enter it from the command line, and run `npm install` in this 
folder (the files `package.json` and `package-lock.json` should be located here; they tell 
npm which packages to install). Then, you can run the scripts by running:

```node [script name]```

If you do not download the entire repository and run npm install, scripts will not run
as the path to the artistoo build script will be broken, or one of the required modules
will be missing.
(Note that while no software installation is required for browser simulations, the 
console simulations rely on nodejs and require users to install node and its packages).

For Morpheus simulations, model files are included in the Morpheus program. Open Morpheus 
(v2.1.0) and select the correct xml file under "Examples" (as listed under Materials and
Methods); then click ”start”. To alter parameter values in the xml file, right click
the file in the menu on the left and choose "show XML". Copy the code to a local file,
make your changes, and load your updated file by clicking "open". 
Note that users may have to install gnuplot manually to get Morpheus to work.

A list of provided code follows below.


### Source Script S1
Node version of the ”Game of Life” simulation in Figure 1c. This Artistoo script corresponds to Interactive Simulation S2.


### Source Script S2 
Node version of the ”Cell migration” simulation in Figure 1c. This Artistoo script corresponds to Interactive Simulation S3.

### Source Script S3 
Node version of the ”Cell sorting” simulation in Figure 1c. This Artistoo script corresponds to Interactive Simulation S4.


### Source Script S4
Node version of the ”Dividing cells” simulation in Figure 1c. This Artistoo script corresponds to Interactive Simulation S5.


### Source Script S5
Artistoo node script to run the cell sorting model with a variable grid size; corresponds to Figure 1d.
