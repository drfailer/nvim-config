function create_section_label(args)
    local label = vim.fn.tolower(vim.fn.tr(args[1][1], " ", "-"))
    return string.format("\\label{sec:%s}", label)
end

return {
    -- text emphase
    s("b", { t("\\textbf{"), i(1), t("}"), i(0) }),
    s("it", { t("\\textit{"), i(1), t("}"), i(0) }),
    s("tt", { t("\\texttt{"), i(1), t("}"), i(0) }),
    s("verb", { t("\\verb|"), i(1), t("|"), i(0) }),

    -- labels
    s("label", { t("\\label{"), i(1), t("}"), i(0) }),
    s("ref", { t("\\ref{"), i(1), t("}"), i(0) }),

    -- sections
    s("sec", {
        t("\\section{"), i(1), t({ "}", "" }),
        f(create_section_label, {1}), t({ "", "", "" }), i(0)
    }),
    s("sub", {
        t("\\subsection{"), i(1), t({ "}", "" }),
        f(create_section_label, {1}), t({ "", "", "" }), i(0)
    }),
    s("subsub", {
        t("\\subsubsection{"), i(1), t({ "}", "" }),
        f(create_section_label, {1}), t({ "", "", "" }), i(0)
    }),

    -- packages
    -- TODO: create a function that uses a custom telescope picker
    s("cite", { t("\\cite{"), i(1), t("}"), i(0) }),
    s("img", { t("\\includegraphics[width=\\textwidth]{"), i(1), t("}"), i(0) }),

    -- environments
    s("begin", fmt([[
    \begin{<env>}
      <content>
    \end{<env>}
    ]],
    { env = i(1, "env"), content = i(0) },
    { delimiters = "<>", repeat_duplicates = true })),

    s("item", fmt([[
    \begin{itemize}
      \item <>
    \end{itemize}
    ]],
    { i(0), },
    { delimiters = "<>", repeat_duplicates = true })),
    s("itm", { t("\\item ") }),

    s("align", fmt([[
    \begin{align}
      <>
    \end{align}
    ]],
    { i(0) },
    { delimiters = "<>", repeat_duplicates = true, })),

    -- math
    s("frac", { t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0) }),

    -- code
    s("code", fmt([[
    \begin{listing}[ht!]
    \begin{minted}[frame=lines,framesep=2mm,baselinestretch=1.2,fontsize=\normalsize,linenos]{<lang>}
    <code>
    \end{minted}
    \caption{<caption>}
    \label{lst:<label>}
    \end{listing}
    ]], {
        lang = c(1, { t("C"), t("C++"), t("Python") }),
        caption = i(2, "caption"),
        label = i(3, "label"),
        code = i(4)
    }, {
        delimiters = "<>"
    })),

    -- figures
    -- TODO: create a telescope picker that grab the image name automatically
    s("figure", fmt([[
    \begin{figure}[h!]
      \begin{center}
        \includegraphics[width=\textwidth]{<image>}
        \caption{<caption>}
        \label{fig:<label>}
      \end{center}
    \end{figure}
    ]], {
        caption = i(1, "caption"),
        label = i(2, "label"),
        image = i(3),
    }, {
        delimiters = "<>"
    })),
}, {
}
