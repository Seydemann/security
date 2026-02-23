{ pkgs, config, inputs, ... }:

let
  pkgsAllowInsecure = import inputs.nixpkgs {
    system = pkgs.stdenv.system;
    config.permittedInsecurePackages = [ "dotnet-runtime-6.0.36" ];
  };
in
{
  packages = with pkgsAllowInsecure; [
    dotnet-runtime_6
    unzip
    # For GUI support
    xorg.libX11
    xorg.libICE
    xorg.libSM
    fontconfig
    freetype
  ];

enterShell = ''
  # EvtxECmd setup
  if [ ! -d ".evtxecmd" ]; then
    echo "Fetching EvtxECmd..."
    mkdir -p .evtxecmd
    ${pkgs.curl}/bin/curl -L https://download.ericzimmermanstools.com/net6/EvtxECmd.zip -o .evtxecmd/EvtxECmd.zip
    ${pkgs.unzip}/bin/unzip -q .evtxecmd/EvtxECmd.zip -d .evtxecmd
    rm .evtxecmd/EvtxECmd.zip
  fi
  
  EVTX_DIR="$PWD/.evtxecmd"
  
  cat > .evtxecmd/evtxecmd << EOF
#!/usr/bin/env bash
exec ${pkgsAllowInsecure.dotnet-runtime_6}/bin/dotnet "$EVTX_DIR/EvtxeCmd/EvtxECmd.dll" "\$@"
EOF
  chmod +x .evtxecmd/evtxecmd
  export PATH="$PWD/.evtxecmd:$PATH"
  
  echo "EvtxECmd ready."
  echo "Run: evtxecmd -f <evtx_file> --csv <output_dir>"
'';
}

