############################################################
sciroutes.addClientToServe = (req, res) ->
    try
        response = await h.addClientToServe(req.body.clientPublicKey, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.getNodeId = (req, res) ->
    try
        response = await h.getNodeId(req.body.publicKey, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

############################################################
sciroutes.startSession = (req, res) ->
    try
        response = await h.startSession(req.body.publicKey, req.body.timestamp, req.body.signature)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

