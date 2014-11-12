angle=arctan2(sun_o.y-y,sun_o.x-x);

a=gravity*(sun_o.m/sqrt(point_distance(sun_o.x,sun_o.y,x,y)));

velocityHorizontal += cos(angle)*a;
velocityVertical += sin(angle)*a;

x -= velocityHorizontal;
y -= velocityVertical;
