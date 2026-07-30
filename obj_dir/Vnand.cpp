// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vnand__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

Vnand::Vnand(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vnand__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
    contextp()->traceBaseModelCbAdd(
        [this](VerilatedTraceBaseC* tfp, int levels, int options) { traceBaseModel(tfp, levels, options); });
}

Vnand::Vnand(const char* _vcname__)
    : Vnand(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vnand::~Vnand() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vnand___024root___eval_debug_assertions(Vnand___024root* vlSelf);
#endif  // VL_DEBUG
void Vnand___024root___eval_static(Vnand___024root* vlSelf);
void Vnand___024root___eval_initial(Vnand___024root* vlSelf);
void Vnand___024root___eval_settle(Vnand___024root* vlSelf);
void Vnand___024root___eval(Vnand___024root* vlSelf);

void Vnand::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vnand::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vnand___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vnand___024root___eval_static(&(vlSymsp->TOP));
        Vnand___024root___eval_initial(&(vlSymsp->TOP));
        Vnand___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vnand___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

void Vnand::eval_end_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+eval_end_step Vnand::eval_end_step\n"); );
#ifdef VM_TRACE
    // Tracing
    if (VL_UNLIKELY(vlSymsp->__Vm_dumping)) vlSymsp->_traceDump();
#endif  // VM_TRACE
}

//============================================================
// Events and timing
bool Vnand::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t Vnand::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vnand::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vnand___024root___eval_final(Vnand___024root* vlSelf);

VL_ATTR_COLD void Vnand::final() {
    Vnand___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vnand::hierName() const { return vlSymsp->name(); }
const char* Vnand::modelName() const { return "Vnand"; }
unsigned Vnand::threads() const { return 1; }
void Vnand::prepareClone() const { contextp()->prepareClone(); }
void Vnand::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> Vnand::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vnand___024root__trace_decl_types(VerilatedVcd* tracep);

void Vnand___024root__trace_init_top(Vnand___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vnand___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vnand___024root*>(voidSelf);
    Vnand__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    Vnand___024root__trace_decl_types(tracep);
    Vnand___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vnand___024root__trace_register(Vnand___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vnand::traceBaseModel(VerilatedTraceBaseC* tfp, int levels, int options) {
    (void)levels; (void)options;
    VerilatedVcdC* const stfp = dynamic_cast<VerilatedVcdC*>(tfp);
    if (VL_UNLIKELY(!stfp)) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vnand::trace()' called on non-VerilatedVcdC object;"
            " use --trace-fst with VerilatedFst object, and --trace with VerilatedVcd object");
    }
    stfp->spTrace()->addModel(this);
    stfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vnand___024root__trace_register(&(vlSymsp->TOP), stfp->spTrace());
}
