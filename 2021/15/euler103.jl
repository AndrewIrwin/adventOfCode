# special subsets

# powersets
function powerset(x::Vector{T}) where T
    result = Vector{T}[[]]
    for elem in x, j in eachindex(result)
        push!(result, [result[j] ; elem])
    end
    result
end

sss = Dict(
 1 => [1],
 2 => [1, 2],
 3 => [2, 3, 4],
 4 => [3, 5, 6, 7],
 5 => [6, 9, 11, 12, 13]
)
# compute sum of all possible subsets

I = 3
p = powerset(sss[I])
s = sum.(p)
l = length.(p)  # length

# all s should be distinct

# when ranked by l, s should be sorted too (allowing ties)

unique(s) == s
length(unique(s)) == length(s)

sum(diff(l[sortperm(s)]) .< 0) == 0


