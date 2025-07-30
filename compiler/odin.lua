vim.opt_local.errorformat = "%f(%l:%c) %m"
vim.opt_local.makeprg = "if [ -f build.sh ]; then ./build.sh $*; elif [ -f ./Makefile ]; then make $*; else odin build % -file; fi"
