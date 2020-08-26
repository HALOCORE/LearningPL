//finds reachable integer values for each basic block
#include "llvm/ADT/MapVector.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/ValueMap.h"
#include "llvm/Pass.h"
#include <deque>

using namespace llvm;

namespace {

struct RIV : public llvm::FunctionPass {
    using ResultMap = MapVector<llvm::BasicBlock const*, llvm::SmallPtrSet<llvm::Value*, 8>>;
    using DNode = DomTreeNodeBase<llvm::BasicBlock> *;
    // using ResultForAllFunctions = MapVector<llvm::Function const*, ResultMap>;
    // ResultForAllFunctions finalResults;
    ResultMap currentResult;

    ResultMap buildRIV(Function &F, DNode CFGRoot) {
        ResultMap resultMap;
        std::deque<DNode> BBsToProcess;
        
        //get definedValue for each BB
        ResultMap definedValueMap;
        for (auto &BB : F) {
            auto &values = definedValueMap[&BB];
            for(auto& Inst : BB) {
                if (Inst.getType()->isIntegerTy()) values.insert(&Inst);
            }
        }

        //compute RIV for entry BB
        auto &entryBBValues = resultMap[&F.getEntryBlock()];
        for (auto &global : F.getParent()->getGlobalList()) {
            if(global.getType()->isIntegerTy()) entryBBValues.insert(&global);
        }
        for (auto &arg : F.args()) {
            if (arg.getType()->isIntegerTy()) entryBBValues.insert(&arg);
        }

        //traverse the CFG for every BB to calculate RIVs
        BBsToProcess.push_back(CFGRoot);
        while (!BBsToProcess.empty()) {
            auto *parent = BBsToProcess.back();
            BBsToProcess.pop_back();

            auto &parentDefs = definedValueMap[parent->getBlock()];
            auto &parentRIVs = resultMap[parent->getBlock()];

            errs() << "child count: " << parent->getNumChildren() << "\n";
            for (DNode child : *parent) {
                errs() << "visit child, inst count: " << child->getBlock()->getInstList().size() << "\n";
                BBsToProcess.push_back(child);
                auto childBB = child->getBlock();

                resultMap[childBB].insert(parentDefs.begin(), parentDefs.end());
                resultMap[childBB].insert(parentRIVs.begin(), parentRIVs.end());
            }
        }
        errs() << "resultMap Count: " << resultMap.size() << "\n";
        return resultMap;
    }


    static char ID;
    RIV() : llvm::FunctionPass(ID) {}
    
    bool runOnFunction(Function &F) override {
        DNode domRoot = getAnalysis<DominatorTreeWrapperPass>().getDomTree().getRootNode();
        ResultMap result = buildRIV(F, domRoot);
        currentResult = result;
        return false;
    }

    void getAnalysisUsage(AnalysisUsage &AU) const override {
        AU.addRequired<DominatorTreeWrapperPass>();
        AU.setPreservesAll();
    }

    void print(raw_ostream &out, Module const *) const override {
        out << "===== RIV Pass Analysis Result =====" << "\n";
        for (auto &bbresult : currentResult) {
            out << " ------ BB: ";
            bbresult.first->printAsOperand(out);
            out << " ------\n"; 
            for (auto const &ival : bbresult.second) {
                ival->print(out);
                out << "\n";
            } 
        }
    }
};

}

char RIV::ID = 0;
static RegisterPass<RIV> X("riv", "RIV Pass", true, true);