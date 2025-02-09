{ vimUtils, stdenvNoCC, ... }:
vimUtils.buildVimPlugin {
  pname = "patchy";
  version = "config";
  # absolutely cursed.
  src = stdenvNoCC.mkDerivation {
    pname = "lua";
    version = "src";
    src = ../lua;
    buildPhase = ''
      mkdir -p "$out/lua"
      cp -r $src/* "$out/lua"
    '';
  };
}
