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
}, {
}
