import cpp

class NetworkByteSwap extends Expr {
    NetworkByteSwap () {
        exists (MacroInvocation mi, Macro m | 
            mi.getMacroName() = m.getName() and
            m.getName() in ["ntohs", "ntohl", "ntohll"]
            )
    }
}

from NetworkByteSwap n
select n, "NetworkByteSwap"