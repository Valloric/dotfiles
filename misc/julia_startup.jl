using Pkg: Pkg
atreplinit() do repl
    try
        @eval using Revise
    catch e
        @warn "Error initializing Revise" e
    end
end
