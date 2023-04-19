#Autor: Yuliia Melnyk

using Plots

"""
Funkcja rysuje wielomian interpolacyjny i interpolowaną funkcję 
w przedziale [a, b] na n+1 równoodległych punktach.
# Dane
f – funkcja do interpolacji zadana jako anonimowa funkcja
a, b – przedział interpolacji
n – stopień wielomianu interpolacyjnego
# Wyniki
p – obiekt rysunku z wykresami wielomianu i funkcji
"""
function rysujNnfx(f,a::Float64,b::Float64,n::Int)
    x = zeros(n+1)
    y = zeros(n+1)
    h = (b-a)/n
    for k in 0:n
        x[k+1] = a + k*h
        y[k+1] = f(x[k+1])
    end
    c = ilorazyRoznicowe(x, y)

    points = 50 * (n+1)
    dx = (b-a)/(points-1)
    xs = zeros(points)
    poly = zeros(points)
    func = zeros(points)
    xs[1] = a
    poly[1] = func[1] = y[1]
    for i in 2:points
        xs[i] = xs[i-1] + dx
        poly[i] = warNewton(x, c, xs[i])
        func[i] = f(xs[i])
    end
    p = plot(xs, [poly func], label=["wielomian" "funkcja"], title="n = $n")
    display(p)
    return p
end