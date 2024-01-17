/*
    .scad test project
*/
radius_with_a_name = 10; // very important variable

sphere( r = radius_with_a_name );

adjustment = 0.7;
adjustment_factor = 1.05;

function adjust( x ) = ( x + adjustment ) * adjustment_factor;

main_radius = adjust( 10 );
margin = adjust( 5 );
depth = adjust( 25 );
