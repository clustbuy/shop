(window.webpackJsonp = window.webpackJsonp || []).push([[120], {
    311: function(e, i, n) {
        (function(e) {
                $("body").on("eksmoOpenVisuallyImpaired", () => {
                        const i = $(".version-visually-impaired");
                        i.length ? i.toggleClass("version-visually-impaired_active") : e.all([n.e(119).then(n.bind(null, 303)), n.e(118).then(n.bind(null, 304)), new e( (e, i) => {
                                if (!document.getElementById("css-version-visually-impaired")) {
                                    const n = document.createElement("link");
                                    n.onload = () => e(),
                                        n.onerror = () => i(),
                                        n.href = window.URLBuild + "/site/common/css/version-visually-impaired.css",
                                        n.type = "text/css",
                                        n.rel = "stylesheet",
                                        n.id = "css-version-visually-impaired",
                                        document.head.insertBefore(n, document.head.firstChild)
                                }
                            }
                        )]).catch( () => console.error("Ошибка загрузки версии для слабовидящих"))
                    }
                )
            }
        ).call(this, n(19))
    }
}]);
//# sourceMappingURL=120.js.map
