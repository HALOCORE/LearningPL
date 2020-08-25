# clang `llvm-config --cxxflags` -fno-rtti -fPIC -shared ./PassHello/HelloPass.cpp -o ./PassHello/LLVMHelloPass.so
# clang -emit-llvm -c ./CommonTests/test0/main.cpp -o ./CommonTests/test0/main.bc
# opt -load ./PassHello/LLVMHelloPass.so -hello ./CommonTests/test0/main.bc -o /dev/null

clang `llvm-config --cxxflags` -fno-rtti -fPIC -shared ./PassOpCounter/OpCounterPass.cpp -o ./PassOpCounter/LLVMOpCounterPass.so
clang -emit-llvm -c ./CommonTests/test0/main.cpp -o ./CommonTests/test0/main.bc
opt -load ./PassOpCounter/LLVMOpCounterPass.so -opcounter ./CommonTests/test0/main.bc -o /dev/null