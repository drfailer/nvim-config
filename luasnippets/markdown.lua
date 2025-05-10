return {
    s("head", fmt([[
    ---
    title: {}
    author: drfailer
    geometry: margin=2cm
    ---
    ]], { i(0) }, { })),

    s("link", { t("["), i(1, "desc"), t("]("), i(2, "link"), t(")"), i(0) }),
    s("img", { t("!["), i(1, "desc"), t("]("), i(2, "path"), t(")"), i(0) }),

    s("code", fmt([[
    ```{}
    {}
    ```
    ]], { i(1, "lan"), i(0) }, { }))
}, {
}
