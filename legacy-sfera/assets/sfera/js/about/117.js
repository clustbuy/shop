(window.webpackJsonp = window.webpackJsonp || []).push([[117], {
    310: function(e, o, c) {
        "use strict";
        c.r(o);
        var n, i, p = c(23);
        const u = new p.a("popup",null === (n = document) || void 0 === n ? void 0 : n.querySelector(".switch-language_popup-switch"))
            , s = new p.a("popup",null === (i = document) || void 0 === i ? void 0 : i.querySelector(".switch-language_popup-question"));
        $("body").on("click", ".switch-language__item_popup-question", () => {
                u.close(),
                    s.open()
            }
        ),
            $(".switch-language__item_ru").on("click", (function() {
                    u.close(),
                        $(this).closest(".cheader__switch-language-box").removeClass("link-drop-down_active")
                }
            )),
            $(".switch-language__popup-en-close").on("click", () => {
                    s.close()
                }
            ),
            $(".cheader__item_switch-language").on("click", () => {
                    u.open()
                }
            )
    }
}]);
//# sourceMappingURL=117.js.map
