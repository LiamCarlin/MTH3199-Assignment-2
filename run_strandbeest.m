function run_strandbeest()
    close all

    % Sets Latex
    set(groot, 'defaultTextInterpreter', 'latex');
    set(groot, 'defaultTextInterpreter', 'latex');         % This covers Title, Xlabel, Ylabel, Zlabel, and text()
    set(groot, 'defaultLegendInterpreter', 'latex');       % Fixes the Legend
    set(groot, 'defaultAxesTickLabelInterpreter', 'latex'); % Fixes the Axis Numbering / Tick Labels
    set(groot, 'defaultLegendInterpreter', 'latex');
    set(groot, 'defaultAxesTickLabelInterpreter', 'latex');

    vertex_coords_guess = [...
    [ 0; 50];... %vertex 1 guess
    [ -50; 0];... %vertex 2 guess
    [ -50; 50];... %vertex 3 guess
    [-100; 0];... %vertex 4 guess
    [-100; -50];... %vertex 5 guess
    [ -50; -50];... %vertex 6 guess
    [ -50; -100]... %vertex 7 guess
    ];
    
    fig1 = figure(1);
    set(fig1, 'units', 'pixels', 'position', [0 0 1440 1080]);
    leg_params = define_leg_parameters();
    leg_drawing = initialize_leg_drawing(leg_params);
    title('Strandbeast Linkage Animation (No Velocity Overlay)')
    xlabel("Ground (-)");
    ylabel("Air (-)");
    axis([-120, 40, -100, 40]);

    for i = 1:10
        for theta = linspace(0, 2*pi, 100)
            vertex_roots = compute_coords(vertex_coords_guess, leg_params, theta);
            update_leg_drawing(vertex_roots, leg_drawing, leg_params)
            drawnow;
        end
    end
end