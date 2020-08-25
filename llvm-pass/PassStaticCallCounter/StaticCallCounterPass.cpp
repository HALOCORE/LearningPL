#include "llvm/ADT/MapVector.h"
#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/CallSite.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;
using ResultMapVector = llvm::MapVector<const llvm::Function*, unsigned>;

namespace {

struct StaticCallCounter : llvm::ModulePass {
    static char ID;
    ResultMapVector StaticCallCount;
    StaticCallCounter() : llvm::ModulePass(ID) {}
    bool runOnModule(llvm::Module &M) override {
        ResultMapVector result;
        errs() << "====== " << M.getSourceFileName() << " ======\n";
        for (auto &F : M) {
            errs() << "<<< enter F: " << F.getName() << "\n";
            for (auto &BB : F) {
                for(auto &Inst : BB) {
                    auto ICS = llvm::ImmutableCallSite(&Inst);
                    if (nullptr == ICS.getInstruction()) continue;
                    
                    auto DirectInvoc = dyn_cast<Function>(ICS.getCalledValue()->stripPointerCasts());
                    if(nullptr == DirectInvoc) continue;

                    auto CallCount = result.find(DirectInvoc);
                    if (CallCount == result.end()) result.insert(std::make_pair(DirectInvoc, 1));
                    else CallCount->second++;

                    errs() << " call inst: " << Inst.getOpcodeName() << " ";
                    for(int i=0; i<Inst.getNumOperands(); i++) {
                        errs() << Inst.getOperand(i)->getName() << ", ";
                    }
                    errs() << "\n";
                    // if (Inst.getNumOperands() == 0) errs() << Inst.getOpcodeName() << " no operand." << "\n";
                }
            }
        }
        StaticCallCount = result;
        return false;
    }
    void print(llvm::raw_ostream &outstream, llvm::Module const* M ) const override {
        outstream << " ========== Analysis Print ==========\n";
        outstream << StaticCallCount.size() << " different static calls.\n";
        outstream << "NAME    |    #DIRECT CALLS" << "\n";
        for(auto &p : StaticCallCount) {
            outstream << p.first->getName() << "   |   " << p.second << "\n";
        }
    } 
};
}

char StaticCallCounter::ID = 0;
static RegisterPass<StaticCallCounter> X(
    "staticcallcounter", 
    "Static Call Counter Pass", 
    false, 
    false);
