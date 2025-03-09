# LND Exporter

Simple LND REST client used for exporting metrics from Lightning Node to Prometheus.  Built with the purpose of being used by [warnet](https://github.com/bitcoin-dev-project/warnet?tab=readme-ov-file#warnet) for collecting statistics during simulations.

## Configuration

The following configurations can be overridden via system environment variables:

* ADMIN_MACAROON_HEX
* LND_HOST: 127.0.0.1
* LND_REST_PORT: 8080
* METRICS_PORT: 9332
* METRICS: lnd_block_height=parse("/v1/getinfo","block_height")

Default metrics configured in lnd-exporter:

```
metric format: 
<name of metric>=parse("<endpoint>","<key path REST response>") 
each additional metric must be preceeded with a "space" character

lnd_balance_channels=parse("/v1/balance/channels","balance") 
lnd_local_balance_channels=parse("/v1/balance/channels","local_balance.sat") 
lnd_remote_balance_channels=parse("/v1/balance/channels","remote_balance.sat") 
lnd_peers=parse("/v1/getinfo","num_peers")
```

## Developer notes

After deploying, you can port-forward to inspect metrics:

```
$ kubectl port-forward pod/tank-####-ln 9332:9332
```

Then open http://127.0.0.1:9332 in a browser to view:

```
# HELP lnd_balance_channels parse("/v1/balance/channels","balance")
# TYPE lnd_balance_channels gauge
lnd_balance_channels 105250.0
# HELP lnd_local_balance_channels parse("/v1/balance/channels","local_balance.sat")
# TYPE lnd_local_balance_channels gauge
lnd_local_balance_channels 105250.0
# HELP lnd_remote_balance_channels parse("/v1/balance/channels","remote_balance.sat")
# TYPE lnd_remote_balance_channels gauge
lnd_remote_balance_channels 87770.0
# HELP lnd_block_height parse("/v1/getinfo","block_height")
# TYPE lnd_block_height gauge
lnd_block_height 305.0
# HELP lnd_peers parse("/v1/getinfo","num_peers")
# TYPE lnd_peers gauge
lnd_peers 2.0
```

