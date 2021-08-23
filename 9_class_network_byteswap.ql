import cpp

class NetworkByteSwap extends Expr {
    NetworkByteSwap () {
        exists (MacroInvocation mi | 
            mi.getMacroName() in ["ntohl", "ntohs", "ntohll"] and 
            this = mi.getExpr()
            )
    }
}

from NetworkByteSwap n
select n, "NetworkByteSwap"