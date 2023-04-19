#Autor: Yuliia Melnyk

#These programs check the step between Float64 numbers in the given range

function checkStep(startPoint)
    for i in 1:30
        if nextfloat(startPoint)-startPoint != 2^(-52)
            return -1
        end
        startPoint=nextfloat(startPoint)
    end
    nextfloat(startPoint) - startPoint
end

function getStep(startPoint :: Float64, endPoint :: Float64)
    expStart = SubString(bitstring(startPoint),2:12)  
    expEnd = SubString(bitstring(prevfloat(endPoint)),2:12)  

    #between two floats there is one float. When exponents are different we get different float as result
    #So we can`t compare the regular step between. 
    if expStart != expEnd   
        return -1;
    end

    #double precision float exponent is counted by the formula 2^(e-1023)
    #(1 + kδ) is for mantisa, we have exactly 52 bits in mantisa so the precision of a step is 2^(-52)
    ((2.0^(parse(Int, expStart, base = 2) - 1023))*2.0^(-52))
end

function getStep32(startPoint :: Float32, endPoint :: Float32)
    expStart = SubString(bitstring(startPoint),2:9)  
    expEnd = SubString(bitstring(prevfloat(endPoint)),2:9)  

    if expStart != expEnd   
        return -1;
    end

    ((2.0^(parse(Int, expStart, base = 2) - 127))*2.0^(-23))
end

println("Check step for different ranges:")
println(getStep32(Float32(1.0), Float32(2.0)))
println(getStep32(Float32(-124.0), Float32(-124.0)))
println(getStep32(Float32(-126.0), Float32(-125.0)))
println(getStep32(Float32(-127.0), Float32(-126.0)))
println(getStep32(Float32(-128.0), Float32(-127.0)))
println(getStep32(Float32(-129.0), Float32(-128.0)))