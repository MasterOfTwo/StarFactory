r = point_distance(x, y, sun_o.x, sun_o.y);
dir[0] = point_direction(x, y, sun_o.x, sun_o.y);
dir[1] = dir[0];
starting_dir = dir[0];
change_trail = 0;
canChangeTrail = true;
ax = 0;
ay = 0;
vx = 0;
vy = sqrt((G*sun_o.m)/r);
saved_pos = 1;
temp_saved_pos = 1;
updateSavedPos = false;
fullTranslation = false;
prev_x[0] = x;
prev_y[0] = y;
num_fulltranslation = 0;
