escalar = 0.5*power(150,2)/(power(320,2)+power(240,2));
if(r > death_distance) {
    alive = 0;        
}
if(ctrl_panel_o.paused) {
    if(mouse_check_button_pressed(mb_left) && color == draw_getpixel(mouse_x, mouse_y)) {
        aiming = true;
        x_mouse_init = mouse_x-320;
        y_mouse_init = mouse_y-240;        
    }
    if(mouse_check_button_released(mb_left) && color == draw_getpixel(mouse_x, mouse_y)) {
        aiming = false; 
        aimed = false;       
    }
    if(aiming) {
                
       avx = -(x_mouse_init - (mouse_x-320))*escalar;
       avy  = -(y_mouse_init - (mouse_y-240))*escalar;
        
        v = sqrt(power(vx, 2) + power(vy, 2));
        vx_n = vx / v;
        vy_n = vy / v;
        a_velocityx = avx * vx_n + avy * vy_n;
        a_velocityy = avx * (- vy_n) + avy * vx_n;
        if(mouse_check_button_released(mb_left) && color != draw_getpixel(mouse_x, mouse_y)){
            aimed=true;
            aiming=false;
        }
    }
    
    
    if(asteroid != -1) {
        if(radius + asteroid.radius >= point_distance(x, y, asteroid.x, asteroid.y)) {
            planet_life -= 1;
            
            if(planet_life <= 0) {
                global.all_planets[planet_index_pos].alive = 0;
                global.all_planets[planet_index_pos] = 0;
            
                temp_planets = 0;
                new_index = 0;
                count = 0;
                
                for(i = 0; i < global.num_planets; i++) {
                    if(global.all_planets[i] != 0) {
                        count++;
                        temp_planets[new_index] = global.all_planets[i];
                        new_index++;
                    }
                }
                
                global.all_planets = temp_planets;
                global.num_planets = count;
            }
            else {
                asteroidCollided = true;
                pesop= mass/(mass+asteroid.mass);
                pesoa= asteroid.mass/(mass+asteroid.mass);
                collision_vx = vx*pesop + a_velocityx*pesoa;
                collision_vy = vy*pesop + a_velocityy*pesoa;
            }
            
            asteroid.kill = true;
            asteroid = -1;
            ctrl_panel_o.paused = false;
            camera_o.target = sun_o;
        }   
    }
}
if(alive && !ctrl_panel_o.paused){
    if(asteroid == -1 && mouse_check_button(mb_left) && color == draw_getpixel(mouse_x, mouse_y)) {
       camera_o.target = object_index;
       ctrl_panel_o.paused = true;
       ctrl_panel_o.isOn = true;
       //global.camera_z = z; 
       /*asteroid = instance_create(x, y, asteroid_o);
       asteroid.target = object_index;
       with(asteroid) {
        event_perform(ev_create, 0);
        event_perform(ev_draw, 0);
       }*/ 
    }
    if(sun_o.radius + radius >= point_distance(x, y, sun_o.x, sun_o.y)){
        collidedSun = true;
    }
    if(collidedSun) {
        global.all_planets[planet_index_pos].alive = 0;
        global.all_planets[planet_index_pos] = 0;
        
        temp_planets = 0;
        new_index = 0;
        count = 0;
        
        for(i = 0; i < global.num_planets; i++) {
            if(global.all_planets[i] != 0) {
                count++;
                temp_planets[new_index] = global.all_planets[i];
                new_index++;
            }
        }
        
        global.all_planets = temp_planets;
        global.num_planets = count;   
    }
    else {
        for(i = global.num_planets - 1; i >= 0; i--) { 
            if(!(object_index == global.all_planets[i])) {
                if(global.all_planets[i].radius + radius >= point_distance(x, y, global.all_planets[i].x, global.all_planets[i].y)) {
                    num_collision++;
                    last_index_collision = collision_index[0];
                    collision_index[num_collision] = i;  
                }          
            }
            else {
                planet_index_pos = i;
            }
        }
        
        if(num_collision > -1) {
            if(last_index_collision != collision_index[num_collision]) {
                planet_life -= num_collision + 1;
            }
            
            if(planet_life <= 0) {
                global.all_planets[planet_index_pos].alive = 0;
                global.all_planets[planet_index_pos] = 0;
            
                temp_planets = 0;
                new_index = 0;
                count = 0;
                
                for(i = 0; i < global.num_planets; i++) {
                    if(global.all_planets[i] != 0) {
                        count++;
                        temp_planets[new_index] = global.all_planets[i];
                        new_index++;
                    }
                }
                
                global.all_planets = temp_planets;
                global.num_planets = count;
            }
            else {
                va = sqrt(power(global.all_planets[collision_index[0]].vx, 2) + power(global.all_planets[collision_index[0]].vy, 2));
                vp = sqrt(power(vx, 2) + power(vy, 2));
                
                tetaa = point_direction(0, 0, global.all_planets[collision_index[0]].vx, global.all_planets[collision_index[0]].vy);
                tetap = point_direction(0, 0, vx, vy);
                
                dot = vx * global.all_planets[collision_index[0]].vx + vy * global.all_planets[collision_index[0]].vy; 
                phi = arccos(dot / (va * vp));
                
                numerator = vp * cos(tetap - phi) * (mass - global.all_planets[collision_index[0]].mass) + 2 * global.all_planets[collision_index[0]].mass * va * cos(tetaa - phi);
                denominator = mass + global.all_planets[collision_index[0]].mass;
                
                collision_vx = (numerator / denominator) * cos(phi) + vp * sin(tetap - phi) * cos(phi + 90);                    
                collision_vy = (numerator / denominator) * sin(phi) + vp * sin(tetap - phi) * sin(phi + 90);
                //collision_vx = ((mass * vx) + (global.all_planets[collision_index[0]].mass * global.all_planets[collision_index[0]].vx)) / (mass + global.all_planets[collision_index[0]].mass);
                //collision_vy = ((mass * vy) + (global.all_planets[collision_index[0]].mass * global.all_planets[collision_index[0]].vy)) / (mass + global.all_planets[collision_index[0]].mass);
            }
        }
        else {
            last_index_collision = -1;
        }
    }
        
    r = point_distance(x, y, sun_o.x, sun_o.y); //distance between the sun and the planet
    dir[1] = dir[0];
    dir[0] = point_direction(x, y, sun_o.x, sun_o.y); //direction between the sun and the planet in degrees
    
    if(!ctrl_panel_o.updatePlanetDirection) {
        canChangeTrail = true;
    }
    
    if((ctrl_panel_o.updatePlanetDirection || num_collision > -1 || asteroidCollided) && canChangeTrail) {
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
    
    if(num_collision > -1 || asteroidCollided) {
        vx = collision_vx;
        vy = collision_vy;
        num_collision = -1;
        asteroidCollided = false;
    }
    
    if(updateSavedPos) {
        temp_saved_pos++;               
        if(temp_saved_pos > saved_pos) {
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
            saved_pos = temp_saved_pos;
    }
    else {
        if(!fullTranslation) {
            updateSavedPos = true;
        }
    }
}