(window.webpackJsonp = window.webpackJsonp || []).push([[97], {
    134: function(o, s, t) {
        "use strict";
        t.r(s);
        var n = t(4)
            , i = t(69);
        const r = $("body")
            , a = ".form__input";
        function f(o, s=!0) {
            let t = s;
            Object(i.a)() && (t = !0),
                o.hasClass("form__input_date") ? o.closest(".form__input-label").addClass("form__input-label_focus", t) : o.closest(".form__input-label").toggleClass("form__input-label_focus", t)
        }
        function e(o) {
            o.each((function() {
                    const o = $(this);
                    ("" !== o.val() || Object(i.a)()) && f(o, !0)
                }
            ))
        }
        e($(a)),
            r.on("focus", a, (function() {
                    f($(this), !0)
                }
            )),
            r.on("blur", a, (function() {
                    const o = $(this);
                    "" !== o.val() || Object(i.a)() || f(o, !1)
                }
            )),
            r.on("click", ".form__password-link", (function() {
                    const o = $(this)
                        , s = o.closest(".form__input-label");
                    o.hasClass("form__password-link_show") ? (o.removeClass("form__password-link_show"),
                        s.find(".form__input_password").attr("type", "password")) : (o.addClass("form__password-link_show"),
                        s.find(".form__input_password").attr("type", "text"))
                }
            )),
            r.on("eksmoFancyboxAfterLoad", (o, s, t) => {
                    e(t.$slide.find(a))
                }
            ),
            $(".form__form").on("eksmoThisAjaxFormSuccess", (function() {
                    const o = $(this)
                        , s = o.closest(".form_faq")
                        , t = s.find(".form__faq-title").first()
                        , i = s.find(".form__faq-description").first();
                    t.length && (o.remove(),
                        t.html("Спасибо!"),
                        i.html("Мы обязательно прочтем ваше письмо"),
                        $("html, body").animate({
                            scrollTop: s.offset().top - 100
                        }, n.a))
                }
            ))
    },
    69: function(o, s, t) {
        "use strict";
        function n() {
            return window.navigator.userAgent.indexOf("MSIE ") > -1 || window.navigator.userAgent.indexOf("Trident/") > -1
        }
        t.d(s, "a", (function() {
                return n
            }
        ))
    }
}]);
//# sourceMappingURL=97.js.map
