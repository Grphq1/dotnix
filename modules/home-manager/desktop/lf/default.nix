{...}: {
  home.file = {
    ".config/lf/lfrc".source = ./lfrc;
    ".config/lf/previewer" = {
      source = ./previewer;
      executable = true;
    };
  };
}
