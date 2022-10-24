############################################################
import { masterAuthentication, clientAuthentication } from "./authenticationfunctions.js"

############################################################
## Master Functions
############################################################
export addClientToServe = (req) -> await masterAuthentication(req.path, req.body)
############################################################
export getClientsToServe = (req) -> await masterAuthentication(req.path, req.body)
############################################################
export removeClientToServe = (req) -> await masterAuthentication(req.path, req.body)

############################################################
## Client Functions
############################################################
export getNodeId = (req) -> await clientAuthentication(req.path, req.body)
############################################################
export startSession = (req) -> await clientAuthentication(req.path, req.body)
