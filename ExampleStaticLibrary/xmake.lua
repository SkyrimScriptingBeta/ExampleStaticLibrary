add_rules("mode.debug", "mode.release")

set_languages("c++23")

if has_config("build_example") then
    add_repositories("SkyrimScripting https://github.com/SkyrimScripting/Packages.git")
    add_requires("skyrim-commonlib-ae")
end

if has_config("commonlib") then
    print("[Building] Using CommonLib package: " .. get_config("commonlib"))
end

target("ExampleStaticLibrary")
    set_kind("static")
    add_files("src/*.cpp")
    add_includedirs("include", { public = true }) -- Your library's own include path
    if has_config("build_example") then
        add_packages(get_config("commonlib"), { public = true })
    end
