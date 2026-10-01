# wmd.gg

The World of Many Doors: the game that runs on the
[wmd](https://github.com/wand-lang/wmd) Driver.

- `lib/` is the Library: every room, thing and realm, `std/` helpers, the
  help topics, and `init.wand`, which tells the Driver where its files are.
- `world.json` is the World, as the server last saved it.
- `wand.pkg` pins the version of wmd the game runs on.

Make a new world, then start the server:

```sh
wand github.com/wand-lang/wmd/wmd init --admin <name>
WMD_PEPPER=<pepper> wand github.com/wand-lang/wmd/wmd
```

## On Fly

The game runs on Fly as the app `wmd-gg`: telnet to port 23. One machine
in `iad` holds the game's checkout on its volume, at `/data/wmd.gg`, and
the server runs on it with `--git`, so it commits and pushes what the game
saves. `deploy/boot.wand` makes the checkout, brings it up to the repo,
and starts the server.

A push that changes the `Dockerfile`, `fly.toml`, `deploy/` or `wand.pkg`
deploys, by `.github/workflows/deploy.yml`. A running server refuses a
change to `wand.pkg`, so a new wmd needs that deploy. Changes to the
Library need none: a Keymaster brings them in with `/pull`.

The secrets: on Fly, `WMD_PEPPER` and `WMD_DEPLOY_KEY`, the private half
of the repo's deploy key "wmd-gg on Fly". On GitHub, `FLY_API_TOKEN`, a
Fly deploy token that expires on 2027-10-01.
