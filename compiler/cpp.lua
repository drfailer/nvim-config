vim.opt_local.makeprg = "if [ -f ../build/Makefile ]; then make -j -C ../build/; elif [ -f ./Makefile ]; then make -j; else g++ -o prog *.cpp; fi"
