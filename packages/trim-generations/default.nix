{
  lib,
  pkgs,
}:
pkgs.writeShellScriptBin "trim-generations" (builtins.readFile ./trim-generations.sh)
