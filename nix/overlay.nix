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
      rev = "ce6f3602e574e1afc9200004d5b258e2a095887b";
      hash = "sha256-yzWXV6R69iEI9sZQif4O9F1NfElGwBKJrDxcOq9qXZc=";
      sparseCheckout = [
        "ftplugin"
        "lua"
      ];
    };
  };
}
