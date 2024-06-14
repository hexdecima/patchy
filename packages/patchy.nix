{ stdenvNoCC, fennel, coreutils, ... }:
let inherit (import ../constants.nix) FNL_ROOT;
in stdenvNoCC.mkDerivation (final: {
  pname = "patchy-${final.version}";
  version = "config";
  nativeBuildInputs = [ coreutils fennel ];
  dontUnpack = true; # there's no src, don't unpack.

  buildPhase = ''
    mkdir -p $out/lua/patchy
    echo -e "require \"patchy\"" > $out/init.lua

    for file in ${FNL_ROOT}/*; do
      relfile=$(basename "$file")
      filename="''${relfile%.*}"
      fennel -c $file > "$out/lua/patchy/$filename.lua" && echo "compiled '$relfile'."
    done
  '';
})
