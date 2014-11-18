if(alive){
    if(sun_o.radius+radius>=point_distance(x, y, sun_o.x, sun_o.y)){
        alive=0;
    }
    times = 1000;
    repeat(times) {
        r = point_distance(x, y, sun_o.x, sun_o.y); //distance between the sun and the planet
        dir = point_direction(x, y, sun_o.x, sun_o.y); //direction between the sun and the planet in degrees
        delta_t = delta_time / 1000;
        
        orbit_speed = sqrt((G*sun_o.m)/r);
        
        v = orbit_speed / times ; //each second
        myspeed=orbit_speed;
        
        x += lengthdir_x(v, dir-90);
        y += lengthdir_y(v, dir-90);
    }
}

