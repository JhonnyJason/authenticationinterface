import { postData } from "thingy-network-base"

############################################################
export addClientToServe = (sciURL, clientPublicKey, timestamp, nonce, signature) ->
    requestObject = { clientPublicKey, timestamp, nonce, signature }
    requestURL = sciURL+"/addClientToServe"
    return postData(requestURL, requestObject)

export getClientsToServe = (sciURL, timestamp, nonce, signature) ->
    requestObject = { timestamp, nonce, signature }
    requestURL = sciURL+"/getClientsToServe"
    return postData(requestURL, requestObject)

export removeClientToServe = (sciURL, clientPublicKey, timestamp, nonce, signature) ->
    requestObject = { clientPublicKey, timestamp, nonce, signature }
    requestURL = sciURL+"/removeClientToServe"
    return postData(requestURL, requestObject)


############################################################
export getNodeId = (sciURL, publicKey, timestamp, nonce, signature) ->
    requestObject = { publicKey, timestamp, nonce, signature}
    requestURL = sciURL+"/getNodeId"
    return postData(requestURL, requestObject)

export startSession = (sciURL, publicKey, timestamp, nonce, signature) ->
    requestObject = { publicKey, timestamp, nonce, signature }
    requestURL = sciURL+"/startSession"
    return postData(requestURL, requestObject)
