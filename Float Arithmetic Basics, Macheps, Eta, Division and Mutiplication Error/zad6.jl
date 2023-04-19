#Autor: Yuliia Melnyk

#Rewrite the function and check whether the result is the same.

function f(x)
    typeOne = one(Float64)
    sqrt(x^2 + typeOne) - typeOne 
end

function g(x)
    typeOne = one(Float64)
    x^2 /(sqrt(x^2 + typeOne) + typeOne) 
end

for i in 1.0:10.0
    println(string("f function for 8^-",i, " :", f(Float64(8^(-i)))))
    println(string("g function for 8^-",i, " :", g(Float64(8^(-i)))))
end