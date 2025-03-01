#pragma once

#include <string_view>

namespace ExampleStaticLibrary {

    class ExampleClass {
    public:
        ExampleClass();
        ~ExampleClass();

        int GetNumber();

        void PrintToConsole(std::string_view text);
    };
}
