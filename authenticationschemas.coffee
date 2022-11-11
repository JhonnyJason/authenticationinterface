import {
    NUMBER, STRING, STRINGHEX, STRINGHEX32, STRINGHEX64, STRINGHEX128, BOOLEAN, ARRAY, NUMBERORNULL, OBJECT, validate
} from "thingy-schema-validate"


############################################################
#region Arguments

############################################################
## Master Functions

addClientToServeArguments = {
    clientPublicKey: STRINGHEX64
    timestamp: NUMBER
    nonce: NUMBER
    signature: STRINGHEX128
}
############################################################
getClientsToServeArguments = {
    timestamp: NUMBER
    nonce: NUMBER
    signature: STRINGHEX128
}
############################################################
removeClientToServeArguments = {
    clientPublicKey: STRINGHEX64
    timestamp: NUMBER
    nonce: NUMBER
    signature: STRINGHEX128
}


############################################################
## Client Functions

getNodeIdArguments = {
    publicKey: STRINGHEX64
    timestamp: NUMBER
    nonce: NUMBER
    signature: STRINGHEX128
}
############################################################
startSessionArguments = {
    publicKey: STRINGHEX64
    timestamp: NUMBER
    nonce: NUMBER
    signature: STRINGHEX128
}

#endregion

############################################################
#region Responses

############################################################
getClientsToServeResponse = {
    toServeList: ARRAY
}

############################################################
getNodeIdResponse = {
    serverNodeId: STRINGHEX64
    timestamp: NUMBER
    signature: STRINGHEX128
}


#endregion


############################################################
export responseValidators = {
    ## Master Functions
    addClientToServe: -> true
    getClientsToServe: (response) -> validate(response, getClientsToServeResponse)
    removeClientToServe: -> true
    ## Client Functions
    getNodeId: (response) -> validate(response, getNodeIdResponse)
    startSession: -> true
}

export argumentValidators = {
    addClientToServe: (args) -> validate(args, addClientToServeArguments)
    getClientsToServe: (args) -> validate(args, getClientsToServeArguments)
    removeClientToServe: (args) -> validate(args, removeClientToServeArguments)
    ## Client Functions
    getNodeId: (args) -> validate(args, getNodeIdArguments)
    startSession: (args) -> validate(args, startSessionArguments)
}