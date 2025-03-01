add_rules("mode.debug", "mode.release")

set_languages("c++23")

if has_config("build_example") then
    add_repositories("SkyrimScripting https://github.com/SkyrimScripting/Packages.git")
    add_requires("skyrim-commonlib-ae")
end

commonlib_package = get_config("commonlib")
if commonlib_package then
    print("[Building] Using CommonLib package: " .. commonlib_package)
end

target("ExampleStaticLibrary")
    set_kind("static")
    add_files("src/*.cpp")
    add_includedirs("include", { public = true }) -- Your library's own include path
    if has_config("build_example") then
        add_packages(commonlib_package, { public = true })
    end
    add_includedirs(get_package(commonlib_package):installdir("include"))
