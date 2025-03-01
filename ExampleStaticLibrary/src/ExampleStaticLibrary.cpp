#include "ExampleStaticLibrary.h"

#include <RE/Skyrim.h>

namespace ExampleStaticLibrary {
    ExampleClass::ExampleClass() {}
    ExampleClass::~ExampleClass() {}
    int  ExampleClass::GetNumber() { return 42; }
    void ExampleClass::PrintToConsole(std::string_view text) {
        if (auto* consoleLog = RE::ConsoleLog::GetSingleton()) consoleLog->Print(text.data());
    }
}
