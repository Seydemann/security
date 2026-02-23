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
    # MFTECmd setup
    if [ ! -d ".mftecmd" ]; then
      echo "Fetching MFTECmd..."
      mkdir -p .mftecmd
      ${pkgs.curl}/bin/curl -L https://f001.backblazeb2.com/file/EricZimmermanTools/net6/MFTECmd.zip -o .mftecmd/MFTECmd.zip
      ${pkgs.unzip}/bin/unzip -q .mftecmd/MFTECmd.zip -d .mftecmd
      rm .mftecmd/MFTECmd.zip
    fi
    
    cat > .mftecmd/mftecmd << 'EOF'
#!/usr/bin/env bash
exec ${pkgsAllowInsecure.dotnet-runtime_6}/bin/dotnet "$PWD/.mftecmd/MFTECmd.dll" "$@"
EOF
    chmod +x .mftecmd/mftecmd
    export PATH="$PWD/.mftecmd:$PATH"
    
    echo "MFTECmd ready."
    echo "Run: mftecmd -f <mft_file>"
  '';
}

