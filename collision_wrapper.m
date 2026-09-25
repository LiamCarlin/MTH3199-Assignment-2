function F = collision_wrapper(X)
    theta = X(1);
    t = X(2);

    projectile_x = 14*cos(theta)*t + 2;
    projectile_y = -0.5*2.3*t^2 + 14*sin(theta)*t + 4;

    target_x = 7*cos(3*t - pi/7) + 2*cos(5*t + 3*pi/2) + 28;
    target_y = 9*sin(3*t - pi/7) + 0.7*sin(5*t + 3*pi/2) + 21;

    F = [projectile_x - target_x;
         projectile_y - target_y];
end