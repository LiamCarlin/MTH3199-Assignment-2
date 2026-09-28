%Computes the theta derivatives of each vertex coordinate for the Jansen linkage
%INPUTS:
%vertex_coords: a column vector containing the (x,y) coordinates of every vertex
% these are assumed to be legal values that are roots of the error funcs!
%leg_params: a struct containing the parameters that describe the linkage
%theta: the current angle of the crank
%OUTPUTS:
%dVdtheta: a column vector containing the theta derivates of each vertex coord
function dVdtheta = implicit_compute_velocities(vertex_coords, leg_params, theta)
    jacobian = approximate_jacobian(linkage_error_func(vertex_coords, leg_params), theta);
    B = zeros(14, 1);
    l = leg_params.crank_length;
    B(1:2) = [-l*sin(theta), l*cos(theta)];
    I = eye(4);
    O = zeros(4, 10);
    M = [[I, O]; jacobian];
    dVdtheta = M \ B;
 end