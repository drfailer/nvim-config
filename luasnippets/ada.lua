return {
    -- includes
    s("io", { t("with Ada.Text_IO;") }),

    -- procedure
    s("proc", fmt([[
    procedure <name> is
        <decl>
    begin
        <impl>
    end <name>;
    ]], {
        name = i(1),
        decl = i(2),
        impl = i(0),
    }, {
        delimiters = "<>",
        repeat_duplicates = true,
    })),

    -- function
    s("func", fmt([[
    function <name> return <ret> is
        <decl>
    begin
        <impl>
    end <name>;
    ]], {
        ret = i(1, "Integer"),
        name = i(2),
        decl = i(3),
        impl = i(0),
    }, {
        delimiters = "<>",
        repeat_duplicates = true,
    })),

    -- package
    s("pack", fmt([[
    package <name> is
        <impl>
    end <name>;
    ]], {
        name = i(1),
        impl = i(0),
    }, {
        delimiters = "<>",
        repeat_duplicates = true,
    })),
    s("body", fmt([[
    package body <name> is
        <impl>
    end <name>;
    ]], {
        name = i(1),
        impl = i(0),
    }, {
        delimiters = "<>",
        repeat_duplicates = true,
    })),
}, {
}
