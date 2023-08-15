using Oxygen
using HTTP
include("./CoolPropApi/CoolPropApi.jl")

using .CoolPropApi

# 运行一个函数，检查能够正确工作。设置成api服务之后注释掉。
# CoolPropApi.PropsSI("T", "P", 101325.0, "Q", 0.0, "Water")

@get "/health" function(req::HTTP.Request)
    return Dict("coolpropapi" => "healthy!")
end

@get "/" function(req::HTTP.Request)
    return "using /health to check the healthy of the api and use /media to get the properties data."
end


# 这仅仅是个示例，实际上我们就是要设计这个api，使得可以通过api获取对应的物性。
@get "/water" function(req::HTTP.Request)
    return CoolPropApi.PropsSI("T", "P", 101325.0, "Q", 0.0, "Water")
end

serve(host="0.0.0.0", port=8081)