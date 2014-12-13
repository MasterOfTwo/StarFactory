if(alive){
    if(camera_o.target == object_index) {
        draw_set_color(c_blue)
        d3d_transform_set_identity()
        //2 440 radius
        draw_line(x, y, x + vx*15, y + vy*15)
        draw_set_color(c_yellow)
        draw_line(x, y, x + ax*1000, y + ay*1000)
        d3d_transform_set_identity()
        draw_set_color(c_white)
        
        if(aiming || aimed) {
            show_debug_message("estouaqi");
            show_debug_message(x_mouse_init);
            show_debug_message(y_mouse_init);
            draw_set_color(c_orange)
            d3d_transform_set_identity()
            draw_line(x, y, a_velocityx+x , a_velocityy+y)
            d3d_transform_set_identity()
            draw_set_color(c_white)
            /*pan += (mouse_x - x_mouse_init) * rotspeed_x;
            global.camera_d = pan;
            tilt += (mouse_y - y_mouse_init) * rotspeed_y
            tilt = max(-89.9, min(89.9, tilt))*/
        }
        else {
            x_mouse_init = mouse_x;
            y_mouse_init = mouse_y;
        }   
    }
    
    draw_set_color(color)
    d3d_transform_set_identity()
    d3d_transform_add_translation(x+0,y+0,0)
    //2 440 radius
    d3d_draw_ellipsoid(-radius,-radius,-radius,radius,radius,radius,-1,1,1,20)
    d3d_transform_set_identity()
    draw_set_color(c_white)
}
