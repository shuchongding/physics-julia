using DifferentialEquations

ω = 2

f(u, p, t) = [[0 1]; [-p[2]^2 -2*p[1]*p[2]]] * u
u0 = [1.0; 0]
tspan = (0.0, 10.0)
prob_Over = ODEProblem(f, u0, tspan, [3 ω])
prob_Criti = ODEProblem(f, u0, tspan, [1 ω])
prob_Under = ODEProblem(f, u0, tspan, [1/3 ω])
sol_Over = solve(prob_Over)
sol_Criti = solve(prob_Criti)
sol_Under = solve(prob_Under)

using Plots
p = plot(sol_Over, vars = (0, 1), label = "Overdamped")
plot!(p, sol_Criti, vars = (0, 1), label = "Critically Damped")
plot!(p, sol_Under, vars = (0, 1), label = "Underdamped")