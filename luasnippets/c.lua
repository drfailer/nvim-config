return {
    -- includes
    s("incl", { t("#include <"), i(1), t(">"), i(0) }),
    s("inc", { t("#include \""), i(1), t("\""), i(0) }),
    s("io", { t("#include <stdio.h>") }),
    s("lib", { t("#include <stdlib.h>") }),
    s("str", { t("#include <string.h>") }),
    s("math", { t("#include <math.h>") }),

    -- functions
    s("printf", fmt([[printf("<>"<>);<>]], {
        i(1), i(2), i(3)
    }, {
        delimiters = "<>"
    })),
    s("fprintf", fmt([[fprintf(<>, "<>"<>);<>]], {
        i(1, "stderr"), i(2), i(3), i(4)
    }, {
        delimiters = "<>"
    })),
    s("scanf", fmt([[scanf("<>", <>);<>]], {
        i(1), i(2), i(3)
    }, {
        delimiters = "<>"
    })),
    s("fgets", fmt([[fgets(<>, <>, <>);<>]], {
        i(1, "buff"), i(2, "1024"), i(3, "file"), i(4)
    }, {
        delimiters = "<>"
    })),

    -- boilerplate code
    s("main", fmt([[
    int main(<>) {
        <>
    }
    ]], {
        i(1, "int argc, char **argv"), i(2)
    }, {
        delimiters = "<>"
    })),
}, {
}
