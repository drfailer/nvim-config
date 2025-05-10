return {
    -- includes
    s("incl", { t("#include <"), i(1), t(">"), i(0) }),
    s("inc", { t("#include \""), i(1), t("\""), i(0) }),
    s("io", { t("#include <iostream>") }),
    s("lib", { t("#include <cstdlib>") }),
    s("str", { t("#include <string>") }),
    s("cstr", { t("#include <cstring>") }),

    -- functions
    s("cout", { t("std::count << ") }),
    s("cerr", { t("std::cerr << ") }),
    s("cin", { t("std::cin >> ") }),
    s("endl", { t("std::endl") }),

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

    s("guard", {
        f(function()
            local filename = vim.fn.expand("%:r")
            local cwd = vim.fn.getcwd();
            local base_path = vim.fn.substitute(filename, cwd .. "/", "", "")
            local define_name = vim.fn.toupper(vim.fn.tr(base_path, "/", "_"))
            return {
                string.format("#ifndef %s", define_name),
                string.format("#define %s", define_name),
                "", "",
            }
        end),
        i(0),
        t({ "", "", "#endif" }),
    }),

    s("class", fmt([[
    class <name> {
        public:
        <name>() {};
        ~<name>() {};

        private:
        <attr>
    };
    ]], {
        name = i(1, "Name"),
        attr = i(2),
    }, {
        delimiters = "<>",
        repeat_duplicates = true,
    })),

    s("operator=", fmt([[
    <type> operator=(<type> const &other) {
        if (&other == this) {
            return *this;
        }
        <impl>
        return *this;
    }
    ]], {
        type = i(1, "auto"),
        impl = i(2),
    }, {
        delimiters = "<>",
        repeat_duplicates = true,
    })),

    s("ope<<", fmt([[
    std::ostream &operator<<(std::ostream &os, <>) {
        <>
        return os;
    }
    ]], {
        i(1), i(0)
    }, {
        delimiters = "<>"
    })),

    s("ope==", fmt([[
    bool operator<kind>(<type> const &lhs, <type> const &rhs) {
        return <impl>;
    }
    ]], {
        kind = c(1, {
            t("=="), t("<"), t(">"), t("!="),
        }),
        type = i(2, "type_t"),
        impl = i(0),
    }, {
        delimiters = "<>",
        repeat_duplicates = true,
    })),

    s("ope+", fmt([[
    <type> operator<kind>(<type> const &lhs, <type> const &rhs) {
        return <impl>;
    }
    ]], {
        kind = c(1, {
            t("+"), t("-"), t("*"), t("/"),
        }),
        type = i(2, "type_t"),
        impl = i(0),
    }, {
        delimiters = "<>",
        repeat_duplicates = true,
    })),
}, {
}
