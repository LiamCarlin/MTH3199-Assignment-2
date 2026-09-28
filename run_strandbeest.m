function run_strandbeest()
    vertex_coords_guess = [...
    [ 0; 50];... %vertex 1 guess
    [ -50; 0];... %vertex 2 guess
    [ -50; 50];... %vertex 3 guess
    [-100; 0];... %vertex 4 guess
    [-100; -50];... %vertex 5 guess
    [ -50; -50];... %vertex 6 guess
    [ -50; -100]... %vertex 7 guess
    ];
    
    leg_params = define_leg_parameters();
    leg_drawing = initialize_leg_drawing(leg_params);

    for theta = linspace(0, 2*pi, 100)
        vertex_roots = compute_coords(vertex_coords_guess, leg_params, theta);
        update_leg_drawing(vertex_roots, leg_drawing, leg_params)
        drawnow;
    end
end