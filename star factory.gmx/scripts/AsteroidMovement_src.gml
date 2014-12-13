if(target.alive){
        if(updateSavedPos) {
            temp_saved_pos++;
            if(temp_saved_pos > saved_pos) {
                saved_pos = temp_saved_pos;     
            }
            //prev_x[saved_pos - 1] = prev_x[saved_pos - 2];
            //prev_y[saved_pos - 1] = prev_x[saved_pos - 2];
            //updateSavedPos = false;
        }
        //if(!fullTranslation){
            for(i = saved_pos - 1; i > 0; i--) {
                prev_x[i] = prev_x[i - 1];
                prev_y[i] = prev_y[i - 1];
            }
            prev_x[0] = x;
            prev_y[0] = y;
        //}
        //frameCounter+=1
        //frameCounter%=frameLimit;
        move_towards_point(target.x, target.y, 2);
        
        if(target.radius + radius >= point_distance(x, y, target.x, target.y)) {
            if(kill) {
                instance_destroy();
            }
        }
        else {
            updateSavedPos = true;
        }       
}
if(!target.alive) {
  instance_destroy();  
}
