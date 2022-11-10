import { postData } from "thingy-network-base"

############################################################
export addClientToServe = (sciURL, clientPublicKey, timestamp, signature) ->
    requestObject = { clientPublicKey, timestamp, signature }
    requestURL = sciURL+"/addClientToServe"
    return postData(requestURL, requestObject)

export getClientsToServe = (sciURL, timestamp, signature) ->
    requestObject = { timestamp, signature }
    requestURL = sciURL+"/getClientsToServe"
    return postData(requestURL, requestObject)

export remoceClientToServe = (sciURL, clientPublicKey, timestamp, signature) ->
    requestObject = { clientPublicKey, timestamp, signature }
    requestURL = sciURL+"/removeClientToServe"
    return postData(requestURL, requestObject)


############################################################
export getNodeId = (sciURL, publicKey, timestamp, signature) ->
    requestObject = { publicKey, timestamp, signature }
    requestURL = sciURL+"/getNodeId"
    return postData(requestURL, requestObject)

export startSession = (sciURL, publicKey, timestamp, signature) ->
    requestObject = { publicKey, timestamp, signature }
    requestURL = sciURL+"/startSession"
    return postData(requestURL, requestObject)
