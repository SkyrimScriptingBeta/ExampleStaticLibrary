-- xmake config --build_example=y

set_languages("c++23")

option("build_example")
    set_description("Enable development tools (not installed with the package)")
    set_default(false) -- This ensures it is OFF unless explicitly enabled
option_end()

includes("ExampleStaticLibrary/xmake.lua")

if has_config("build_example") then
    print("Building example")
    includes("skse.lua")
    -- includes("papyrus.lua")
    includes("skse.lua")
end
