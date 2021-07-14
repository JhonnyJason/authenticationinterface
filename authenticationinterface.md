[![hackmd-github-sync-badge](https://hackmd.io/qbdgtO9mQ2CagvyXdya6Uw/badge)](https://hackmd.io/qbdgtO9mQ2CagvyXdya6Uw)
###### tags: `documentation` `sci`

# Authentication SCI v0.1
The Authentication Interface is targeted on high throughput authenticated [client service communication](https://hackmd.io/DjnHMT0TSlmffXZTsm4f7A).

It consists of a most minimal set of endpoints.

### /addClientToServe
This request may only be sent by a special client. This special client must be known to the service in beforehand. The `signature` is created by this special client.

It would add the`clientPublicKey` to the `toServeList` of the corresponding service.

In a second step the service would start to accept secrets from this Client.

#### request
```json
{
    "clientPublicKey": "..."
    "timestamp": "...",
    "signature": "..."
}
```

#### response
```json
{
    "ok": true
}

```

### /getNodeId
This function is mainly used by a new Client. When knowing the `serviceNodeId` the Client may accept secrets from the service.

Here the `signature` is created by the client, which has to be on the `toServeList` and match the `publicKey` to receive the correct response.

#### request
```json
{
    "publicKey": "...",
    "timestamp": "...",
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
    "signature": "..."
}
```

#### response
```json
{
    "ok": true
}

```
