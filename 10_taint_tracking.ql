
/**
 * @kind path-problem
 */

import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class NetworkByteSwap extends Expr {
  // TODO: copy from previous step
  NetworkByteSwap () {
    exists (MacroInvocation mi | 
        mi.getMacroName() in ["ntohl", "ntohs", "ntohll"] and 
        this = mi.getExpr()
        )
}
}

class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }

  override predicate isSource(DataFlow::Node source) {
    // TODO
    source.asExpr() instanceof NetworkByteSwap
  }
  override predicate isSink(DataFlow::Node sink) {
    // TODO
    exists(FunctionCall fcall | 
        fcall.getTarget().getName() = "memcpy" and 
        sink.asExpr() = fcall.getArgument(2)
        ) 
  }
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Network byte swap flows to memcpy"