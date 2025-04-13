using Pkg: Pkg
atreplinit() do repl
    try
        @eval using OhMyREPL
        @invokelatest colorscheme!("BoxyMonokai256")
    catch e
        @warn "error while importing OhMyREPL" e
    end
    try
        @eval using Revise
    catch e
        @warn "Error initializing Revise" e
    end
end
