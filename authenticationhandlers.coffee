############################################################
scihandlers.addClientToServe = (clientPublicKey, timestamp, signature) ->
    await auth.addClient(clientPublicKey)
    return {ok:true}


############################################################
scihandlers.getNodeId = (publicKey, timestamp, signature) ->
    return await auth.getSignedNodeId()
    ###
    
{
    "publicKey": "...",
    "timestamp": "...",
    "signature": "..."
}


    ###


############################################################
scihandlers.startSession = (publicKey, timestamp, signature) ->
    await auth.startSession(publicKey)
    return {ok:true}


