{
  fetchurl,
  buildPythonPackage,
  ...
}: let
  pyyaml = buildPythonPackage {
    pname = "pyyaml";
    version = "6.0.1";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/cd/e5/af35f7ea75cf72f2cd079c95ee16797de7cd71f29ea7c68ae5ce7be1eda0/PyYAML-6.0.1.tar.gz";
      sha256 = "0hsa7g6ddynifrwdgadqcx80khhblfy94slzpbr7birn2w5ldpxz";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
  };
in
  buildPythonPackage {
    pname = "shyaml";
    version = "0.6.2";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/2a/5c/139cda90758d6bc18a16876a2c291264cf06fd736ca54606862a43931877/shyaml-0.6.2-py2.py3-none-any.whl";
      sha256 = "1vvkv8wfd1812yrnw0kb0b3zkpb7m339nlsjv6k2vshd5059z16l";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      pyyaml
    ];
  }
