# dex-portier-demo

## overview

here's a video of it in action: https://youtu.be/b8PKaBJH4dc
[![Dex Portier Demo Video](http://img.youtube.com/vi/b8PKaBJH4dc/0.jpg)](http://www.youtube.com/watch?v=b8PKaBJH4 "Dex Portier Demo")

Search for "/home/cole" for places where paths will need to be updated:
 * portier's jwt signing key
 * dex's sqlite3 database

## steps

ahead of time:

```bash
cd ~/code/dex-portier-demo
openssl genpkey -algorithm RSA -out portier-key.pem -pkeyopt rsa_keygen_bits:2048
```

run it:

```bash
# terminal 1
sudo mailcatcher -f

# terminal 2
redis-server

# terminal 3
cd ~/code/portier-broker/
cargo run -- ~/code/dex-portier-demo/portier.toml

# terminal 4
cd ~/code/dex
go run ./cmd/dex/ serve ~/code/dex-portier-demo/dex.yaml

# terminal 5
cd ~/code/dex
go run ./cmd/example-app/
```

