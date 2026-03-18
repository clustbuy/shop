(window.webpackJsonp = window.webpackJsonp || []).push([[100], {
    189: function(o, e, l) {
        "use strict";
        l.r(e);
        var t = l(2)
            , c = l(3);
        const n = document.querySelector(".arrow-up");
        let s, r = 0;
        null == n || n.addEventListener("click", (function o() {
                return Math.max(document.body.scrollTop, document.documentElement.scrollTop) > 0 ? (window.scrollBy(0, -100),
                    s = setTimeout(o, 20)) : clearTimeout(s),
                    !1
            }
        )),
            window.onscroll = function() {
                Object(t.getW)() < c.eksmoBP.smMax ? (window.scrollY > r ? null == n || n.classList.remove("arrow-up_active") : null == n || n.classList.add("arrow-up_active"),
                    r = window.scrollY) : window.pageYOffset > 900 ? null == n || n.classList.add("arrow-up_active") : null == n || n.classList.remove("arrow-up_active")
            }
    }
}]);
//# sourceMappingURL=100.js.map
