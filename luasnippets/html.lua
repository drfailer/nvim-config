return {
    s("!", fmt([[
    <!doctype html>
    <html lang="fr">
    <head>
        <meta charset=utf-8" />"
        <meta name="viewport" content="width=device-width, initial-scale=1.0\" />
        <meta name="author" content="{name}" />
        <meta name="keywords" content="test,html" />
        <meta name="description" content="Page principale." />
        <title>{title}</title>
    </head>
    <body>
        <header>
            <!-- head -->
        </header>
        <!-- document -->
        <h1>{text}</h1>
        <nav>
            <!-- nav -->
        </nav>
        <aside>
            <!-- aside -->
        </aside>
        <footer>
            <!-- foot -->
        </footer>
    </body>
    ]], {
        title = i(1, "name"),
        name = i(2, "title"),
        text = i(0),
    }, {}))
}, {
}
