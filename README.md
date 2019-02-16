# dex-portier-demo

## overview

This is a demo of:
 * [`dex`](https://github.com/dexidp/dex) as an identity broker
 * [`portier`](https://github.com/portier/portier-broker) as the identity provider
 * dex's [`example-app`](https://github.com/dexidp/dex/tree/master/cmd/example-app) as a relying party

You can think of it like this:
 * example app is an app that needs to have users login, but can't do registration/login itself
 * Dex is a broker can acts like an IdP but is a front for other auth systems (oauth2/oidc/saml/etc)
 * Portier is an identity provider that verifies email ownership to determine/form identity

Search for "/home/cole" for places where paths will need to be updated:
 * portier's jwt signing key
 * dex's sqlite3 database

## video demo

[![Dex Portier Demo Video](http://img.youtube.com/vi/b8PKaBJH4dc/0.jpg)](http://www.youtube.com/watch?v=b8PKaBJH4 "Dex Portier Demo")

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

