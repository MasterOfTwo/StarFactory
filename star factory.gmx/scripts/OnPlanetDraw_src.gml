if(alive){
    draw_set_color(color)
    d3d_transform_set_identity()
    d3d_transform_add_translation(x+0,y+0,0)
    //2 440 radius
    d3d_draw_ellipsoid(-radius,-radius,-radius,radius,radius,radius,-1,1,1,20)
    d3d_transform_set_identity()
    draw_set_color(c_white)
}
