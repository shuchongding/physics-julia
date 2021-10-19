using ApproxFun, Plots, LaTeXStrings

x = Fun(-10..10)
L = -Derivative()^2/2 + x^2/2
S = space(x)
B = Dirichlet(S)
ϵ, Φ = ApproxFun.eigs(B, L, 500, tolerance = 1e-10)

α = 45.18
L_m = -Derivative()^2/2 + α*(1 - exp(-x/sqrt(2*α)))^2
E, Ψ = ApproxFun.eigs(B, L_m, 500, tolerance = 1e-15)

levels = 20

N = zeros(levels)
colors = palette(:darkrainbow, levels)

p = plot(; leg = false, palette = colors, ylim = [0, levels + 1], framestyle = :origin, xlabel = L"x/\sqrt{\frac{\hbar}{m\omega}}", ylabel = L"E/\hbar\omega")

for i in 1:levels
    N[i] = sqrt(sum(Φ[i]^2)).py
    plot!(p, Φ[i]/N[i] + ϵ[i], annotation = (10.5, ϵ[i], ("$i", 10, colors[i])))
end

plot!(x^2/2, linewidth = 2, linecolor = :black)
display(p)