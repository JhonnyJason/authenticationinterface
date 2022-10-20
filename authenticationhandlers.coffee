############################################################
import {
    NUMBER, STRINGHEX64, STRINGHEX128, ARRAY, assertStructureAndTypes
} from "./checkStructureAndTypes.js"

############################################################
service = null
export setService = (serviceToSet) -> service = serviceToSet

############################################################
ok = true

############################################################
#region Master Functions

############################################################
getClientsToServeResponse = {
    ARRAY
}

############################################################
export addClientToServe = (req) ->
    await service.addClient(req)
    return {ok:true}

############################################################
export getClientsToServe = (req) ->
    response = await service.getClientsToServe(req)
    try assertStructureAndTypes(response, getClientsToServeResponse)
    catch err then throw new Error("Error: service.getClientsToServe - response format: #{err.message}")
    return response

############################################################
export removeClientToServe = (req) ->
    await service.removeClient(req)
    return {ok:true}

#endregion


############################################################
#region Client Functions

############################################################
getNodeIdResponse = {
    serverNodeId: STRINGHEX64
    timestamp: NUMBER
    signature: STRINGHEX128
}
############################################################
export getNodeId = (req) ->
    response = await service.getSignedNodeId(req)
    try assertStructureAndTypes(response, getNodeIdResponse)
    catch err then throw new Error("Error: service.getSignedNodeId - response format: #{err.message}")
    return response


############################################################
export startSession = (req) ->
    await service.startSession(req)
    return {ok}

#endregion