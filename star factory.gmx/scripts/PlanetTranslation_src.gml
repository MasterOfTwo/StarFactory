modulo = sqrt(power(sun_o.x-x,2)+power(sun_o.y-y,2));
gforce = -(G * sun_o.m)/power(modulo,2);
ax = gforce*(sun_o.x-x)/modulo;
ay = gforce*(sun_o.y-y)/modulo;
x+=xspeed*deltaT+(ax*deltaT*deltaT/2);
y+=yspeed*deltaT+(ay*deltaT*deltaT/2);
xspeed+=ax*deltaT;
yspeed+=ay*deltaT;


