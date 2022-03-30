# Set the output to a png file
set terminal png size 500,500
# The file we'll write to
set output 'plot.png'
# The graphic title
set title 'Test Plot'
#plot the graphic
plot sin(x)