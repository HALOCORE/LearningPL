#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;
using CounterMap = llvm::StringMap<unsigned>;

namespace {

CounterMap generateOpCounterMap(Function &F) {
    CounterMap map;
    for(llvm::BasicBlock &BB : F) {
        for(llvm::Instruction &Inst : BB) {
            StringRef opName = Inst.getOpcodeName();
            if (map.find(opName) == map.end()) {
                map[opName] = 1;
            } else {
                map[opName] += 1;
            }
        }
    }
    return map;
}

void printOpcodeCounterResult(const CounterMap &result) {
    for (auto & s : result) {
        errs() << s.getKey() << ": " << s.getValue() << "\n";
    }
}

struct OpcodeCounter : public llvm::FunctionPass {
    static char ID;
    OpcodeCounter() : llvm::FunctionPass(ID) {}
    bool runOnFunction(llvm::Function &F) override {
        errs() << "=============" << F.getName() << "=============" << '\n';
        CounterMap result = generateOpCounterMap(F);
        printOpcodeCounterResult(result);
        return false;
    }
};

}

char OpcodeCounter::ID = 0;
static RegisterPass<OpcodeCounter> X(
    "opcounter", 
    "Opcode Counter Pass",
     false, 
     false);




