new_trail = instance_create(0, 0, trail_o);
new_trail.target = object_index;
new_trail.prev_x = x;
new_trail.prev_y = y;
with (new_trail) {
    event_perform(ev_draw, ev_step_normal);
    event_perform(ev_draw, ev_step_end);
}
