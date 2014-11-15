dcenterY=12;
if(mouse_x>px+ctrl_panel_o.sliderTrackX+10 &&
    mouse_x<=px+ctrl_panel_o.sliderTrackX+110 &&
    mouse_y>py+ctrl_panel_o.sliderTrackY-dcenterY &&
    mouse_y<=py+ctrl_panel_o.sliderTrackY+dcenterY)
    sliderPos=mouse_x-(ctrl_panel_o.sliderTrackX+10);
