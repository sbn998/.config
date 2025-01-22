vim.env.XDG_CONFIG_HOME = os.getenv("USERPROFILE") .. "\\.custom_config"
require("core")
require("config.lazy")
