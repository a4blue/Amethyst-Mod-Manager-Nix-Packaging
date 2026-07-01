{
  lib,
  appimageTools,
  fetchurl,
}:
let
  version = "1.3.11";
  pname = "amethyst-mod-manager";

  src = fetchurl {
    url = "https://github.com/ChrisDKN/Amethyst-Mod-Manager/releases/download/v${version}/AmethystModManager-${version}-x86_64.AppImage";
    hash = "sha256-XdRFCuZC65CB/rwkj/D0It8Tje+dG4Jnq/ml6EuLuIs=";
  };
  extracted = appimageTools.extractType2 { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  meta = {
    description = "A Linux native mod manager for a variety of games";
    homepage = "https://github.com/ChrisDKN/Amethyst-Mod-Manager";
    downloadPage = "https://github.com/ChrisDKN/Amethyst-Mod-Manager/releases";
    license = lib.licenses.gpl3;
    # TODO fill it when doing MR to nixpkgs
    #maintainers = with lib.maintainers; [];
    platforms = [ "x86_64-linux" ];
  };
}
