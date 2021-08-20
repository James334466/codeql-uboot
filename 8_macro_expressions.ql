import cpp

from MacroInvocation macinv, Macro m
where macinv.getMacroName() = m.getName() and
    m.getName() in ["ntohs", "ntohl", "ntohll"]
    

select macinv.getExpr(), "macro invoked"
