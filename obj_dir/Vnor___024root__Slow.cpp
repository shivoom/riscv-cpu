// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vnor.h for the primary calling header

#include "Vnor__pch.h"
#include "Vnor__Syms.h"
#include "Vnor___024root.h"

void Vnor___024root___ctor_var_reset(Vnor___024root* vlSelf);

Vnor___024root::Vnor___024root(Vnor__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vnor___024root___ctor_var_reset(this);
}

void Vnor___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vnor___024root::~Vnor___024root() {
}
