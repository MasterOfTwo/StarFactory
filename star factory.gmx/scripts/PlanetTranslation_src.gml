if(alive){
    if(sun_o.radius+radius>=point_distance(x, y, sun_o.x, sun_o.y)){
        alive=0;
        global.planets -= 1;
    }    
    r = point_distance(x, y, sun_o.x, sun_o.y); //distance between the sun and the planet
    dir[1] = dir[0];
    dir[0] = point_direction(x, y, sun_o.x, sun_o.y); //direction between the sun and the planet in degrees
    
    if(!ctrl_panel_o.updatePlanetDirection) {
        canChangeTrail = true;
    }
    
    if(ctrl_panel_o.updatePlanetDirection && canChangeTrail) {
        change_trail++;
        canChangeTrail = false;    
    }
    
    if(change_trail == 1) {
        starting_dir = dir[0];
        temp_saved_pos = 1;
        fullTranslation = false;
        change_trail--;
        ctrl_panel_o.planetsUpdatingTrail++;
    }
    
    r2 = power(x, 2) + power(y, 2);
    r3 = r2 * sqrt(r2);

    orbit_speed = sqrt((G*sun_o.m)/r);
    
    myspeed = orbit_speed;
    
    ax = - ((G * sun_o.m) / r3) * x;
    ay = - ((G * sun_o.m) / r3) * y;
    
    vx += ax;
    vy += ay;
    
    if(updateSavedPos) {
        temp_saved_pos++;               //TO DO - if orbit expands.
        if(num_fulltranslation == 0) {
            saved_pos = temp_saved_pos;     
        }
        updateSavedPos = false;
    }
    for(i = saved_pos - 1; i > 0; i--) {
        prev_x[i] = prev_x[i - 1];
        prev_y[i] = prev_y[i - 1];
    }
    
    prev_x[0] = x;
    prev_y[0] = y;   
    
    x += vx;
    y += vy;
    
    if(saved_pos > 1 && dir[0] < starting_dir && dir[1] > starting_dir) {
            fullTranslation = true;
            num_fulltranslation++;
            saved_pos = temp_saved_pos;
    }
    else {
        if(!fullTranslation) {
            updateSavedPos = true;
        }
    }
}
