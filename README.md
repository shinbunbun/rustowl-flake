# A Nix flake for [rustowl](https://github.com/cordx56/rustowl)

rustowl requires a very specific nightly Rust toolchain to build.
This flake uses [fenix](https://github.com/nix-community/fenix) to fetch
and build that toolchain.

This flake provides:

  - A `rustowl` output, which can be executed with the `cargo-owlsp` binary.
  - An overlay with the same package.

> [!NOTE]
>
> This flake does not yet package any of the editor plugins.
> PRs are welcome :)
