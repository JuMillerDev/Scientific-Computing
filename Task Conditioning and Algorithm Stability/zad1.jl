#Autor: Yuliia Melnyk

#Program counts two vector scalar multiplication in different ways to see if the results will be the same.

x64=[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y64=[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

x32 = map(ele -> convert(Float32, ele), x64)
y32 = map(ele -> convert(Float32, ele), y64)

function MultA(x,y)  
    S = 0.0
    for i in eachindex(x)
        S += x[i] * y[i]
    end
    S
end

println("Results using first algorithm")
println(string("Float64: ", MultA(x64,y64)))
println(string("Float32: ", MultA(x32,y32)))

function MultB(x,y)
    S = 0.0
    for i in reverse(eachindex(x))
        S+= x[i] * y[i]
    end
    S
end

println("Results using second algorithm")
println(string("Float64: ", MultB(x64,y64)))
println(string("Float32: ", MultB(x32,y32)))

function MultC(x,y)
    sums = x .* y   #go over all indexes in array and multiply numbers that have same index
    positive = sum(sort(filter(a -> a>0, sums), rev=true))
    negative = sum(sort(filter(a -> a<0, sums)))
  
    positive + negative
end

println("Results using third algorithm")
println(string("Float64: ", MultC(x64,y64)))
println(string("Float32: ", MultC(x32,y32)))

function MultD(x,y)
    sums = x .* y
    positive = sum(sort(filter(a -> a>0, sums)))
    negative = sum(sort(filter(a -> a<0, sums), rev=true))

    positive + negative
end

println("Results using fourth algorithm")
println(string("Float64: ", MultD(x64,y64)))
println(string("Float32: ", MultD(x32,y32)))

