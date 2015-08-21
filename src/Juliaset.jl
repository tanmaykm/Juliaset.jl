module Juliaset

using Images
using Compat
using JuliaWebAPI

export juliaset

function genjuliaset(c1::Float64=0.0, c2::Float64=0.65, w::Int=200, h::Int=200)
    a = Array(UInt8, w, h)

    c = c1 + c2 * im

    idx = 1
    for r_val in linspace(-2.0, 2.0, w), im_val in linspace(-2.0, 2.0, h)
        z = r_val + im_val*im
        n = 255
        while abs(z) < 10 && n >= 5
            z = z*z + c
            n -= 5
        end
        (idx < length(a)) && (a[idx] = n)
        idx += 1
    end
    grayim(a)
#
#    img = grayim(a)
#    imwrite(img, "out.png")
end

function pngbytes(img)
    iob = IOBuffer()
    writemime(iob, MIME"image/png"(), img)
    takebuf_array(iob)
end

juliaset(c1::Float64, c2::Float64) = pngbytes(genjuliaset(c1, c2))
juliaset(s1::AbstractString, s2::AbstractString) = juliaset(parse(Float64, s1), parse(Float64, s2))
juliaset() = juliaset(rand(), rand())

const PNG_HEADER = @compat Dict{AbstractString,AbstractString}("Content-Type" => "image/png")
const JULIABOX_APIS = [
        (juliaset, false, PNG_HEADER)
    ]

serve_juliabox() = process(JULIABOX_APIS)
serve_local() = process(JULIABOX_APIS, "tcp://127.0.0.1:9999"; bind=true)

end # module
