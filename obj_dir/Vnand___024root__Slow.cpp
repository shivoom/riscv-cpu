// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vnand.h for the primary calling header

#include "Vnand__pch.h"
#include "Vnand__Syms.h"
#include "Vnand___024root.h"

void Vnand___024root___ctor_var_reset(Vnand___024root* vlSelf);

Vnand___024root::Vnand___024root(Vnand__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vnand___024root___ctor_var_reset(this);
}

void Vnand___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vnand___024root::~Vnand___024root() {
}
