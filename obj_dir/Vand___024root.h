// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vand.h for the primary calling header

#ifndef VERILATED_VAND___024ROOT_H_
#define VERILATED_VAND___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vand__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vand___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ and_tb__DOT__a;
    CData/*0:0*/ and_tb__DOT__b;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vand__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vand___024root(Vand__Syms* symsp, const char* v__name);
    ~Vand___024root();
    VL_UNCOPYABLE(Vand___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
