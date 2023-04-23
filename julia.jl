using Plots
using Colors

# Plot options
const global MAX_ITERATIONS = 20
const global NX = 1000
const global NY = 1000
const global XMIN = -2
const global XMAX = 1
const global YMIN = -1.2
const global YMAX = 1.2
delta_x = (xmax - xmin)/Nx
delta_y = (ymax - ymin)/Ny

function f(z, c)
    z^2 + c
end

function is_in_mandelbrot(z)
    cur = z
    for i = 1:MAX_ITERATIONS
        cur = f(cur, z)
        if abs(cur) > 2
            return false
        end
    end
    return true
end

color = zeros((Ny,Nx))
for i = 1:Nx, j = 1:Ny
    x = xmin + delta_x*(i-1)
    y = ymin + delta_y*(j-1)
    z = x + y*1im
    if is_in_mandelbrot(z)
        print("The number $z is in the Mandelbrot set\n")
        color[j,i] = 1
    else
        print("The number $z is not in the Mandelbrot set\n")
        color[j,i] = 0
    end
end
heatmap(color, color=:greys)
savefig("test.pdf")