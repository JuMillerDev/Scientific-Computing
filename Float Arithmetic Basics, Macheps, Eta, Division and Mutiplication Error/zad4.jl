#Autor: Yuliia Melnyk

#Finding numbers that don`t deliver the right expected answer.

#Find lowest number that provokes wrong answer so that 1 < x < 2 
function findNumberInRange()
    startNum = one(Float64)
    while startNum < 2.0
        if startNum * (1/startNum) != 1
            return startNum
        end
        startNum = nextfloat(startNum)
    end
end

println("lowest number that provokes wrong answer so that 1 < x < 2:")
println(findNumberInRange())

#Find lowest number that provokes wrong answer so that 0 < x 
function findLowestNumberInRange()
    startNum = nextfloat(zero(Float64)) 
    while startNum * (1/startNum) == one(Float64)
        startNum = nextfloat(startNum)
    end
    startNum
end

println("lowest number that provokes wrong answer so that 0 < x")
println(findLowestNumberInRange())