let fs = require('fs')
let dir = "output"

if (!fs.existsSync(dir)){
    fs.mkdirSync(dir);
}

let CPM = require("../build/artistoo-cjs.js")


/*	----------------------------------
	CONFIGURATION SETTINGS
	----------------------------------
*/
let config = {

	// Grid settings
	ndim : 2,
	field_size : [200,200],
	
	// CPM parameters and configuration
	conf : {
		// Basic CPM parameters
		torus : [true,true],						// Should the grid have linked borders?
		T : 15, //15,								// CPM temperature

		// Constraint parameters. 
		// Mostly these have the format of an array in which each element specifies the
		// parameter value for one of the cellkinds on the grid.
		// First value is always cellkind 0 (the background) and is often not used.
		
		// Adhesion parameters:
		J : [ [NaN, 12, 6], [12, 6, 16], [6, 16, 6] ],
		
		// VolumeConstraint parameters
			// VolumeConstraint importance per cellkind
			// Target volume of each cellkind
		LAMBDA_V : [0,1,1], //2 2
		V : [0,200,200]		//25 25

		
	},
	
	// Simulation setup and configuration
	simsettings : {
	
		// Cells on the grid
		NRCELLS : [50,50],					// Number of cells to seed for all
											// non-background cellkinds.
	
		// Runtime etc
		BURNIN : 0,
		RUNTIME : 2000,
		RUNTIME_BROWSER : 20000,
		
		// Visualization
		CANVASCOLOR : "eaecef",
		CELLCOLOR : ["000000","FF0000"],
		ACTCOLOR : [true,false],			// Should pixel activity values be displayed?
		SHOWBORDERS : [true,true],				// Should cellborders be displayed?
		zoom : 1,							// zoom in on canvas with this factor.
		
		// Output images
		SAVEIMG : true,					// Should a png image of the grid be saved
											// during the simulation?
		IMGFRAMERATE : 100,					// If so, do this every <IMGFRAMERATE> MCS.
		SAVEPATH : dir,				// ... And save the image in this folder.
		EXPNAME : "CellSorting",					// Used for the filename of output images.
		
		// Output stats etc
		STATSOUT : { browser: false, node: true }, // Should stats be computed?
		LOGRATE : 10							// Output stats every <LOGRATE> MCS.

	}
}
/*	---------------------------------- */


/* 	The following functions are defined below and will be added to
	the simulation object.*/
let custommethods = {
	initializeGrid : initializeGrid
}
let sim = new CPM.Simulation( config, custommethods )





/* The following custom methods will be added to the simulation object
below. */
function initializeGrid(){
	
		// add the GridManipulator if not already there and if you need it
		if( !this.helpClasses["gm"] ){ this.addGridManipulator() }
	
		this.gm.seedCellsInCircle( 1, this.conf.NRCELLS[0], this.C.midpoint, this.C.extents[0]/3 )
		this.gm.seedCellsInCircle( 2, this.conf.NRCELLS[1], this.C.midpoint, this.C.extents[0]/3 )

}



sim.run()
