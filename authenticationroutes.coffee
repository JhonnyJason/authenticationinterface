############################################################
import * as h from "./authenticationhandlers"
import { performance } from "node:perf_hooks"

############################################################
import {
    NUMBER, STRINGHEX64, STRINGHEX128, assertStructureAndTypes
} from "./checkStructureAndTypes.js"

############################################################
authenticateRequest = null
export setAuthenticationFunction = (fun) -> authenticateRequest = fun


############################################################
#region Master Functions
addClientToServeArguments = {
    clientPublicKey: STRINGHEX64
    timestamp: NUMBER
    signature: STRINGHEX128
}
############################################################
getClientsToServeArguments = {
    timestamp: NUMBER
    signature: STRINGHEX128
}
############################################################
removeClientToServeArguments = {
    clientPublicKey: STRINGHEX64
    timestamp: NUMBER
    signature: STRINGHEX128
}



############################################################
export addClientToServe = (req, res) ->
    start = performance.now()
    
    try assertStructureAndTypes(req.body, addClientToServeArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    # response = await h.addClientToServe(req.body.clientPublicKey, req.body.timestamp, req.body.signature)
    try response = await h.addClientToServe(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/addClientToServe took #{diffMS}ms")
    
    return res.send(response)

############################################################
export getClientsToServe = (req, res) ->
    start = performance.now()
    
    try assertStructureAndTypes(req.body, getClientsToServeArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    # response = await h.getClientsToServe(req.body.timestamp, req.body.signature)
    try response = await h.getClientsToServe(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/getClientsToServe took #{diffMS}ms")
    
    return res.send(response)

############################################################
export removeClientToServe = (req, res) ->
    start = performance.now()
    
    try assertStructureAndTypes(req.body, removeClientToServeArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    # response = await h.removeClientToServe(req.body.clientPublicKey, req.body.timestamp, req.body.signature)
    try response = await h.removeClientToServe(req)
    catch err then return res.send({error: err.message})

    end = performance.now()
    diffMS = end - start
    console.log("/removeClientToServe took #{diffMS}ms")
    
    return res.send(response)

#endregion



############################################################
#region Client Functions

getNodeIdArguments = {
    publicKey: STRINGHEX64
    timestamp: NUMBER
    signature: STRINGHEX128
}
############################################################
startSessionArguments = {
    publicKey: STRINGHEX64
    timestamp: NUMBER
    signature: STRINGHEX128
}

############################################################
export getNodeId = (req, res) ->
    start = performance.now()

    try assertStructureAndTypes(req.body, getNodeIdArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    try response = await h.getNodeId(req)
    catch err then return res.send({error: err.message})
    
    end = performance.now()
    diffMS = end - start
    console.log("/getNodeId took #{diffMS}ms")

    return res.send(response)

############################################################
export startSession = (req, res) ->
    start = performance.now()

    try assertStructureAndTypes(req.body, startSessionArguments)
    catch err then return res.status(400).send({error: err.message})

    try await authenticateRequest(req)
    catch err then return res.status(401).send({error: err.message})

    # response = await h.startSession(req.body.publicKey, req.body.timestamp, req.body.signature)
    try response = await h.startSession(req)
    catch err then return res.send({error: err.message})
    
    end = performance.now()
    diffMS = end - start
    console.log("/startSession took #{diffMS}ms")

    return res.send(response)

#endregion