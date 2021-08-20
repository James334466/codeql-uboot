import cpp

from FunctionCall call, Function fcn
where
    call.getTarget() = fcn and
    fcn.hasName("memcpy")
select call 
