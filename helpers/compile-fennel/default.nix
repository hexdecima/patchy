# Compiles a Fennel `source` into a derivation with the compiled Lua.
# 
# `source` must be a file or directory.
# If directory, include only files ending in .fnl.
# Compiles recursively.
#
# USAGE:
# `compileFennel { source = ./fnl; }`
{ writeShellApplication, coreutils, fennel, stdenv, ... }:
{ source, name ? "compiled-fennel" }:
let
  compileFennel = writeShellApplication {
    name = "compileFennel";
    runtimeInputs = [ coreutils fennel ];
    text = builtins.readFile ./compile.sh;
  };
in stdenv.mkDerivation {
  inherit name;
  nativeBuildInputs = [ compileFennel ];
  dontInstall = true;
  dontUnpack = true;
  buildPhase = ''
    runHook preBuild

    mkdir -p $out
    compileFennel ${source} $out

    runHook postBuild
  '';
}
