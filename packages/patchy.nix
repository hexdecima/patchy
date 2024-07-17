{ stdenvNoCC, ... }@pkgs:
let
  compileFennel = import ../helpers/compile-fennel pkgs;
  compiledLua = compileFennel { source = ../fnl; };
in stdenvNoCC.mkDerivation {
  pname = "patchy";
  version = "config";
  dontUnpack = true;
  dontInstall = true;

  buildPhase = ''
    runHook preBuild

    mkdir -p "$out/lua/patchy"
    echo -e "require \"patchy\"" > $out/init.lua
    cp -r ${compiledLua}/* "$out/lua/patchy"

    runHook postBuild
  '';
}
