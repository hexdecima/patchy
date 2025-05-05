require("presence").setup {
  neovim_image_text = "Visual Studio Code",
  main_image = "file",
  show_time = false,
  blacklist = { ".+/" },

  editing_text = "Editing file",
  file_explorer_text = "Browsing files",
  git_commit_text = "Committing mistakes",
  reading_text = "Viewing file",
  workspace_text = "In workspace",
}
