using Weave
using Plots
default(
    thickness_scaling = 1.5,
    guidefontsize = 12,
    tickfontsize = 12,
    legendfontsize = 8,
    grid = false,
    framestyle = :box,
    minorticks = true,
    tick_direction = :in,
    color_palette = :Dark2,
    margin = 3.0Plots.mm
)

filename = "2022-08-26-integer-twice-sum-digits"
fig_ext = ".png"
weave(
    filename * ".jmd",
    doctype = "github",
    out_path = "../_posts",
    # save to a dummy /assets directory in _posts folder
    fig_path = "assets",
    fig_ext = fig_ext
)

# move to real assets directory that Jekyll can access 
for file in readdir("../_posts/assets/")
    mv("../_posts/assets/"*file, "../assets/"*file, force=true)
end # for

# fix figure paths in weave-generated markdown file
pattern = r"!\[.*\]\((assets)\/.*\)" # capture "assets"
mdfile = "../_posts/"*filename*".md"
lines = readlines(mdfile)
open(mdfile, "w") do file
    for line in lines
        m = match(pattern, line)
        if isnothing(m)
            println(file, line)
        else
            # substitute "assets" with "/assets"
            newline = replace(line, m.captures[1] => "/assets")
            println(file, newline)
        end # if
    end # for
end # do

