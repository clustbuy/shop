(window.webpackJsonp = window.webpackJsonp || []).push([[113], {
    135: function(t, a, e) {
        "use strict";
        e.r(a);
        var n = e(0);
        const s = ".pagenav-ajax__cont"
            , i = ".pagenav-ajax__nav";
        $("body").on("click", ".pagenav-ajax__btn", (function(t) {
                const a = $(this);
                "string" != typeof a.attr("href") && "string" != typeof a.attr("data-href") || t.preventDefault(),
                    function(t) {
                        if (t.length) {
                            const a = t.closest(".pagenav-ajax");
                            let e = t.attr("href");
                            const o = t.attr("data-href");
                            if (!e && o && (e = o),
                            a.length && Object(n.a)(e)) {
                                const o = a.find(s).first()
                                    , l = a.find(i)
                                    , r = a.attr("data-uniq");
                                o.length && l.length && (t.hasClass("pagenav-ajax__btn_loader") && t.replaceWith('<div class="pagenav-ajax__loader"><div class="loader loader_center pagenav-ajax__loader-mix"><div class="loader__cont pagenav-ajax__loader-style"><svg class="loader__svg"><use xlink:href="#loader"></use></svg></div></div></div>'),
                                    $.get(e, {
                                            ajax_pagination: "Y"
                                        }, h => {
                                            let c = "";
                                            const d = $("<html />").html(h);
                                            let g = 0;
                                            const p = o.find(".books__item[data-pos]").last();
                                            if (p.length) {
                                                let t = p.attr("data-pos");
                                                "string" == typeof t && (t = parseInt(t),
                                                Number.isNaN(t) || (g = t + 1))
                                            }
                                            Object(n.a)(r) && (c = `.pagenav-ajax[data-uniq=${r}] `);
                                            const _ = $(c + s, d).first()
                                                , f = _.find(".books__item[data-pos]");
                                            if (g && f.each((function() {
                                                    $(this).attr("data-pos", g),
                                                        g++
                                                }
                                            )),
                                            _.length && (t.hasClass("pagenav-ajax__btn_replacer") ? o.html(_.html()) : o.append(_.html()),
                                                l.each((function() {
                                                        const t = $(this).attr("data-uniq");
                                                        let a = "";
                                                        Object(n.a)(t) && (a = `[data-uniq=${t}]`);
                                                        const e = $(c + i + a, d).first();
                                                        e.length ? $(this).html(e.html()) : $(this).html("")
                                                    }
                                                )),
                                            window.history && !t.hasClass("pagenav-ajax__btn_no-history"))) {
                                                const t = e.match(/\/page\d+\//g);
                                                if (null !== t && t.length) {
                                                    let a = "";
                                                    const n = $("title")
                                                        , s = $("h1").first();
                                                    let i = s.text();
                                                    const o = t[t.length - 1].match(/\d+/).shift();
                                                    s.children().length && (i = ""),
                                                    o && (a = " страница " + o),
                                                        i += a,
                                                        window.history.replaceState({}, "", e),
                                                        n.text(i)
                                                }
                                            }
                                            a.trigger("eksmoPagenavAjax")
                                        }
                                    ))
                            }
                        }
                    }(a)
            }
        ))
    }
}]);
//# sourceMappingURL=113.js.map
