if has_config("build_example") then
    add_rules("mode.debug", "mode.release")
    set_languages("c++23")
    add_repositories("SkyrimScripting https://github.com/SkyrimScripting/Packages.git")
    add_requires("skyrim-commonlib-ae")
end

target("ExampleStaticLibrary")
    set_kind("static")
    add_files("src/*.cpp")
    add_includedirs("include", { public = true })
    if has_config("build_example") then
        add_packages("skyrim-commonlib-ae")
    end
