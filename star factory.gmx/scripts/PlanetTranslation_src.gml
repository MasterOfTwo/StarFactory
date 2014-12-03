if(alive){
    if(sun_o.radius+radius>=point_distance(x, y, sun_o.x, sun_o.y)){
        alive=0;
        global.planets -= 1;
    }
    /*
     * PERFECT CIRCLE ORBITS
     *
    orbit_speed = sqrt((G*sun_o.m)/r);
    
    myspeed=orbit_speed;
    dir += orbit_speed;
    
    x = lengthdir_x(r, dir) + sun_o.x;
    y = lengthdir_y(r, dir) + sun_o.y;
    */
    
    r = point_distance(x, y, sun_o.x, sun_o.y); //distance between the sun and the planet
        
    r2 = power(x, 2) + power(y, 2);
    r3 = r2 * sqrt(r2);

    orbit_speed = sqrt((G*sun_o.m)/r);
    
    myspeed = orbit_speed;
    
    ax = - ((G * sun_o.m) / r3) * x;
    ay = - ((G * sun_o.m) / r3) * y;
    
    vx += ax;
    vy += ay;     
    
    x += vx;
    y += vy;
}
