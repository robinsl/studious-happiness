local M = {}
local merge_tb = vim.tbl_deep_extend

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

M.general = {
  i = {
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },

    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
    ["<C-l>"] = { "<Right>", "Move right" },
  },
  n = {
    ["<Esc>"] = { ":noh <CR>", "Clear highlights" },

    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },

    ["<A-j>"] = { ":m .+1<CR>==", "Switch line position down" },
    ["<A-k>"] = { ":m .-2<CR>==", "Switch line position up" },

    ["<leader>vtl"] = { "<CMD> set nu! <CR>", "(V)im (T)oggle (L)ine" },
    ["<leader>vtr"] = { "<CMD> set rnu! <CR>", "(V)im (T)oggle (R)elative line" },
    ["<leader>vnb"] = { "<CMD> aner <CR>", "(V)im (N)ew (B)uffer" },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP (F)or(M)at"
    },
  },
  v = {
    ["<A-j>"] = { ":m .+1<CR>==", "Switch line position down" },
    ["<A-k>"] = { ":m .-2<CR>==", "Switch line position up" },
  },
}

M.lspconfig = {
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },

  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

M.oil = {
  n = {
    ["<leader>e"] = { "<CMD> Oil <CR>" }
  }
}

M.telescope = {
  n = {
    ["<leader>ff"] = { "<CMD> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<CMD> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<CMD> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<CMD> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>fc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>fs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
  }
}

M.trouble = {
  n = {
    ["<leader>xx"] = { function() require("trouble").toggle() end, "Toggle Trouble" },
    ["<leader>xw"] = { function() require("trouble").toggle("workspace_diagnostics") end, "Toggle Trouble Workspace diagnostic" },
    ["<leader>xd"] = { function() require("trouble").toggle("document_diagnostics") end, "Toggle Trouble Document diagnostic" },
    ["<leader>xq"] = { function() require("trouble").toggle("quickfix") end, "Toggle Trouble Quickfix" },
    ["<leader>xl"] = { function() require("trouble").toggle("loclist") end, "Toggle Trouble loclist" },
    ["<leader>xR"] = { function() require("trouble").toggle("lsp_references") end, "Toggle Trouble LSP references" },
  }
}

M.whichkey = {}

M.neogit = {
  n = {
    ["<C-c>"] = { "<CMD> Neogit <CR>", "Open Neogit" },
  }
}

M.load_mappings = function(section, opts)
  for mode, values in pairs(section) do
    local default_opts = merge_tb("force", { mode = mode }, opts or {})
    for keybindind, mapping_info in pairs(values) do
      local using_opts = merge_tb("force", default_opts, mapping_info.opts or {})

      mapping_info.opts, using_opts.mode = nil, nil
      using_opts.desc = mapping_info[2]

      vim.keymap.set(mode, keybindind, mapping_info[1], using_opts)
    end
  end
end

M.load_all_mapping = function ()
  M.load_mappings(M.general)
  M.load_mappings(M.lspconfig)
  M.load_mappings(M.oil)
  M.load_mappings(M.telescope)
  M.load_mappings(M.trouble)
  M.load_mappings(M.neogit)
end

return M

