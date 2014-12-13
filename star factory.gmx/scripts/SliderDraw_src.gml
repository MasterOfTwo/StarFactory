if(ctrl_panel_o.isOn && !ctrl_panel_o.updating && camera_o.target==sun_o && !ctrl_panel_o.gameOver){
    //draw_sprite(slider_background_sp,0,px,py);
    draw_set_alpha(0.5);
    draw_roundrect_colour(px,py - 48,px+160, py + 48, c_dkgray, c_dkgray, false);
    draw_set_alpha(1.0);
    
    draw_sprite(slider_track_sp,0,px+ctrl_panel_o.sliderTrackX,py+ctrl_panel_o.sliderTrackY);
    
    
    draw_sprite(slider_sp,0,px+ctrl_panel_o.sliderButtonX+sliderPos,py+ctrl_panel_o.sliderButtonY);
    draw_text(px+ctrl_panel_o.textX,py+ctrl_panel_o.textY,name);
    draw_text(px+ctrl_panel_o.textX,py+ctrl_panel_o.textY+20,string(stored)+"(-"+string(sliderPos)+")");
}
