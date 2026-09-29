{
  description = "Portable Neovim configuration and NixOS editor dependencies";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    fff.url = "github:dmtrKovalenko/fff";
    fff.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { fff, ... }: {
    nixosModules.default =
      {
        lib,
        pkgs,
        ...
      }:
      {
        nixpkgs.config.allowUnfreePredicate = lib.mkDefault (pkg: lib.getName pkg == "intelephense");

        environment.systemPackages = with pkgs; [
          git
          ripgrep
          stdenv.cc
          tree-sitter
          curl
          gnutar
          gzip
          wl-clipboard
          nil
          lua-language-server
          gopls
          typescript-language-server
          vscode-langservers-extracted
          templ
          rust-analyzer
          intelephense
          stylua
          nixfmt
          prettier
          rustfmt
          go
        ];

        programs.neovim = {
          enable = true;
          defaultEditor = lib.mkDefault true;
          configure = {
            packages.native.start = [
              fff.packages.${pkgs.stdenv.hostPlatform.system}.fff-nvim
            ];
            customLuaRC = ''
              vim.g.nvim_fff_managed = true
              dofile(vim.fn.stdpath("config") .. "/init.lua")
            '';
          };
        };
      };
  };
}
