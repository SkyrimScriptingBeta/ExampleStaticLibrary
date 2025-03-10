add_rules("mode.debug", "mode.release")

set_languages("c++23")

if has_config("build_example") then
    add_repositories("SkyrimScripting https://github.com/SkyrimScripting/Packages.git")
    add_requires("skyrim-commonlib-ae")
end

commonlib_package = get_config("commonlib")
if commonlib_package then
    print("[Building] Using CommonLib package: " .. commonlib_package)

    -- Just for testing...
    add_requires(commonlib_package)
end

target("ExampleStaticLibrary")
    set_kind("static")
    add_files("src/*.cpp")
    add_includedirs("include", { public = true }) -- Your library's own include path
    add_headerfiles("include/(**).h")
    if has_config("commonlib") then
        add_packages(commonlib_package, { public = true })
    end
