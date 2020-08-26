# clang `llvm-config --cxxflags` -fno-rtti -fPIC -shared ./PassHello/HelloPass.cpp -o ./PassHello/LLVMHelloPass.so
# clang -emit-llvm -c ./CommonTests/test0/main.cpp -o ./CommonTests/test0/main.bc
# opt -load ./PassHello/LLVMHelloPass.so -hello ./CommonTests/test0/main.bc -o /dev/null

# clang `llvm-config --cxxflags` -fno-rtti -fPIC -shared ./PassOpCounter/OpCounterPass.cpp -o ./PassOpCounter/LLVMOpCounterPass.so
# clang -emit-llvm -c ./CommonTests/test0/main.cpp -o ./CommonTests/test0/main.bc
# opt -load ./PassOpCounter/LLVMOpCounterPass.so -opcounter ./CommonTests/test0/main.bc -o /dev/null

# clang `llvm-config --cxxflags` -fno-rtti -fPIC -shared ./PassStaticCallCounter/StaticCallCounterPass.cpp -o ./PassStaticCallCounter/LLVMStaticCallCounterPass.so
# clang -emit-llvm -S ./CommonTests/test0/main.cpp -o ./CommonTests/test0/main.ll
# opt -load ./PassStaticCallCounter/LLVMStaticCallCounterPass.so -staticcallcounter -analyze ./CommonTests/test0/main.ll
# opt -load ./PassStaticCallCounter/LLVMStaticCallCounterPass.so -staticcallcounter -disable-output ./CommonTests/test0/main.ll

clang `llvm-config --cxxflags` -fno-rtti -fPIC -shared ./PassRIV/RIVPass.cpp -o ./PassRIV/LLVMRIVPass.so
clang -emit-llvm -S ./CommonTests/test1/main.cpp -o ./CommonTests/test1/main.ll
opt -load ./PassRIV/LLVMRIVPass.so -riv -analyze ./CommonTests/test1/main.ll