{ stdenvNoCC, fennel, coreutils, ... }:
let inherit (import ../constants.nix) FNL_ROOT;
in stdenvNoCC.mkDerivation rec {
  pname = "patchy-${version}";
  version = "config";
  nativeBuildInputs = [ coreutils fennel ];
  dontUnpack = true; # there's no src, don't unpack.

  buildPhase = ''
    # recursively compiles all files at FNL_ROOT.
    function compile_fnl {
      for entry in ${FNL_ROOT}/$1/*; do
        relfile=$(basename "$entry")

        if [[ -f $entry ]]; then
          filename="''${relfile%.*}"
          echo "compiled $relfile into lua/patchy/$1/$filename.lua"
          fennel -c $entry > "$out/lua/patchy/$1/$filename.lua" && echo "compiled '$relfile'."

        elif [[ -d $entry ]]; then
          mkdir -p "$out/lua/patchy/$relfile"
          compile_fnl "$1/$relfile"
        fi
      done
    }

    mkdir -p $out/lua/patchy
    echo -e "require \"patchy\"" > $out/init.lua
    compile_fnl ""
  '';
}
