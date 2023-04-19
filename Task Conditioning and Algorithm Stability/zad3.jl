#Autor: Yuliia Melnyk

#Program solves linear equations given matrix A and vector B.

include("hilb.jl")
include("matcond.jl")

Type = Float64

function solve(A,n)
    x = ones(Type,n)
    b = A * x

    x_gauss = A\b
    x_inv = inv(A)*b

    err_gauss = norm(x_gauss - x)/norm(x)
    err_inv = norm(x_inv - x)/norm(x)

    println(rpad(n, 8), 
        rpad(cond(A), 25), 
        rpad(rank(A), 10), 
        rpad(err_gauss, 25), 
        rpad(err_inv, 25))
end


println("Hilbert's matrix\n")
println(rpad("n", 8), 
        rpad("cond(A)", 25), 
        rpad("rank(A)", 10), 
        rpad("Appr. err. Gauss", 25), 
        rpad("Appr. err. inverse", 25))

for n in 1:3:52
    solve(hilb(n), n)
end

println("\n Random matric\n")
println(rpad("n", 8), 
        rpad("cond(A)", 23), 
        rpad("rank(A)", 10), 
        rpad("Appr. err. Gauss", 25), 
        rpad("Appr. err. inverse", 25))

for n in [5,10,20]
    for c in [0,1,3,7,12,16]
        solve(matcond(n, 10.0^c), n)
    end
end

