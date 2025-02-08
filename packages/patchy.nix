{ stdenvNoCC, ... }:
stdenvNoCC.mkDerivation {
  pname = "patchy";
  version = "config";
  src = ../lua;
  buildPhase = ''
    mkdir -p "$out/lua/patchy"
    cp -r $src/* "$out/lua/patchy"
  '';
}
