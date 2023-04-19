#Autor: Yuliia Melnyk

include("zadModule.jl")

using .zadModule
using Test

@testset "$(rpad("test z wielomianem", 25))" begin
    w = x -> 5*x^2 + 2*x - 12
    x = [1., 2., 3., 4., 5.]
    y = w.(x)
    println("wartosci wielomianu y: ", y)
    c = ilorazyRoznicowe(x, y)
    val = z -> warNewton(x, c, z)
    @test c == [-5., 17., 5., 0., 0.]
    @test naturalna(x, c) == [-12., 2., 5., 0., 0.]
    @test val.(x) == y

    """
        Wielomian:
        5x^2 + 2x - 12 w postaci naturalnej: -12 + 2x + 5x^2
    """
end

@testset "$(rpad("zad 5 z listy 4 z ćwiczeń", 25))" begin
    x = [-1., 0., 1., 2.]
    y = [2., 1., 2., -7.]
    c = ilorazyRoznicowe(x, y)
    val = z -> warNewton(x, c, z)
    @test c == [2., -1., 1., -2.]
    @test naturalna(x, c) == [1., 2., 1., -2.]
    @test val.(x) == y
end

println("doprowadzenie do postaci newtona dla sprawdzenia poprawności")
x = [-1., 0., 1., 2.]
y = [2., 1., 2., -7.]
c = ilorazyRoznicowe(x, y)
nat = naturalna(x, c)
println(nat)
println(ilorazyRoznicowe(x, nat))

println("doprowadzenie do postaci naturalnej dla sprawdzenia poprawności")


x1 = [-1.,0.,1.,2.]
y1 = [-1.,0.,-1.,2.]

y2 = naturalna(x1, ilorazyRoznicowe(x1, y1))
println("wartosci naturalne: ")
println(y2)


