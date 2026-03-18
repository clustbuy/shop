(window.webpackJsonp = window.webpackJsonp || []).push([[111], {
    89: function(e, o, t) {
        "use strict";
        t.r(o);
        var n = t(1)
            , a = t(5)
            , i = t(8)
            , c = (t(27),
            t(0));
        const r = $("body");
        Object(a.a)($(".mail-form_uni, .mail-form__uni-pic, .mail-form_pic"), i.a),
            r.on("eksmoThisAjaxFormSuccess", ".mail-form__form", (function() {
                    const e = $(this)
                        , o = e.find("input[name=vendor]").first().val();
                    e.closest(".mail-form_book").length || e.closest(".mail-form_book2020").length ? n.a.customDL({
                        event: "eksmo",
                        eventAction: "engagement",
                        eventCategory: "Узнать о поступлении книги",
                        eventLabel: $(".book-page__card-title").first().text().trim().replace("Электронная книга ", "").replace("Аудиокнига ", "").replace(/['"«»]/g, "")
                    }) : Object(c.a)(o) && n.a.eventSubscribe(o)
                }
            ))
    }
}]);
//# sourceMappingURL=111.js.map
