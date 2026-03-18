(window.webpackJsonp = window.webpackJsonp || []).push([[96], {
    119: function(t, e, o) {
        "use strict";
        o.r(e);
        var n = o(2)
            , i = o(5)
            , s = o(4)
            , r = o(1)
            , a = o(3)
            , l = o(64);
        const c = $("body")
            , f = $(".footer")
            , _ = "footer__link_cont-opened"
            , u = f.attr("data-href");
        let d = h();
        function h() {
            return Object(n.getW)() < a.eksmoBP.xsMax
        }
        const k = Object(l.a)(f.attr("data-get"));
        "string" == typeof u && u.length && Object(i.a)(f, t => {
                $.ajax({
                    url: u,
                    headers: {
                        "X-Requested-With": "XMLHttpRequest"
                    },
                    cache: !1,
                    timeout: 3e3,
                    data: k,
                    success(e) {
                        t.html(e),
                            t.addClass("footer_loaded"),
                            c.trigger("footerLoaded.eksmo")
                    }
                })
            }
            , 600),
            f.on("click", ".footer__link-a", t => {
                    h() && t.preventDefault()
                }
            ),
            f.on("click", ".footer__link_cont", (function() {
                    if (h()) {
                        const t = $(this)
                            , e = t.find(".footer__cont-spoiler")
                            , o = t.find(".footer__cont");
                        t.hasClass(_) ? (e.height(o.outerHeight(!0)),
                            e.height(0),
                            t.removeClass(_)) : (e.height(o.outerHeight(!0)),
                            t.addClass(_),
                            setTimeout( () => {
                                    e.removeAttr("style")
                                }
                                , 2 * s.a))
                    }
                }
            )),
            c.on("eksmoResizeWidth", () => {
                    h() !== d && (h() || (f.find(".footer__cont-spoiler").removeAttr("style"),
                        f.find(".footer__link_cont").removeClass(_)),
                        d = h())
                }
            ),
            Object(i.a)(f, () => {
                    r.a.customDL({
                        event: "eksmo",
                        eventAction: "view",
                        eventCategory: $("title").text().trim(),
                        eventLabel: "Подвал сайта"
                    })
                }
                , 0, 0, .4),
            c.on("click", ".footer__s-link, .footer__link, .footer__link-a, .footer__faq-btn", (function() {
                    const t = $(this);
                    (!t.hasClass("footer__link") || t.hasClass("footer__link") && !t.find(".footer__s-link").length) && r.a.customDL({
                        event: "eksmo",
                        eventAction: "click",
                        eventCategory: $("title").text().trim(),
                        eventLabel: "Подвал сайта - " + t.text().trim()
                    })
                }
            ))
    },
    64: function(t, e, o) {
        "use strict";
        function n(t) {
            if (t && null != t && t.length) {
                const e = {}
                    , o = null == t ? void 0 : t.split("&");
                for (let t = 0; t < o.length; t++) {
                    const [n,i] = o[t].split("=");
                    e[n] ? (Array.isArray(e[n]) || (e[n] = [e[n]]),
                        e[n].push(i)) : e[n] = i
                }
                return e
            }
            return []
        }
        o.d(e, "a", (function() {
                return n
            }
        ))
    }
}]);
//# sourceMappingURL=96.js.map
