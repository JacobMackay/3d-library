/*
    globals
*/
epsilon = 0.1;
loop_epsilon = 0.1;

module hole_plate( size, hole_diameter, hole_margin, hole_count = [ 2, 2 ] )
{
    if( hole_count.x == 0 || hole_count.y == 0 )
    {
        cube( size );
    }
    else
    {
        difference()
        {
            cube( size );

            hole_centre_from_edge = hole_margin + hole_diameter / 2;

            x_hole_dist = hole_count.x > 1 ? ( size.x - 2 * hole_centre_from_edge ) / ( hole_count.x - 1 ) : 0;
            y_hole_dist = hole_count.y > 1 ? ( size.y - 2 * hole_centre_from_edge ) / ( hole_count.y - 1 ) : 0;
            x_values = hole_count.x > 1 ? [hole_centre_from_edge:x_hole_dist:size.x - hole_centre_from_edge + loop_epsilon] : [size.x / 2];
            y_values = hole_count.y > 1 ? [hole_centre_from_edge:y_hole_dist:size.y - hole_centre_from_edge + loop_epsilon] : [size.y / 2];

            // holes
            for( x = x_values, y = y_values )
            {
                translate( [ x, y, size.z / 2 ] )
                {
                    color( "red" ) { cylinder( h = size.z + epsilon, d = hole_diameter, center = true ); }
                }
            }
        }
    }
}

hole_plate( [ 100, 50, 5 ], 6, 4 );
translate( [ 0, 60, 0 ] ) { hole_plate( size = [ 50, 50, 5 ], hole_diameter = 3, hole_margin = 2, hole_count = [ 4, 6 ] ); }
translate( [ 60, 60, 0 ] ) { hole_plate( [ 50, 50, 5 ], hole_diameter = 5, hole_margin = 5, hole_count = [ 2, 1 ] ); }
