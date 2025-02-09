{ runCommand, neovim-unwrapped, makeBinaryWrapper, lib, writeText, neovimUtils
, lua, ... }:
{ name ? "neovim-${neovim-unwrapped.version}", plugins ? [ ], luaRc }:
let
  normalisedPlugins = neovimUtils.normalizePlugins plugins;
  neovimPackage = neovimUtils.normalizedPluginsToVimPackage normalisedPlugins;
  packDir = neovimUtils.packDir { inherit neovimPackage; };
  vimRc = writeText "init.vim" ''
    set packpath^=${packDir} | set runtimepath^=${packDir}
    luafile ${luaRc}
  '';
in runCommand name {
  nativeBuildInputs = [ makeBinaryWrapper ];
  meta = { inherit (neovim-unwrapped.meta) mainProgram; };
} ''
  makeWrapper ${
    lib.getExe neovim-unwrapped
  } $out/bin/nvim --add-flags "-u ${vimRc}"
''
