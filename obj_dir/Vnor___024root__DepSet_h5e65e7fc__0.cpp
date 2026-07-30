// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vnor.h for the primary calling header

#include "Vnor__pch.h"
#include "Vnor__Syms.h"
#include "Vnor___024root.h"

VL_INLINE_OPT VlCoroutine Vnor___024root___eval_initial__TOP__Vtiming__0(Vnor___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vnor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vnor___024root___eval_initial__TOP__Vtiming__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlWide<4>/*127:0*/ __Vtemp_1;
    // Body
    __Vtemp_1[0U] = 0x2e766364U;
    __Vtemp_1[1U] = 0x2f6e6f72U;
    __Vtemp_1[2U] = 0x61766573U;
    __Vtemp_1[3U] = 0x77U;
    vlSymsp->_vm_contextp__->dumpfile(VL_CVT_PACK_STR_NW(4, __Vtemp_1));
    vlSymsp->_traceDumpOpen();
    vlSelfRef.nor_tb__DOT__a = 0U;
    vlSelfRef.nor_tb__DOT__b = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/nor_tb.sv", 
                                         16);
    vlSelfRef.nor_tb__DOT__a = 0U;
    vlSelfRef.nor_tb__DOT__b = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/nor_tb.sv", 
                                         18);
    vlSelfRef.nor_tb__DOT__a = 1U;
    vlSelfRef.nor_tb__DOT__b = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/nor_tb.sv", 
                                         20);
    vlSelfRef.nor_tb__DOT__a = 1U;
    vlSelfRef.nor_tb__DOT__b = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "testbench/nor_tb.sv", 
                                         22);
    VL_WRITEF_NX("NOR gate passed\n",0);
    VL_FINISH_MT("testbench/nor_tb.sv", 26, "");
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vnor___024root___dump_triggers__act(Vnor___024root* vlSelf);
#endif  // VL_DEBUG

void Vnor___024root___eval_triggers__act(Vnor___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vnor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vnor___024root___eval_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.set(0U, vlSelfRef.__VdlySched.awaitingCurrentTime());
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vnor___024root___dump_triggers__act(vlSelf);
    }
#endif
}
