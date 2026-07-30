// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vnor__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

Vnor::Vnor(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vnor__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
    contextp()->traceBaseModelCbAdd(
        [this](VerilatedTraceBaseC* tfp, int levels, int options) { traceBaseModel(tfp, levels, options); });
}

Vnor::Vnor(const char* _vcname__)
    : Vnor(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vnor::~Vnor() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vnor___024root___eval_debug_assertions(Vnor___024root* vlSelf);
#endif  // VL_DEBUG
void Vnor___024root___eval_static(Vnor___024root* vlSelf);
void Vnor___024root___eval_initial(Vnor___024root* vlSelf);
void Vnor___024root___eval_settle(Vnor___024root* vlSelf);
void Vnor___024root___eval(Vnor___024root* vlSelf);

void Vnor::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vnor::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vnor___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vnor___024root___eval_static(&(vlSymsp->TOP));
        Vnor___024root___eval_initial(&(vlSymsp->TOP));
        Vnor___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vnor___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

void Vnor::eval_end_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+eval_end_step Vnor::eval_end_step\n"); );
#ifdef VM_TRACE
    // Tracing
    if (VL_UNLIKELY(vlSymsp->__Vm_dumping)) vlSymsp->_traceDump();
#endif  // VM_TRACE
}

//============================================================
// Events and timing
bool Vnor::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t Vnor::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vnor::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vnor___024root___eval_final(Vnor___024root* vlSelf);

VL_ATTR_COLD void Vnor::final() {
    Vnor___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vnor::hierName() const { return vlSymsp->name(); }
const char* Vnor::modelName() const { return "Vnor"; }
unsigned Vnor::threads() const { return 1; }
void Vnor::prepareClone() const { contextp()->prepareClone(); }
void Vnor::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> Vnor::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vnor___024root__trace_decl_types(VerilatedVcd* tracep);

void Vnor___024root__trace_init_top(Vnor___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vnor___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vnor___024root*>(voidSelf);
    Vnor__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    Vnor___024root__trace_decl_types(tracep);
    Vnor___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vnor___024root__trace_register(Vnor___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vnor::traceBaseModel(VerilatedTraceBaseC* tfp, int levels, int options) {
    (void)levels; (void)options;
    VerilatedVcdC* const stfp = dynamic_cast<VerilatedVcdC*>(tfp);
    if (VL_UNLIKELY(!stfp)) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vnor::trace()' called on non-VerilatedVcdC object;"
            " use --trace-fst with VerilatedFst object, and --trace with VerilatedVcd object");
    }
    stfp->spTrace()->addModel(this);
    stfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vnor___024root__trace_register(&(vlSymsp->TOP), stfp->spTrace());
}
