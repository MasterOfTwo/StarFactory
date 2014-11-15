dcenterY=12;
if(mouse_x>px+ctrl_panel_o.sliderTrackX &&
    mouse_x<=px+ctrl_panel_o.sliderTrackX+120 &&
    mouse_y>py+ctrl_panel_o.sliderTrackY-dcenterY &&
    mouse_y<=py+ctrl_panel_o.sliderTrackY+dcenterY)
    sliderPos=min(max(0,mouse_x-(px+ctrl_panel_o.sliderTrackX+10)),100);
