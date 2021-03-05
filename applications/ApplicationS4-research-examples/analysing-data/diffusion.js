/** @file
 *	This simulation numerically solves a 1D diffusion equation
 *
 *	u_t = u_xx
 *
 *  for x \in (0,1) and t \in (0,tmax] with Dirichlet boundary
 *  conditions
 *
 *  u(0,t) = u(1,t) = 0,  t \in (0,tmax]
 *
 *  and initial condition
 *
 *  u(x,0) = sin( pi * x ).
 *
 *  The analytical solution of this equation is
 *
 *  u(x,t) = e^( -pi^2 * t ) * sin( pi * x )
 *
 *  The simulation performs a forward Euler finite difference scheme
 *  to approximate this solution.
 * */
 

let Artistoo = require("../../../build/artistoo-cjs.js")


// this function runs diffusion on a 1D grid of k+1 pixels long.
function run_diffusion( k, tmax ){
	
	// make a 1D grid of k pixels wide with non-periodic boundaries
	let C = new Artistoo.Grid2D( [k+1,1], [false,false], "Float32" )
	
	// set initial condition: y(x,0) = sin( pi*x/k )
	// given that 0 <= x <= k, y ranges from sin(0) = 0 to sin(pi)=0 with sin(pi/2)=1
	// in the middle.
	let delta_x = 1/k
	for( let x = 0 ; x <= k ; x ++ ){
		C.setpix( [x,0], Math.sin( Math.PI*x*delta_x ) )
	}

	// set delta_t accroding to CFL condition
	let delta_t = delta_x * delta_x / 2

	// run diffusion in discrete time with the chosen delta_t
	for( let t = 0 ; t < tmax ; t += delta_t ){
	
		// diffusion with coefficient D depending on dt and dx
		C.diffusion( delta_t / delta_x / delta_x )
		
		// fixed boundary condition: concentration at the ends is always 0
		C.setpix( [0,0], 0 )
		C.setpix( [k,0], 0 )
	}

	// print value of all pixels to the console
	for( let i = 0 ; i < k+1 ; i ++ ){
		console.log( k, tmax, C.pixt( [i,0] ) )
	}
}

for( let k of [4,8,16] ){
	for( let tmax of [0.1,0.5,1.0] ){
		run_diffusion( k, tmax )
	}
}
