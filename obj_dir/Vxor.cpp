// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vxor__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

Vxor::Vxor(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vxor__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
    contextp()->traceBaseModelCbAdd(
        [this](VerilatedTraceBaseC* tfp, int levels, int options) { traceBaseModel(tfp, levels, options); });
}

Vxor::Vxor(const char* _vcname__)
    : Vxor(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vxor::~Vxor() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vxor___024root___eval_debug_assertions(Vxor___024root* vlSelf);
#endif  // VL_DEBUG
void Vxor___024root___eval_static(Vxor___024root* vlSelf);
void Vxor___024root___eval_initial(Vxor___024root* vlSelf);
void Vxor___024root___eval_settle(Vxor___024root* vlSelf);
void Vxor___024root___eval(Vxor___024root* vlSelf);

void Vxor::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vxor::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vxor___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vxor___024root___eval_static(&(vlSymsp->TOP));
        Vxor___024root___eval_initial(&(vlSymsp->TOP));
        Vxor___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vxor___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

void Vxor::eval_end_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+eval_end_step Vxor::eval_end_step\n"); );
#ifdef VM_TRACE
    // Tracing
    if (VL_UNLIKELY(vlSymsp->__Vm_dumping)) vlSymsp->_traceDump();
#endif  // VM_TRACE
}

//============================================================
// Events and timing
bool Vxor::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t Vxor::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vxor::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vxor___024root___eval_final(Vxor___024root* vlSelf);

VL_ATTR_COLD void Vxor::final() {
    Vxor___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vxor::hierName() const { return vlSymsp->name(); }
const char* Vxor::modelName() const { return "Vxor"; }
unsigned Vxor::threads() const { return 1; }
void Vxor::prepareClone() const { contextp()->prepareClone(); }
void Vxor::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> Vxor::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vxor___024root__trace_decl_types(VerilatedVcd* tracep);

void Vxor___024root__trace_init_top(Vxor___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vxor___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vxor___024root*>(voidSelf);
    Vxor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    Vxor___024root__trace_decl_types(tracep);
    Vxor___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vxor___024root__trace_register(Vxor___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vxor::traceBaseModel(VerilatedTraceBaseC* tfp, int levels, int options) {
    (void)levels; (void)options;
    VerilatedVcdC* const stfp = dynamic_cast<VerilatedVcdC*>(tfp);
    if (VL_UNLIKELY(!stfp)) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vxor::trace()' called on non-VerilatedVcdC object;"
            " use --trace-fst with VerilatedFst object, and --trace with VerilatedVcd object");
    }
    stfp->spTrace()->addModel(this);
    stfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vxor___024root__trace_register(&(vlSymsp->TOP), stfp->spTrace());
}
