// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vnot.h for the primary calling header

#include "Vnot__pch.h"
#include "Vnot__Syms.h"
#include "Vnot___024root.h"

void Vnot___024root___ctor_var_reset(Vnot___024root* vlSelf);

Vnot___024root::Vnot___024root(Vnot__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vnot___024root___ctor_var_reset(this);
}

void Vnot___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vnot___024root::~Vnot___024root() {
}
