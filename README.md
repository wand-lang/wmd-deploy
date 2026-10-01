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
