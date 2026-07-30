// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vnot.h for the primary calling header

#ifndef VERILATED_VNOT___024ROOT_H_
#define VERILATED_VNOT___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vnot__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vnot___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ not_tb__DOT__a;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vnot__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vnot___024root(Vnot__Syms* symsp, const char* v__name);
    ~Vnot___024root();
    VL_UNCOPYABLE(Vnot___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
