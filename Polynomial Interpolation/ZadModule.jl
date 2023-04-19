#Autor: Yuliia Melnyk

# Moduł dla zadań 1-3
module zadModule
    include("./zad1.jl")
    include("./zad2.jl")
    include("./zad3.jl")
    include("./zad4.jl")

    export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx
end