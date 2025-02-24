{
  self,
  inputs,
}: final: prev: {
  inherit (inputs) rust-manifest;

  rustowl = final.callPackage ./package.nix {};

  rustowl-nvim = final.vimUtils.buildVimPlugin {
    pname = "rustowl";
    version = "2025-02-24";
    src = final.fetchFromGitHub {
      owner = "mrcjkb";
      repo = "rustowl";
      rev = "e19da752a72e9f3013f82beb491f1ac5345ea076";
      hash = "sha256-ZEUAsiwdp5whexEdaEOIw/XbRcKXt+iPHDRjufSj/as=";
      sparseCheckout = [
        "ftplugin"
        "lua"
      ];
    };
  };
}
