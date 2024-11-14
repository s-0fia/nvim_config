-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Vim Options ]]
require("options")

-- [[ Key Bindings ]]
require("bindings")

-- [[ Autocommands ]]
require("autocommands")

-- [[ Lazy Bootstrapping ]]
require("lazy-bootstrap")

-- [[ Setup Lazy Plugins ]]
require("lazy-plugins")

-- The line beneath this is called `modeline`. See `:help modeline`
