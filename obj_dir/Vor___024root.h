// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vor.h for the primary calling header

#ifndef VERILATED_VOR___024ROOT_H_
#define VERILATED_VOR___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vor__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vor___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ or_tb__DOT__a;
    CData/*0:0*/ or_tb__DOT__b;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vor__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vor___024root(Vor__Syms* symsp, const char* v__name);
    ~Vor___024root();
    VL_UNCOPYABLE(Vor___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
