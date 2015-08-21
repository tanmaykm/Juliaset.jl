# Juliaset

Generate [Julia set](https://en.wikipedia.org/wiki/Julia_set) images. This is created primarily as an example for JuliaBox hosted REST APIs.

To use this as a REST API with [JuliaBox](https://juliabox.org/):
- Login to [JuliaBox](https://juliabox.org/)
- Open the JuliaBox settings tab (click the wrench icon on top right)
- Go to the section that says *Published APIs*. If you don't see it, it's probably not enabled for you. Please write to admin@juliabox.org or leave a message in the [JuliaBox forum](https://groups.google.com/forum/#!forum/julia-box) and someone will enable it for you.
- Register a new API:
    - think of a unique API name (`<your_name>_juliaset` is probably a good choice)
    - use the following as command: `Pkg.clone("https://github.com/tanmaykm/Juliaset.jl.git"); using Juliaset; Juliaset.serve_juliabox();`
    - point the description URL to somewhere nice (or maybe to <https://github.com/tanmaykm/Juliaset.jl>)
- Your REST API is now ready. Try the following URLs on your browser. Replace `<api_name>` with your chosen name.
    - `http://api.juliabox.org/<api_name>/juliaset/` to get a random Julia set
    - `http://api.juliabox.org/<api_name>/juliaset/<random_float>/<another_random_float>` to get one of your choice
