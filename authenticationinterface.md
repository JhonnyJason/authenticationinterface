[![hackmd-github-sync-badge](https://hackmd.io/qbdgtO9mQ2CagvyXdya6Uw/badge)](https://hackmd.io/qbdgtO9mQ2CagvyXdya6Uw)
###### tags: `documentation` `sci`

# [authenticationinterface](https://github.com/JhonnyJason/authenticationinterface) v0.2
The Authentication Interface is targeted on high throughput authenticated [client service communication](https://hackmd.io/DjnHMT0TSlmffXZTsm4f7A).

It consists of a most minimal set of endpoints.

## Master Functions
These requests may only be sent by the master. 
The `MasterKeyId` is known in beforehand by the Service as the veried signatures are our safety measure here.

### /addClientToServe

This will add the`clientPublicKey` to the `toServeList` of the corresponding service.
In a second step the service starts to accept secrets from this client.

#### request
```json
{
    "clientPublicKey": "...",
    "timestamp": "...",
    "nonce": "...",
    "signature": "..."
}
```

#### response
```json
{
    "ok": true
}

```

### /getClientsToServe
This will retrieve the full `toServeList` of the corresponding service.

#### request
```json
{
    "timestamp": "...",
    "nonce": "...",
    "signature": "..."
}
```

#### response
```json
{
    "toServeList": [...]
}

```

### /removeClientToServe
This will remove the given `clientPublicKey` from the `toServeList` of the corresponding service.
In a second step the service stops accepting secrets from this client.

#### request
```json
{
    "clientPublicKey": "...",
    "timestamp": "...",
    "nonce": "...",
    "signature": "..."
}
```

#### response
```json
{
    "ok": true
}

```


## Client Functions

### /getNodeId
This function is mainly used by a new Client. When knowing the `serviceNodeId` the Client may accept secrets from the service.

Here the `signature` is created by the client, which has to be on the `toServeList` and match the `publicKey` to receive the correct response.

#### request
```json
{
    "publicKey": "...",
    "timestamp": "...",
    "nonce": "...",
    "signature": "..."
}
```

On the response the Service created the `signature` for stating it's own `publicKey`.

#### response
```json
{
    "publicKey": "...",
    "timestamp": "...",
    "signature": "..."
}

```

### /startSession
This function is mainly used by a new Client. It should be called only after the Client shared it's random seed to the Service. It serves the purpose to create the first valid `authCode` for the high throughput interactions.

Here the `signature` is created by the client, which has to be on the `toServeList` and match the `publicKey` to receive the correct response.

#### request
```json
{
    "publicKey": "...",
    "timestamp": "...",
    "nonce": "...",
    "signature": "..."
}
```

#### response
```json
{
    "ok": true
}

```
