// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vnand.h for the primary calling header

#ifndef VERILATED_VNAND___024ROOT_H_
#define VERILATED_VNAND___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vnand__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vnand___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ nand_tb__DOT__a;
    CData/*0:0*/ nand_tb__DOT__b;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vnand__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vnand___024root(Vnand__Syms* symsp, const char* v__name);
    ~Vnand___024root();
    VL_UNCOPYABLE(Vnand___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
