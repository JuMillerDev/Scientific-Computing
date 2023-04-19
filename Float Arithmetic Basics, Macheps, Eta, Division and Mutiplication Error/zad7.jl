#Autor: Yuliia Melnyk

#Check approximate derivative function result perfomance compared to the real result for sin(x) + cos(3x)

function f(x)
    sin(x) + cos(3*x)
end

#derivative of sin(x) + cos(3x)
function fDerivative(x) 
    cos(x) - (3*sin(3*x))
end

function approxDerivative(x,h)
    (f(x+h) - f(x)) / h
end

function getDifference(x,y)
    abs(x-y) 
end

for n in 0:54
    h = Float64(2.0)^-n
    fd = f(Float64(1.0))
    fappr = approxDerivative(Float64(1.0), h)
    err = getDifference(fd,fappr)
    hl = Float64(1.0) + h
    println(string("n: ", n, ";\n h:", h, ";\t exact derivative:", fDerivative(Float64(1.0)), ";\t approximate derivative:", fappr, ";\t err:",err, ";\t 1+h: ", hl))
end
