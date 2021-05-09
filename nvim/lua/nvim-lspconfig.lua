function on_attach(client)
    local function map(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true, normal = true}
    map("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map("gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    map("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    map("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    map("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    map("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    map("gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    map("<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    map("[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    map("]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    map("<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        map("<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        map("<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end
end

local lspconf = require "lspconfig"
local servers = {"html", "cssls", "tsserver", "pyright", "bashls", "vls", "clangd", "ccls"}

for k, lang in pairs(servers) do
    lspconf[lang].setup {
        root_dir = vim.loop.cwd
    }
end

-- remove the lsp servers with their configs you don want
local vls_binary = '/usr/local/bin/vls'
require'lspconfig'.vls.setup {
  cmd = {vls_binary},
}

-- lua lsp settings
USER = "/home/" .. vim.fn.expand("$USER")

local sumneko_root_path = USER .. "/.config/lua-language-server"
local sumneko_binary = USER .. "/.config/lua-language-server/bin/Linux/lua-language-server"

require "lspconfig".sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    root_dir = function()
        return vim.loop.cwd()
    end,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                globals = {"vim"}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            },
            telemetry = {
                enable = false
            }
        }
    }
}

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

-- diagnostics highlights

local cmd = vim.cmd

cmd "hi LspDiagnosticsSignError guifg=#f9929b"
cmd "hi LspDiagnosticsVirtualTextError guifg=#BF616A"

cmd "hi LspDiagnosticsSignWarning guifg=#EBCB8B"
cmd "hi LspDiagnosticsVirtualTextWarning guifg=#EBCB8B"

cmd "hi LspDiagnosticsSignInformation guifg=#A3BE8C"
cmd "hi LspDiagnosticsVirtualTextInformation guifg=#A3BE8C"

cmd "hi LspDiagnosticsSignHint guifg=#b6bdca"
cmd "hi LspDiagnosticsVirtualTextHint guifg=#b6bdca"


--  lsp for html , css and js/ts
require "lspconfig".tsserver.setup {}
require "lspconfig".cssls.setup {}
require "lspconfig".html.setup {}
require "lspconfig".pyright.setup {
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- only show one line of comment set to 0 if you do not want API comments be shown

  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter
  hint_scheme = "String",

  handler_opts = {
    border = "shadow"   -- double, single, shadow, none
  },
  decorator = {"`", "`"}  -- or decorator = {"***", "***"}  decorator = {"**", "**"} see markdown help


    })

  end,-- Note: add in lsp client on-attach
}

require "surround".setup{}