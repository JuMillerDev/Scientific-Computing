# Autor: Yuliia Melnyk

# Each program function checks results for different float types.

numberTypes = [Float16, Float32, Float64]  #array made to make printing of the output of functions easier

#count the smallest number so fl(1.0+macheps) > 1.0 and fl(1.0+macheps) = 1+macheps
function machEps(type)
    number = one(type)  # one() returns the 1 of given type
    while one(type) + number / 2 != one(type)
        number /= 2
    end
    number
end

println("Machine epsilon:")
for type in numberTypes
    println(string("machEps() result: ",machEps(type), "\t\t eps() result: ",eps(type)))
end


#count the smallest number so number>0
function eta(type)
    number = one(type); #zero() returns the 0 of given type
    while number / 2 != zero(type)
        number /= 2
    end
    number
end

println("\nEta:")
for type in numberTypes
    println(string("eta() result: ",eta(type), "\t\t nextfloat() result: ",nextfloat(type(0.0))))
end



println("\nFloatmin: ")
for type in numberTypes[2:3]    #checking floatmin() for Float32 and Float64
    println(string(type, ": ",floatmin(type)))    
end
println("These are the same as MINnor")
# MINnor = 2^(2-2k)     MINsub = 2^(3-2k-N)
# Conclusion: The difference between these mainly depend on precision (2^(-N))  and MINnor is used to avoid possible anomalies.


#count the biggest number in range of float type
function max(type)
    number = one(type)
    while !isinf(number * 2)
        number *= 2
    end
    #We got the number that is infinity if multiplied by itself
    #Now to get the number closer to the end of range we crop the second number and add its pieces to result.
    addedNumber = number/2;
    while !isinf(number + addedNumber) && addedNumber > 0
        number += addedNumber
        addedNumber /= 2
    end
    number
end

println("\nMAX:")
for type in numberTypes
    println(string("max() result: ",max(type), "\t\t floatmax() result: ",floatmax(type)))
end