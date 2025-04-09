{
  lib,
  fetchFromGitHub,
  fenix,
  rust-manifest,
  makeRustPlatform,
}: let
  toolchain = (fenix.fromManifestFile rust-manifest).completeToolchain;
  rustPlatform = makeRustPlatform {
    cargo = toolchain;
    rustc = toolchain;
  };
in
  rustPlatform.buildRustPackage rec {
    pname = "rustowl";
    name = "rustowl";

    src = fetchGit {
      url = "ssh://git@github.com/cordx56/rustowl.git";
      rev = "58fd467581c397a86a9c60faee330ae19195d52e";
    };

    sourceRoot = "rustowl";

    cargoDeps = rustPlatform.fetchCargoVendor {
      inherit src sourceRoot;
      allowGitDependencies = false;
      hash = "sha256-Ovj3/CO2tkdVWELu2cPpb85+obO1CMv0A3AYL6PbvRw=";
    };

    nativeBuildInputs = [
      toolchain
    ];

    meta = with lib; {
      description = "Visualize ownership and lifetimes in Rust for debugging and optimization";
      longDescription = ''
        RustOwl visualizes ownership movement and lifetimes of variables.
        When you save Rust source code, it is analyzed, and the ownership and
        lifetimes of variables are visualized when you hover over a variable or function call.
      '';
      homepage = "https://github.com/cordx56/rustowl";
      license = licenses.mpl20;
      maintainers = [lib.maintainers.mrcjkb];
      platforms = platforms.all;
      mainProgram = "cargo-owlsp";
    };
  }
