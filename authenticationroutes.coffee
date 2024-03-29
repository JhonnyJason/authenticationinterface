############################################################
import * as h from "./authenticationhandlers"
import { performance } from "node:perf_hooks"

############################################################
import { argumentValidators as validate } from "./authenticationschemas.js"
import *  as authentication from "./authenticationauthentication.js"

############################################################
#region Master Functions

############################################################
export addClientToServe = (req, res) ->
    console.log(" - - - [start] - - - /addClientToServe\n")
    start = performance.now()
    
    try validate.addClientToServe(req.body)
    catch err then return res.status(400).send({error: "validation: #{err.message}"})

    try await authentication.addClientToServe(req)
    catch err then return res.status(401).send({error: "authentication: #{err.message}"})

    # response = await h.addClientToServe(req.body.clientPublicKey, req.body.timestamp, req.body.signature)
    try response = await h.addClientToServe(req)
    catch err then return res.send({error: "execution: #{err.message}"})

    end = performance.now()
    diffMS = end - start
    console.log(" - - - [end] - - - /addClientToServe took #{diffMS}ms\n")
    
    return res.send(response)

############################################################
export getClientsToServe = (req, res) ->
    console.log(" - - - [start] - - - /getClientsToServe\n")
    start = performance.now()
    
    try validate.getClientsToServe(req.body)
    catch err then return res.status(400).send({error: "validation: #{err.message}"})

    try await authentication.getClientsToServe(req)
    catch err then return res.status(401).send({error: "authentication: #{err.message}"})

    # response = await h.getClientsToServe(req.body.timestamp, req.body.signature)
    try response = await h.getClientsToServe(req)
    catch err then return res.send({error: "execution: #{err.message}"})

    end = performance.now()
    diffMS = end - start
    console.log(" - - - [end] - - - /getClientsToServe took #{diffMS}ms\n")
    
    return res.send(response)

############################################################
export removeClientToServe = (req, res) ->
    console.log(" - - - [start] - - - /removeClientToServe\n")
    start = performance.now()
    
    try validate.removeClientToServe(req.body)
    catch err then return res.status(400).send({error: "validation: #{err.message}"})

    try await authentication.removeClientToServe(req)
    catch err then return res.status(401).send({error: "authentication: #{err.message}"})

    # response = await h.removeClientToServe(req.body.clientPublicKey, req.body.timestamp, req.body.signature)
    try response = await h.removeClientToServe(req)
    catch err then return res.send({error: "execution: #{err.message}"})

    end = performance.now()
    diffMS = end - start
    console.log(" - - - [end] - - - /removeClientToServe took #{diffMS}ms\n")
    
    return res.send(response)

#endregion

############################################################
#region Client Functions

############################################################
export getNodeId = (req, res) ->
    console.log(" - - - [start] - - - /getNodeId\n")
    start = performance.now()

    try validate.getNodeId(req.body)
    catch err then return res.status(400).send({error: "validation: #{err.message}"})

    try await authentication.getNodeId(req)
    catch err then return res.status(401).send({error: "authentication: #{err.message}"})

    try response = await h.getNodeId(req)
    catch err then return res.send({error: "execution: #{err.message}"})
    
    end = performance.now()
    diffMS = end - start
    console.log(" - - - [end] - - - /getNodeId took #{diffMS}ms\n")

    return res.send(response)

############################################################
export startSession = (req, res) ->
    console.log(" - - - [start] - - - /startSession\n")

    start = performance.now()

    try validate.startSession(req.body)
    catch err then return res.status(400).send({error: "validation: #{err.message}"})

    try await authentication.startSession(req)
    catch err then return res.status(401).send({error: "authentication: #{err.message}"})

    # response = await h.startSession(req.body.publicKey, req.body.timestamp, req.body.signature)
    try response = await h.startSession(req)
    catch err then return res.send({error: "execution: #{err.message}"})
    
    end = performance.now()
    diffMS = end - start
    console.log(" - - - [end] - - - /startSession took #{diffMS}ms\n")

    return res.send(response)

#endregion