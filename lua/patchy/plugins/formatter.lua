local function get_file_ext(filename)
  local ext = nil 
  for substr in string.gmatch(filename, "([^.]+)") do
    ext = substr
  end
  return ext
end

local prettier = {
  bin = "prettier",
  cmd = "-w"
}
local formatters = {
  fnl = {
    bin = "fnlfmt",
    cmd = "--fix"
  },
  lua = { bin = "stylua" },
  nix = { bin = "nixfmt" },
  rs = { bin = "rustfmt" },
  nu = { bin = "nufmt"},
  -- TODO: use list keys for repeated formaters.
  ts = prettier,
  js = prettier,
  html = prettier,
  tsx = prettier,
  jsx = prettier,
  css = prettier,
}

-- formats `filename` in-place.
local function format_file(filename)
  local ext = get_file_ext(filename)

  local fmt = formatters[ext]
  if fmt ~= nil then
    if vim.fn.executable(fmt.bin) == 1 then
      local fmt_cmd = (fmt.cmd ~= nil) and fmt.bin .. " " .. fmt.cmd or fmt.bin
      vim.cmd("silent exec" .. '\"!' .. " " .. fmt_cmd .. " " .. filename .. '"')
    else
      vim.notify("[patchy] '" .. fmt.bin .. "' configured, but not installed.", vim.log.levels.ERROR)
    end
  else
    vim.notify("[patchy] nothing to format '" .. ext .. "' with.", vim.log.levels.ERROR)
  end
end

vim.keymap.set("n", "<leader>ft", function ()
  if vim.bo.modified then
    vim.cmd("w")
    vim.notify("[patchy] formatting and saving.")
  end

  format_file(vim.api.nvim_buf_get_name(0))
end)
