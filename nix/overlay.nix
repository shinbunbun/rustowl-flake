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
      rev = "a3f47cc1277b365bc14c23399d9e1256ed68331b";
      hash = "sha256-nOTkGO0uYgKyYXVPC6L26hIQGygiVw9t3BT8ShoK5d8=";
      sparseCheckout = [
        "ftplugin"
        "lua"
      ];
    };
  };
}
