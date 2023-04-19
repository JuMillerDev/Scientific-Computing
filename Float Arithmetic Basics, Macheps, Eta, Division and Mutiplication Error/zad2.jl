#Autor: Yuliia Melnyk

# Program checks macheps for different Float types in unusual way.

numberTypes = [Float16, Float32, Float64]

function kahanMacheps(type)
    oneType = one(type)
    (3*oneType)*((4*oneType)/(3*oneType) - (1*oneType)) - (1*oneType)
end 

println("Machine epsilon:")
for type in numberTypes
    println(string("kahanMacheps() result: ",kahanMacheps(type), "\t\t eps() result: ",eps(type)))
end
