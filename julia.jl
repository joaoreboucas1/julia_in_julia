using Plots
using Colors

# Parse command-line options
try
    const global which_set = ARGS[1]
    const global N = parse(Int64, ARGS[2])
    const global MAX_ITERATIONS = parse(Int64, ARGS[3])
    const global XMIN = parse(Float64, ARGS[4])
    const global XMAX = parse(Float64, ARGS[5])
    const global YMIN = parse(Float64, ARGS[6])
    const global YMAX = parse(Float64, ARGS[7])
    const global OUT_NAME = ARGS[8]
catch Exception
    println("Usage: julia $PROGRAM_NAME set n iter xmin xmax ymin ymax out_name")
    println("    set: either mandelbrot or julia")
    println("    n: the number of points in each axis")
    println("    iter: the number of iterations to check if abs(z)<2")
    println("    xmin, xmax, ymin, ymax: axes limits")
    println("    out_name: name of output file")
    exit(1)
end

println("Making visualization of $which_set")


delta_x = (XMAX - XMIN)/N
delta_y = (YMAX - YMIN)/N

function f(z, c)
    z^2 + c
end

function is_in_julia(z, c)
    cur = z
    for i = 1:MAX_ITERATIONS
        cur = f(cur, c)
        if abs(cur) > 2
            return i
        end
    end
    return 0
end

function is_in_mandelbrot(z)
    is_in_julia(z, z)
end

c = -0.4-0.6*1im
color = zeros(UInt8, (N,N))
for i = 1:N, j = 1:N
    x = XMIN + delta_x*(i-1)
    y = YMIN + delta_y*(j-1)
    z = x + y*1im
    color[j,i] = (which_set=="mandelbrot") ? is_in_mandelbrot(z) : is_in_julia(z,c)
end
println("Checked complex numbers. Saving plot...")
heatmap(color, color=:greys)
savefig(OUT_NAME)
println("Saved visualization in $OUT_NAME")