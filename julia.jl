const global MAX_ITERATIONS = 20

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

z_values = [
    1,
    im,
    -1
]

for z in z_values
    if is_in_mandelbrot(z)
        println("The number $z is in the Mandelbrot set")
    else
        println("The number $z is not in the Mandelbrot set")
    end
end