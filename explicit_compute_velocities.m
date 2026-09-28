%Computes the vertex coordinates that describe a legal linkage configuration
%INPUTS:
%vertex_coords_guess: a column vector containing the (x,y) coordinates of every vertex
%                      these coords are just a GUESS! It's used to seed Newton's method
%leg_params: a struct containing the parameters that describe the linkage
%theta: the desired angle of the crank
%OUTPUTS:
%DVdt: a matrix containing the velocities for the leg tip
function DVdt = explicit_compute_velocities(vertex_coords_guess, leg_params, theta)
    cvc = (@theta) compute_coords(vertex_coords_guess, leg_params, theta);
    DVdt = approximate_jacobian(cvc, theta);
end