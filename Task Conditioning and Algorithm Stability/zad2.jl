#Autor: Yuliia Melnyk

#Program creates plot and next counts the limit of function to compare results.

using SymPy
using Plots
Type = Float64

fun(x) = Type(exp(x))*Type(log(one(Type)+exp(-x)))
limfun(x) = exp(x)*log(1 + exp(-x))     #Function without chosen float type for limit counting

#Create and display plot
plotly()
x = symbols("x")
plt= plot(fun, -10, 50, legend=false)
display(plt)

print("Limit: ",limit(limfun(x),x=>oo))

