// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vand__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

Vand::Vand(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vand__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
    contextp()->traceBaseModelCbAdd(
        [this](VerilatedTraceBaseC* tfp, int levels, int options) { traceBaseModel(tfp, levels, options); });
}

Vand::Vand(const char* _vcname__)
    : Vand(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vand::~Vand() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vand___024root___eval_debug_assertions(Vand___024root* vlSelf);
#endif  // VL_DEBUG
void Vand___024root___eval_static(Vand___024root* vlSelf);
void Vand___024root___eval_initial(Vand___024root* vlSelf);
void Vand___024root___eval_settle(Vand___024root* vlSelf);
void Vand___024root___eval(Vand___024root* vlSelf);

void Vand::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vand::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vand___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vand___024root___eval_static(&(vlSymsp->TOP));
        Vand___024root___eval_initial(&(vlSymsp->TOP));
        Vand___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vand___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

void Vand::eval_end_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+eval_end_step Vand::eval_end_step\n"); );
#ifdef VM_TRACE
    // Tracing
    if (VL_UNLIKELY(vlSymsp->__Vm_dumping)) vlSymsp->_traceDump();
#endif  // VM_TRACE
}

//============================================================
// Events and timing
bool Vand::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t Vand::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vand::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vand___024root___eval_final(Vand___024root* vlSelf);

VL_ATTR_COLD void Vand::final() {
    Vand___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vand::hierName() const { return vlSymsp->name(); }
const char* Vand::modelName() const { return "Vand"; }
unsigned Vand::threads() const { return 1; }
void Vand::prepareClone() const { contextp()->prepareClone(); }
void Vand::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> Vand::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vand___024root__trace_decl_types(VerilatedVcd* tracep);

void Vand___024root__trace_init_top(Vand___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vand___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vand___024root*>(voidSelf);
    Vand__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    Vand___024root__trace_decl_types(tracep);
    Vand___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vand___024root__trace_register(Vand___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vand::traceBaseModel(VerilatedTraceBaseC* tfp, int levels, int options) {
    (void)levels; (void)options;
    VerilatedVcdC* const stfp = dynamic_cast<VerilatedVcdC*>(tfp);
    if (VL_UNLIKELY(!stfp)) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vand::trace()' called on non-VerilatedVcdC object;"
            " use --trace-fst with VerilatedFst object, and --trace with VerilatedVcd object");
    }
    stfp->spTrace()->addModel(this);
    stfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vand___024root__trace_register(&(vlSymsp->TOP), stfp->spTrace());
}
