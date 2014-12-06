if(alive){
    if(sun_o.radius+radius>=point_distance(x, y, sun_o.x, sun_o.y)){
        alive=0;
        global.planets -= 1;
    }    
    r = point_distance(x, y, sun_o.x, sun_o.y); //distance between the sun and the planet
        
    r2 = power(x, 2) + power(y, 2);
    r3 = r2 * sqrt(r2);

    orbit_speed = sqrt((G*sun_o.m)/r);
    
    myspeed = orbit_speed;
    
    ax = - ((G * sun_o.m) / r3) * x;
    ay = - ((G * sun_o.m) / r3) * y;
    
    vx += ax;
    vy += ay;
    
    if(frameCounter == 0){
        for(i = saved_pos - 1; i > 0; i--) {
            prev_x[i] = prev_x[i - 1];
            prev_y[i] = prev_y[i - 1];
        }
        prev_x[0] = x;
        prev_y[0] = y;
    }
    
    frameCounter += 1;
    frameCounter %= frameLimit;     
    
    x += vx;
    y += vy;
}
