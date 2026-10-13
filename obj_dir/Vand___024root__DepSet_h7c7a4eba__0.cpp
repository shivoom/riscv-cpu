// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vand.h for the primary calling header

#include "Vand__pch.h"
#include "Vand__Syms.h"
#include "Vand___024root.h"

VL_INLINE_OPT VlCoroutine Vand___024root___eval_initial__TOP__Vtiming__0(Vand___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vand__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vand___024root___eval_initial__TOP__Vtiming__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlWide<4>/*127:0*/ __Vtemp_1;
    // Body
    __Vtemp_1[0U] = 0x2e766364U;
    __Vtemp_1[1U] = 0x2f616e64U;
    __Vtemp_1[2U] = 0x61766573U;
    __Vtemp_1[3U] = 0x77U;
    vlSymsp->_vm_contextp__->dumpfile(VL_CVT_PACK_STR_NW(4, __Vtemp_1));
    vlSymsp->_traceDumpOpen();
    vlSelfRef.and_tb__DOT__a = 0U;
    vlSelfRef.and_tb__DOT__b = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/and_tb.sv", 
                                         16);
    vlSelfRef.and_tb__DOT__a = 0U;
    vlSelfRef.and_tb__DOT__b = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/and_tb.sv", 
                                         18);
    vlSelfRef.and_tb__DOT__a = 1U;
    vlSelfRef.and_tb__DOT__b = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/and_tb.sv", 
                                         20);
    vlSelfRef.and_tb__DOT__a = 1U;
    vlSelfRef.and_tb__DOT__b = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/and_tb.sv", 
                                         22);
    VL_WRITEF_NX("AND gate passed\n",0);
    VL_FINISH_MT("testbench/and_tb.sv", 26, "");
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vand___024root___dump_triggers__act(Vand___024root* vlSelf);
#endif  // VL_DEBUG

void Vand___024root___eval_triggers__act(Vand___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vand__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vand___024root___eval_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.set(0U, vlSelfRef.__VdlySched.awaitingCurrentTime());
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vand___024root___dump_triggers__act(vlSelf);
    }
#endif
}
