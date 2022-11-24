############################################################
import *  as service from "./servicefunctions.js"
import { responseValidators as validate} from "./authenticationschemas.js"

############################################################
ok = true

############################################################
#region Master Functions

############################################################
export addClientToServe = (req) ->
    await service.addClientToServe(req)
    return {ok:true}

############################################################
export getClientsToServe = (req) ->
    response = await service.getClientsToServe(req)

    try validate.getClientsToServe(response)
    catch err then throw new Error("Error: service.getClientsToServe - response format: #{err.message}")

    return response

############################################################
export removeClientToServe = (req) ->
    await service.removeClientToServe(req)
    return {ok:true}

#endregion

############################################################
#region Client Functions

############################################################
export getNodeId = (req) ->
    response = await service.getSignedNodeId(req)

    try validate.getNodeId(response)
    catch err then throw new Error("Error: service.getSignedNodeId - response format: #{err.message}")

    return response


############################################################
export startSession = (req) ->
    console.log("/startSession")
    console.log(Object.keys(req))
    
    await service.startSession(req)
    return {ok}

#endregion