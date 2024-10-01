vim.opt_local.makeprg = "if [ -f ../build/Makefile ]; then make -C ../build/; elif [ -f ./Makefile ]; then make; else g++ -o prog *.cpp; fi"
