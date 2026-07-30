// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vxor.h for the primary calling header

#ifndef VERILATED_VXOR___024ROOT_H_
#define VERILATED_VXOR___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vxor__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vxor___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ xor_tb__DOT__a;
    CData/*0:0*/ xor_tb__DOT__b;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vxor__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vxor___024root(Vxor__Syms* symsp, const char* v__name);
    ~Vxor___024root();
    VL_UNCOPYABLE(Vxor___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
