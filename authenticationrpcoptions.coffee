############################################################
import * as rpcFunctions from "./rpcfunctions.js"
import { clientSignature, masterSignature } from "./rpcauthenticate.js"
import { addSignatureAuth } from "./rpcresponseauthenticate.js"

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
    responseAuth: {
        masterSignature: addSignatureAuth
    }
}

############################################################
export getClientsToServe = {
    authOptions: { masterSignature }
    # argsSchema: null - legal to have empty schema? not for now :-)
    argsSchema: {}
    execute: rpcFunctions.getClientsToServe
    responseAuth: {
        masterSignature: addSignatureAuth
    }
}

############################################################
export removeClientToServe = {
    authOptions: { masterSignature }
    argsSchema: {
        clientPublicKey: STRINGHEX64
    }
    execute: rpcFunctions.removeClientToServe
    responseAuth: {
        masterSignature: addSignatureAuth
    }
}

#endregion

############################################################
#region Client Functions

############################################################
export getNodeId = {
    authOptions: { masterSignature, clientSignature }
    argsSchema: null
    execute: -> return
    responseAuth: {
        masterSignature: addSignatureAuth
        clientSignature: addSignatureAuth
    }
}

############################################################
export startSession = {
    authOptions: { masterSignature, clientSignature }
    argsSchema: {
        type: STRING
        name: STRING
    }
    execute: rpcFunctions.startSession
    responseAuth: {
        masterSignature: addSignatureAuth
        clientSignature: addSignatureAuth
    }
}

# ############################################################
# export startSession = {
#     authOptions: { masterSignature, clientSignature }
#     argsSchema: {
#         type: STRING
#         name: STRING
#     }
#     execute: rpcFunctions.startSession
#     responseAuth: {
#         masterSignature: addSignatureAuth
#         clientSignature: addSignatureAuth
#     }
# }

############################################################
export stopSession = {
    authOptions: { masterSignature, clientSignature }
    argsSchema: {
        type: STRING
        name: STRING
    }
    execute: rpcFunctions.stopSession
    responseAuth: {
        masterSignature: addSignatureAuth
        clientSignature: addSignatureAuth
    }
}
#endregion