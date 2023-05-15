% pixels = colour_object_detection(1)
pixels = get_cubs_locs()
real_coo = pixel_coo_to_real(pixels)
x = real_coo(1)/10
y = real_coo(2)/10
PickandPlace(x,y,-3,10,14,-3)