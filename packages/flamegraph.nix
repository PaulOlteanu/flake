{
  lib,
  stdenv,
  fetchFromGitHub,
  perl,
}:
stdenv.mkDerivation rec {
  pname = "FlameGraph";
  version = "2024-02-29";

  src = fetchFromGitHub {
    owner = "brendangregg";
    repo = pname;
    rev = "cd9ee4c4449775a2f867acf31c84b7fe4b132ad5";
    sha256 = "1flvkmv2gbb003d51myl7r0wyhyw1bk9p7v19xagb8xjj4ci947b";
  };

  buildInputs = [perl];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    for x in $src/*.pl $src/*.awk $src/dev/*.pl $src/dev/*.d; do
      cp $x $out/bin
    done

    runHook postInstall
  '';

  meta = with lib; {
    license = with licenses; [asl20 cddl gpl2Plus];
    homepage = "http://www.brendangregg.com/flamegraphs.html";
    description = "Visualization for profiled code";
    platforms = platforms.unix;
  };
}
