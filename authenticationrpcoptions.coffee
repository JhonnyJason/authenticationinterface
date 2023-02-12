############################################################
import * as rpcFunctions from "./rpcfunctions.js"
import { clientSignature, masterSignature } from "./rpcauthenticate.js"

############################################################
# NUMBER, BOOLEAN, ARRAY, OBJECT,
# STRING, STRINGHEX, STRINGHEX32, STRINGHEX64, STRINGHEX128,  
# NUMBERORNULL,  OBJECTORUNDEFINED, NONNULLOBJECT
import {
    STRING, STRINGHEX64, ARRAY, 
    validate
} from "thingy-schema-validate"


############################################################
#region Master Functions

############################################################
# addClientToserve

export addClientToServe = {
    authOptions: { masterSignature }
    argsSchema: {
        clientPublicKey: STRINGHEX64
    }
    execute: rpcFunctions.addClientToServe
}

############################################################
export getClientsToServe = {
    authOptions: { masterSignature }
    # argsSchema: null - legal to have empty schema? not for now :-)
    argsSchema: {}
    execute: rpcFunctions.getClientsToServe
}

############################################################
export removeClientToServe = {
    authOptions: { masterSignature }
    argsSchema: {
        clientPublicKey: STRINGHEX64
    }
    execute: rpcFunctions.removeClientToServe
}

#endregion

############################################################
#region Client Functions

############################################################
export getNodeId = {
    authOptions: { masterSignature, clientSignature }
    argsSchema: null
    execute: rpcFunctions.removeClientToServe
}

############################################################
export startSession = {
    authOptions: { masterSignature, clientSignature }
    argsSchema: {
        type: STRING
        clientPublicKey: STRINGHEX64
    }
    execute: rpcFunctions.removeClientToServe

}
#endregion