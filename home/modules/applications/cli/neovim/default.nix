{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    # withNodeJs = true; # disabled due to temporary issue https://github.com/nix-community/home-manager/issues/2966
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      set rnu
      set clipboard+=unnamedplus

      autocmd FileType markdown setlocal conceallevel=2 foldlevel=999 textwidth=72

      map <C-j> <C-W>j
      map <C-k> <C-W>k
      map <C-h> <C-W>h
      map <C-l> <C-W>l

      source ${./coc.vim}
    '';
    coc = {
      enable = true;
      settings = {
        languageserver = {
          nix = {
            command = "rnix-lsp";
            filetypes = ["nix"];
          };
          haskell = {
            # courtesy of dys_bigwig on the vim subreddit
            command = "haskell-language-server-wrapper";
            args = ["--lsp"];
            rootPatterns = [
              ".stack.yaml"
              ".hie-bios"
              "BUILD.bazel"
              "cabal.config"
              "package.yaml"
            ];
            filetypes = [
              "hs"
              "lhs"
              "haskell"
            ];
            initializationOptions = {
              languageServerHaskell = {
                hlintOn = true;
                maxNumberOfProblems = 10;
                completionSnippetsOn = true;
              };
            };
          };
        };
      };
    };
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-markdown
      vim-toml
      lf-vim
      vim-signify
      vim-rooter

      coc-fzf
      coc-css
      coc-yaml
      coc-wxml
      coc-json
      coc-java
      coc-html
      coc-cmake
      coc-vimlsp
      coc-python
      coc-clangd
      coc-texlab
      coc-markdownlint
      coc-spell-checker
      coc-rust-analyzer
    ];
  };
}
