authenticationinterface = {}

############################################################
authenticationinterface.addClientToServe = (clientPublicKey, timestamp, signature) ->
    requestObject = { clientPublicKey, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["authenticationinterface"]+"/addClientToServe"
    return @postData(requestURL, requestObject)

authenticationinterface.getNodeId = (publicKey, timestamp, signature) ->
    requestObject = { publicKey, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["authenticationinterface"]+"/getNodeId"
    return @postData(requestURL, requestObject)

authenticationinterface.startSession = (publicKey, timestamp, signature) ->
    requestObject = { publicKey, timestamp, signature }
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["authenticationinterface"]+"/startSession"
    return @postData(requestURL, requestObject)

#endregion

    
module.exports = authenticationinterface