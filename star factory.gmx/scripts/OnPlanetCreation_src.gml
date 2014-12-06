r = point_distance(x, y, sun_o.x, sun_o.y);
ax = 0;
ay = 0;
vx = 0;
vy = sqrt((G*sun_o.m)/r);

for(i = 0; i < saved_pos; i++) {
    prev_x[i] = x;
    prev_y[i] = y;
}

frameCounter = 0;
frameLimit = 10;
