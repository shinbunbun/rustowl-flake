{
  self,
  inputs,
}: final: prev: {
  inherit (inputs) rust-manifest;

  rustowl = final.callPackage ./package.nix {};
}
