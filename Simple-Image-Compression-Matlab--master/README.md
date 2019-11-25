# Simple-Image-Compression-Matlab-
Simple, somewhat lossy compression algorithm for images. Compression ratio of 33.333% <br />
<br />
It works by storing the only the red, green, or blue values for each pixel. <br />
They are stored in the format of: <br />
| R G B R G B R G B ... | <br />
| G B R G B R G B R ... | <br />
| B R G B R G B R G ... | <br />
| . . .

Once decompressing, the values are then taken at each pixel for their color, <br />
the colors adjacent are averaged and taken as well.<br />
Ex. node(i,j)<br />
&nbsp;&nbsp;&nbsp;&nbsp;|G|<br />
|G|B |R|<br />
&nbsp;&nbsp;&nbsp;&nbsp;|R|<br />
node(i,j).R = [color(i+1, j) + color(i, j+1)]/2;<br />
node(i,j).G = [color(i, j-1) + color(i-1, j)]/2;<br />
node(i,j).B = color(i, j);<br />

If the current node is on an edge, only the available colors adjacent are taken.<br />
