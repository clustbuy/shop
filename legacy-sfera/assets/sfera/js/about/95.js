(window.webpackJsonp = window.webpackJsonp || []).push([[95], {
    16: function(a, e, s) {
        "use strict";
        function t() {
            const a = $(".js-link-auth-forms");
            a.length && a.first().click()
        }
        s.d(e, "a", (function() {
                return t
            }
        ))
    },
    58: function(a, e, s) {
        "use strict";
        s.r(e);
        var t = s(1)
            , o = s(33)
            , r = s(16)
            , n = s(9)
            , i = s(0);
        const l = $(document)
            , c = $("body")
            , m = ".ajax-form"
            , f = ".ajax-form__response"
            , d = "ajax-form_fail"
            , p = "ajax-form_success"
            , u = "ajax-form_load";
        function h(a, e, s) {
            const l = a.find("input[type=email]").first().val()
                , m = a.find(".multiple-file-upload")
                , h = a.attr("data-transaction-email");
            function j(o=!1) {
                if (o && (s.append("ya-captcha-response", o),
                    s.append("smart-token", o)),
                    s.append("http_referer", document.referrer),
                m.length > 0) {
                    const a = m.prop("multiple-file-upload") || {};
                    if (Array.isArray(a.files) && Object(i.a)(a.name))
                        for (let e = 0; e < a.files.length; e++)
                            s.append(a.name + "[]", a.files[e])
                }
                if (h) {
                    const a = {
                        email: l,
                        code: h
                    };
                    fetch("/ajax/subscribe/transaction/", {
                        method: "POST",
                        body: JSON.stringify(a)
                    })
                }
                $.ajax({
                    url: e,
                    data: s,
                    cache: !1,
                    contentType: !1,
                    processData: !1,
                    type: "POST",
                    success(e) {
                        if ("AUTH" === e.trim())
                            Object(r.a)();
                        else {
                            const s = $.parseJSON(e);
                            if ("boolean" == typeof s.STATUS && "string" == typeof s.MESSAGE) {
                                let e = s.MESSAGE;
                                const o = e;
                                if (a.removeClass(u),
                                    s.STATUS) {
                                    const r = a.attr("data-layer-event");
                                    a.removeClass(d),
                                        a.addClass(p),
                                        e = `<div class="ajax-form__success">${e}</div>`,
                                    Object(i.a)(r) && t.a.customDL({
                                        event: r
                                    }),
                                        c.trigger("eksmoAjaxFormSuccess", [o, s]),
                                        a.trigger("eksmoThisAjaxFormSuccess", [o, s]),
                                    a.hasClass("ajax-form_feedback") && t.a.eventFormFeedback()
                                } else
                                    a.removeClass(p),
                                        a.addClass(d),
                                        e = `<div class="ajax-form__fail">${e}</div>`,
                                        c.trigger("eksmoAjaxFormFail", [o]),
                                        a.trigger("eksmoThisAjaxFormFail", [o]),
                                    Object(n.a)(s.ERRORS) && Object.keys(s.ERRORS).forEach(e => {
                                            const t = a.find("input, textarea").filter(`[name=${e}]`);
                                            t && ("file" === t.attr("type") ? t.closest(".fileinput2").find(".fileinput2__file-dropzone").addClass("ajax-form__error") : t.addClass("ajax-form__error"),
                                                t.trigger("eksmoThisInputAjaxFormFail", [s.ERRORS[e]]))
                                        }
                                    );
                                a.hasClass("ajax-form_response") ? a.html(e) : $(f, a).html(e)
                            }
                            window.smartCaptcha.reset(),
                                console.log("YaCaptha - reset")
                        }
                    },
                    error() {
                        a.removeClass(p),
                            a.removeClass(u),
                            a.addClass(d),
                            $(f, a).html(""),
                            c.trigger("eksmoAjaxFormFail"),
                            a.trigger("eksmoThisAjaxFormFail")
                    }
                })
            }
            a.hasClass("ajax-form_wg") ? (s.append("wg", 1),
                j()) : "AutotestEksmoRu@eksmo.ru" !== a.find("input[type=email]").first().val() ? (a.on("eksmoSubmitCaptcha", (e, s) => {
                    j(s),
                        a.off("eksmoSubmitCaptcha")
                }
            ),
                o.a.renderYaCaptcha(a)) : j()
        }
        function j(a) {
            const e = $(a.target)
                , s = e.is(m) ? e : e.closest(m);
            if (s instanceof jQuery && s.length) {
                const a = new FormData(s[0]);
                let e = s.find("input[name=action]").attr("value");
                if (Object(i.a)(e) || (e = $("#action", s).val()),
                Object(i.a)(e) || (e = $(".ajax-form__action", s).val()),
                Object(i.a)(e) || (e = s.attr("action")),
                Object(i.a)(e) && !s.hasClass(u) && !s.hasClass(p)) {
                    const t = s.hasClass("ajax-form_oa")
                        , o = $("html").hasClass("is-authorized")
                        , n = s.attr("data-fn");
                    !t || t && o ? (e = e.indexOf("?") > 0 ? `${e}&rnd=${Math.random()}` : `${e}?rnd=${Math.random()}`,
                    s.find(f).length || s.prepend('<div class="ajax-form__response"></div>'),
                        s.removeClass(d),
                        s.removeClass(p),
                        s.addClass(u),
                        $(f, s).html('<div class="loader loader_orange ajax-form__loader"><div class="loader__cont loader__cont_w-full"><svg class="loader__svg"><use xlink:href="#loader"></use></svg></div></div>'),
                        "string" == typeof n ? $.get("/ajax/form/?fn=" + n, t => {
                                Object(i.a)(t) && (a.append("hash", t),
                                    h(s, e, a))
                            }
                        ) : h(s, e, a)) : t && !o && Object(r.a)()
                }
            }
            return !1
        }
        l.on("submit", m, a => {
                a.preventDefault(),
                    j(a)
            }
        ),
            l.on("click", ".ajax-form__btn", j),
            l.on("eksmoCallAjaxFormSubmit", m, j),
            l.on("keypress paste change", `${m} input, ${m} textarea`, (function() {
                    const a = $(this)
                        , e = a.closest(m);
                    a.trigger("eksmoThisInputAjaxFormChange"),
                    e.length && (e.removeClass(d),
                        $(f, e).html(""))
                }
            ))
    }
}]);
//# sourceMappingURL=95.js.map
