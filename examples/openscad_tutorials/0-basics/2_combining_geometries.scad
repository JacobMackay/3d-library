// // dimensions in millimeter [width, depth, height]
// plate = [ 100, 50, 5 ];

// hole_diameter = 6;

// // distance from hole edge to plate edge
// hole_margin = 4;

epsilon = 0.1;

module hole_plate( size, hole_diameter, hole_margin )
{

    difference()
    {
        cube( size );

        hole_centre_from_edge = hole_margin + hole_diameter / 2;
        x_values = [ hole_centre_from_edge, size.x - hole_centre_from_edge ];
        y_values = [ hole_centre_from_edge, size.y - hole_centre_from_edge ];

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

hole_plate( [ 100, 50, 5 ], 6, 4 );

translate( [ 0, 60, 0 ] ) { hole_plate( size = [ 50, 50, 5 ], hole_diameter = 3, hole_margin = 2 ); }

translate( [ 60, 60, 0 ] ) { hole_plate( [ 50, 50, 5 ], hole_diameter = 5, hole_margin = 5 ); }
