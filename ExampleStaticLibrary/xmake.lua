if has_config("build_example") then
    add_rules("mode.debug", "mode.release")
    set_languages("c++23")
    add_repositories("SkyrimScripting https://github.com/SkyrimScripting/Packages.git")
    add_requires("skyrim-commonlib-ae")
end

if has_config("commonlib") then
    commonlib_package = get_config("commonlib")
    print("[Building] Using CommonLib package: " .. commonlib_package)
end

target("ExampleStaticLibrary")
    set_kind("static")
    add_files("src/*.cpp")
    add_includedirs("include", { public = true }) -- Your library's own include path
    add_packages(commonlib_package, { public = true }) -- Ensure it propagates
