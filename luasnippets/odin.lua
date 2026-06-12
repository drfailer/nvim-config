return {
    -- includes
    s("fmt", { t([[import "core:fmt"]]) }),
    s("strings", { t([[import "core:strings"]]) }),
    s("os", { t([[import "core:os"]]) }),

    -- functions
    s("pln", fmt([[fmt.println(<>)<>]], {
        i(1), i(2)
    }, {
        delimiters = "<>"
    })),

    -- boilerplate code
    s("main", fmt([[
    package <>

    import "core:fmt"

    main :: proc() {
        fmt.println("Hellope!")
    }
    ]], {
        i(1, "main")
    }, {
        delimiters = "<>"
    })),

    -- proc
    s("proc", fmt([[
    <> :: proc(<>)<> {
        <>
    }
    ]], {
        i(1), i(2), c(3, { t(""), t(" -> bool") }), i(4, "// TODO")
    }, {
        delimiters = "<>"
    })),

    -- stmts
    s("if", fmt([[
    if <> {
        <>
    }
    ]], {
        i(1), i(2, "// TODO")
    }, {
        delimiters = "<>"
    })),
    s("for", fmt([[
    for <> {
        <>
    }
    ]], {
        i(1), i(2, "// TODO")
    }, {
        delimiters = "<>"
    })),
}, {
}
