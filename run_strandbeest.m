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
    
    fig1 = figure(1); hold on;
    set(fig1, 'units', 'pixels', 'position', [0 0 1440 1080]);
    
    foot_path = plot(NaN, NaN, 'b-', 'LineWidth', 1.5);
    foot_x = [];
    foot_y = [];

    leg_params = define_leg_parameters();
    leg_drawing = initialize_leg_drawing(leg_params);

    velocity_scale = 0.5;
    tip_velocity = quiver(NaN, NaN, NaN, NaN, 0, 'Color', 'm', 'LineWidth', 2, 'MaxHeadSize', 0.8, 'DisplayName', 'Leg-tip velocity');
    legend([foot_path, tip_velocity], {'Leg-tip path', 'Leg-tip velocity'}, 'Location', 'southwest')

    title('Strandbeest Linkage: Leg-Tip Path and Velocity')
    xlabel('$x\;(-)$')
    ylabel('$y\;(-)$')
    axis equal
    axis([-120, 40, -120, 40])

    video = VideoWriter('strandbeest_animation.mp4', 'MPEG-4');
    video.FrameRate = 30;
    video.Quality = 100;
    open(video)

    for i = 1:10
        for theta = linspace(0, 2*pi, 100)
            vertex_roots = compute_coords(vertex_coords_guess, leg_params, theta);
            update_leg_drawing(vertex_roots, leg_drawing, leg_params)
            
            dVdtheta = implicit_compute_velocities(vertex_roots, leg_params, theta);

            set(tip_velocity,'XData', vertex_roots(13), 'YData', vertex_roots(14), 'UData', velocity_scale * dVdtheta(13), 'VData', velocity_scale * dVdtheta(14));

            if i == 1
                foot_x(end+1) = vertex_roots(13);
                foot_y(end+1) = vertex_roots(14);
            end
            set(foot_path, 'XData', foot_x, 'YData', foot_y);
            drawnow;
            writeVideo(video, getframe(fig1))
        end
    end
    close(video)
end