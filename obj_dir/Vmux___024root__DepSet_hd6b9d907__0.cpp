// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vmux.h for the primary calling header

#include "Vmux__pch.h"
#include "Vmux__Syms.h"
#include "Vmux___024root.h"

VL_INLINE_OPT VlCoroutine Vmux___024root___eval_initial__TOP__Vtiming__0(Vmux___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vmux__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux___024root___eval_initial__TOP__Vtiming__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlWide<4>/*127:0*/ __Vtemp_1;
    // Body
    __Vtemp_1[0U] = 0x2e766364U;
    __Vtemp_1[1U] = 0x2f6d7578U;
    __Vtemp_1[2U] = 0x61766573U;
    __Vtemp_1[3U] = 0x77U;
    vlSymsp->_vm_contextp__->dumpfile(VL_CVT_PACK_STR_NW(4, __Vtemp_1));
    vlSymsp->_traceDumpOpen();
    vlSelfRef.mux_tb__DOT__a = 0U;
    vlSelfRef.mux_tb__DOT__b = 0U;
    vlSelfRef.mux_tb__DOT__sel = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/mux_tb.sv", 
                                         18);
    vlSelfRef.mux_tb__DOT__a = 0U;
    vlSelfRef.mux_tb__DOT__b = 1U;
    vlSelfRef.mux_tb__DOT__sel = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/mux_tb.sv", 
                                         20);
    vlSelfRef.mux_tb__DOT__a = 1U;
    vlSelfRef.mux_tb__DOT__b = 0U;
    vlSelfRef.mux_tb__DOT__sel = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/mux_tb.sv", 
                                         22);
    vlSelfRef.mux_tb__DOT__a = 1U;
    vlSelfRef.mux_tb__DOT__b = 1U;
    vlSelfRef.mux_tb__DOT__sel = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/mux_tb.sv", 
                                         24);
    vlSelfRef.mux_tb__DOT__a = 0U;
    vlSelfRef.mux_tb__DOT__b = 0U;
    vlSelfRef.mux_tb__DOT__sel = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/mux_tb.sv", 
                                         27);
    vlSelfRef.mux_tb__DOT__a = 0U;
    vlSelfRef.mux_tb__DOT__b = 1U;
    vlSelfRef.mux_tb__DOT__sel = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/mux_tb.sv", 
                                         29);
    vlSelfRef.mux_tb__DOT__a = 1U;
    vlSelfRef.mux_tb__DOT__b = 0U;
    vlSelfRef.mux_tb__DOT__sel = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/mux_tb.sv", 
                                         31);
    vlSelfRef.mux_tb__DOT__a = 1U;
    vlSelfRef.mux_tb__DOT__b = 1U;
    vlSelfRef.mux_tb__DOT__sel = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/mux_tb.sv", 
                                         33);
    VL_WRITEF_NX("MUX gate passed\n",0);
    VL_FINISH_MT("testbench/mux_tb.sv", 37, "");
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmux___024root___dump_triggers__act(Vmux___024root* vlSelf);
#endif  // VL_DEBUG

void Vmux___024root___eval_triggers__act(Vmux___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vmux__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux___024root___eval_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.set(0U, vlSelfRef.__VdlySched.awaitingCurrentTime());
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vmux___024root___dump_triggers__act(vlSelf);
    }
#endif
}
