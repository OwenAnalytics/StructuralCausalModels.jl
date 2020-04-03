# Load Julia packages (libraries) needed for clip

using StatisticalRethinking
using StatsPlots

ProjDir = @__DIR__

for i in 1:3
  include(rel_path("..", "scripts", "05", "m5.$i.jl"))
end

if success(rc)

  r1 = plotcoef([m5_1s, m5_2s, m5_3s], [:bA, :bM], "$(ProjDir)/Fig-13a.png";
    title="Particles (Normal) estimates")
  display(r1)

  println()
  r2 = plotcoef([m5_1s, m5_2s, m5_3s], [:bA, :bM], "$(ProjDir)/Fig-13b.png"; 
    func=quap, title="Quap estimates")
  display(r2)

end