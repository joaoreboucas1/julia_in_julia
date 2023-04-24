# Julia in Julia
A simple visual representation of the Mandelbrot and Julia sets.

## Usage
`$ julia julia.jl set n iter xmin xmax ymin ymax out_file`
 - `set`: either `mandelbrot` or `julia`
 - `n`: controls the number of points in each axis
 - `iter`: controls the number of function iterations to check if `abs(z) < 2`
 - `xmin`, `xmax`, `ymin`, `ymax`: the axis limits
 - `out_file`: the name of the output figure