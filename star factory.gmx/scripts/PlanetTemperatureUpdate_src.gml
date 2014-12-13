t = (140*power((sun_o.temperature + (1 - absorption)) / (4 * pi * r * r * emission) , 1/4))-70;
temperature=temperature*0.99+t*0.01;
