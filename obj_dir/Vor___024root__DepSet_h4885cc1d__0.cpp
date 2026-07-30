// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vor.h for the primary calling header

#include "Vor__pch.h"
#include "Vor__Syms.h"
#include "Vor___024root.h"

VL_INLINE_OPT VlCoroutine Vor___024root___eval_initial__TOP__Vtiming__0(Vor___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vor___024root___eval_initial__TOP__Vtiming__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlWide<3>/*95:0*/ __Vtemp_1;
    // Body
    __Vtemp_1[0U] = 0x2e766364U;
    __Vtemp_1[1U] = 0x732f6f72U;
    __Vtemp_1[2U] = 0x77617665U;
    vlSymsp->_vm_contextp__->dumpfile(VL_CVT_PACK_STR_NW(3, __Vtemp_1));
    vlSymsp->_traceDumpOpen();
    vlSelfRef.or_tb__DOT__a = 0U;
    vlSelfRef.or_tb__DOT__b = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/or_tb.sv", 
                                         16);
    vlSelfRef.or_tb__DOT__a = 0U;
    vlSelfRef.or_tb__DOT__b = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/or_tb.sv", 
                                         18);
    vlSelfRef.or_tb__DOT__a = 1U;
    vlSelfRef.or_tb__DOT__b = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/or_tb.sv", 
                                         20);
    vlSelfRef.or_tb__DOT__a = 1U;
    vlSelfRef.or_tb__DOT__b = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/or_tb.sv", 
                                         22);
    VL_WRITEF_NX("OR gate passed\n",0);
    VL_FINISH_MT("testbench/or_tb.sv", 26, "");
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vor___024root___dump_triggers__act(Vor___024root* vlSelf);
#endif  // VL_DEBUG

void Vor___024root___eval_triggers__act(Vor___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vor___024root___eval_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.set(0U, vlSelfRef.__VdlySched.awaitingCurrentTime());
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vor___024root___dump_triggers__act(vlSelf);
    }
#endif
}
