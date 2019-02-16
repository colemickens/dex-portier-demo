# dex-portier-demo

## overview

note: some scripts have absolute paths you'll need to update in order to run

## outcome

## bonus

If you're on NixOS or use Nix, you can use `shell.nix` and
everything will just work ala-Docker, but better.

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
