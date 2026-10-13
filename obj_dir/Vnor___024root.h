// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vnor.h for the primary calling header

#ifndef VERILATED_VNOR___024ROOT_H_
#define VERILATED_VNOR___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vnor__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vnor___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ nor_tb__DOT__a;
    CData/*0:0*/ nor_tb__DOT__b;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vnor__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vnor___024root(Vnor__Syms* symsp, const char* v__name);
    ~Vnor___024root();
    VL_UNCOPYABLE(Vnor___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
