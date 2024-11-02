return {
  "nosduco/remote-sshfs.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    connections = {
      ssh_configs = { -- which ssh configs to parse for hosts list
        vim.fn.expand("$HOME") .. "/.ssh/others/servers_config",
        vim.fn.expand("$HOME") .. "/.ssh/others/vms_config",
        vim.fn.expand("$HOME") .. "/.ssh/brunos/brunos_config",
      },
      mounts = {
        base_dir = vim.fn.expand("$HOME") .. "/.mounts-sshfs/", -- base directory for mount points
        unmount_on_exit = true, -- run sshfs as foreground, will unmount on vim exit
      },
      sshfs_args = { -- arguments to pass to the sshfs command
        "-o reconnect",
        "-o ConnectTimeout=500",
      },
    },

    -- Refer to the configuration section below
    -- or leave empty for defaults
  },
}
