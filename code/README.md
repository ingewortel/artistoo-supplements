The source script files contain the code used to assess Artistoo performance. Artistoo 
node scripts require also the file `artistoo-cjs.js` in the `build/` folder. To run the 
code, please follow the following instructions: After installing nodejs and its package 
manager npm as described [here](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm), 
download this repository, enter it from the command line, and run `npm install` in this 
folder (the files `package.json` and `package-lock.json` should be located here; they tell 
npm which packages to install). Then, you can run the script by running:

```node [script name]```

(Note that while no software installation is required for browser simulations, the 
console simulations
rely on nodejs and require users to install node and its packages).

For Morpheus simulations, model files are provided in xml format. Open Morpheus (v2.1.0) 
and click ”open” to select the correct xml file; then click ”start”.