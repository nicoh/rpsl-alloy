abstract sig Processor {
}{
   this in Platform.processor
}

sig Cpu extends Processor {
}

sig Gpu extends Processor {
}

sig VirtualProcessor extends Processor {
}

sig Device {
}{
   this in Platform.device
}

abstract sig Memory {}{
   this in Platform.memory
}

sig Ram extends Memory {}

sig Bus {}

sig NetworkInterface {
   connectedTo: one Bus
} {
   this in Platform.networkInterfaces  
}

sig Platform {
   processor: disj set Processor, 
   device: disj set Device,
   memory: disj set Memory,
   networkInterfaces: disj set NetworkInterface,
}{
   one p: processor | p in Cpu
   one m: memory | m in Ram
}

pred example {}
run example 
