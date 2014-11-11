{
//d3d_draw_torus(x,y,z,radius1,radius2,steps1,steps2)

var xx,yy,zz,xx2,yy2,zz2,rad1,rad2,sub1,sub2,pt1,pt2;

xx=argument0
yy=argument1
zz=argument2
rad1=argument3
rad2=argument4
sub1=argument5
sub2=argument6
pt1=360/sub1
pt2=360/sub2

for(i=0;i<=sub1;i+=1)
    {
    for(j=0;j<=sub2;j+=1)
        {
        xx2[i,j]=lengthdir_x(rad1,i*pt1)+lengthdir_x(lengthdir_x(rad2,j*pt2),i*pt1)
        yy2[i,j]=lengthdir_y(rad1,i*pt1)+lengthdir_y(lengthdir_x(rad2,j*pt2),i*pt1)
        zz2[i,j]=lengthdir_y(rad2,j*pt2)
        }
    }

d3d_primitive_begin(pr_trianglelist)    

for(i=0;i<sub1;i+=1)
    {
    for(j=0;j<sub2;j+=1)
        {
        d3d_vertex_normal_texture(xx+xx2[i,j],yy+yy2[i,j],zz+zz2[i,j],0,0,1,i*pt1/360,j*pt2/360)
        d3d_vertex_normal_texture(xx+xx2[i,j+1],yy+yy2[i,j+1],zz+zz2[i,j+1],0,0,1,i*pt1/360,(j+1)*pt2/360)
        d3d_vertex_normal_texture(xx+xx2[i+1,j+1],yy+yy2[i+1,j+1],zz+zz2[i+1,j+1],0,0,1,(i+1)*pt1/360,(j+1)*pt2/360)

        d3d_vertex_normal_texture(xx+xx2[i,j],yy+yy2[i,j],zz+zz2[i,j],0,0,1,i*pt1/360,j*pt2/360)
        d3d_vertex_normal_texture(xx+xx2[i+1,j+1],yy+yy2[i+1,j+1],zz+zz2[i+1,j+1],0,0,1,(i+1)*pt1/360,(j+1)*pt2/360)
        d3d_vertex_normal_texture(xx+xx2[i+1,j],yy+yy2[i+1,j],zz+zz2[i+1,j],0,0,1,(i+1)*pt1/360,j*pt2/360)
        }
    }
    
d3d_primitive_end()
}