using Oxygen
using HTTP
include("./CoolPropApi/CoolPropApi.jl")

using .CoolPropApi
# CoolPropApi.greet()

@get "/health" function(req::HTTP.Request)
    return Dict("coolpropapi" => "healthy!")
end

@get "/" function(req::HTTP.Request)
    return "using /health to check the healthy of the api and use /media to get the properties data."
end

serve(host="0.0.0.0", port=8081)