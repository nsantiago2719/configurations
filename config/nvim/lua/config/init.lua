require("config.set")
require("config.autocmd")
require("config.keybindings")
require("config.lazy")

-- load lsp after lazy to load other packages
-- e.g. yaml-companion
require("config.lsp")
