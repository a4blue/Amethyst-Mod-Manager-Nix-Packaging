{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication (finalAttrs: {
  pname = "Amethyst-Mod-Manager";
  version = "1.3.11";
  format = "other";
  dontBuild = true;

  src = fetchFromGitHub {
    owner = "ChrisDKN";
    repo = "Amethyst-Mod-Manager";
    rev = "v1.3.11";
    sha256 = "sha256-WqAYDCnzlpEWS+SXIpEGFw23yak7H0zgW4xqFAknRRQ=";
  };

  dependencies = with python3Packages; [
    customtkinter
    py7zr
    libarchive-c
    pillow
    lz4
    zstandard
    requests
    websocket-client
    keyring
    jeepney
    importlib-metadata
    backports-tarfile
    msgpack
    bsdiff4
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp $src/src/gui.py $out/bin/Amethyst-Mod-Manager
    runHook postInstall
  '';
  postFixUp = ''
    wrapPythonPrograms
  '';

  meta = {
    description = "A Linux native mod manager for a variety of games";
    homepage = "https://github.com/ChrisDKN/Amethyst-Mod-Manager";
    downloadPage = "https://github.com/ChrisDKN/Amethyst-Mod-Manager/releases";
    license = lib.licenses.gpl3;
    # TODO fill it when doing MR to nixpkgs
    #maintainers = with lib.maintainers; [];
    platforms = [ "x86_64-linux" ];
  };
})
