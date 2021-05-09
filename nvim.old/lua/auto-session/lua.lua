require('auto-session').setup {
    post_restore_cmds = {"tabdo NERDTreeToggle"},
    pre_save_cmds = {"tabdo NERDTreeClose"}
}
