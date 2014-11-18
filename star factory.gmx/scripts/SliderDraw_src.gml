if(ctrl_panel_o.isOn && !ctrl_panel_o.updating && camera_o.target==sun_o){
    draw_sprite(slider_background_sp,0,px,py);
    draw_sprite(slider_track_sp,0,px+ctrl_panel_o.sliderTrackX,py+ctrl_panel_o.sliderTrackY);
    draw_sprite(slider_sp,0,px+ctrl_panel_o.sliderButtonX+sliderPos,py+ctrl_panel_o.sliderButtonY);
    draw_text(px+ctrl_panel_o.textX,py+ctrl_panel_o.textY,name+": "+string(sliderPos)+"Mt");
}
