!function(t) {
    function e(e) {
        for (var i, a, r = e[0], l = e[1], c = e[2], d = 0, u = []; d < r.length; d++)
            a = r[d],
            Object.prototype.hasOwnProperty.call(o, a) && o[a] && u.push(o[a][0]),
                o[a] = 0;
        for (i in l)
            Object.prototype.hasOwnProperty.call(l, i) && (t[i] = l[i]);
        for (h && h(e); u.length; )
            u.shift()();
        return n.push.apply(n, c || []),
            s()
    }
    function s() {
        for (var t, e = 0; e < n.length; e++) {
            for (var s = n[e], i = !0, r = 1; r < s.length; r++) {
                var l = s[r];
                0 !== o[l] && (i = !1)
            }
            i && (n.splice(e--, 1),
                t = a(a.s = s[0]))
        }
        return t
    }
    var i = {}
        , o = {
        55: 0,
        105: 0
    }
        , n = [];
    function a(e) {
        if (i[e])
            return i[e].exports;
        var s = i[e] = {
            i: e,
            l: !1,
            exports: {}
        };
        return t[e].call(s.exports, s, s.exports, a),
            s.l = !0,
            s.exports
    }
    a.e = function(t) {
        var e = []
            , s = o[t];
        if (0 !== s)
            if (s)
                e.push(s[2]);
            else {
                var i = new Promise((function(e, i) {
                        s = o[t] = [e, i]
                    }
                ));
                e.push(s[2] = i);
                var n, r = document.createElement("script");
                r.charset = "utf-8",
                    r.timeout = 120,
                a.nc && r.setAttribute("nonce", a.nc),
                    r.src = function(t) {
                        return a.p + "" + ({}[t] || t) + ".js"
                    }(t);
                // var l = new Error;
                // n = function(e) {
                //     r.onerror = r.onload = null,
                //         clearTimeout(c);
                //     var s = o[t];
                //     if (0 !== s) {
                //         if (s) {
                //             var i = e && ("load" === e.type ? "missing" : e.type)
                //                 , n = e && e.target && e.target.src;
                //             l.message = "Loading chunk " + t + " failed.\n(" + i + ": " + n + ")",
                //                 l.name = "ChunkLoadError",
                //                 l.type = i,
                //                 l.request = n,
                //                 s[1](l)
                //         }
                //         o[t] = void 0
                //     }
                // }
                // ;
                var c = setTimeout((function() {
                        n({
                            type: "timeout",
                            target: r
                        })
                    }
                ), 12e4);
                r.onerror = r.onload = n,
                    document.head.appendChild(r)
            }
        return Promise.all(e)
    }
        ,
        a.m = t,
        a.c = i,
        a.d = function(t, e, s) {
            a.o(t, e) || Object.defineProperty(t, e, {
                enumerable: !0,
                get: s
            })
        }
        ,
        a.r = function(t) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
                value: "Module"
            }),
                Object.defineProperty(t, "__esModule", {
                    value: !0
                })
        }
        ,
        a.t = function(t, e) {
            if (1 & e && (t = a(t)),
            8 & e)
                return t;
            if (4 & e && "object" == typeof t && t && t.__esModule)
                return t;
            var s = Object.create(null);
            if (a.r(s),
                Object.defineProperty(s, "default", {
                    enumerable: !0,
                    value: t
                }),
            2 & e && "string" != typeof t)
                for (var i in t)
                    a.d(s, i, function(e) {
                        return t[e]
                    }
                        .bind(null, i));
            return s
        }
        ,
        a.n = function(t) {
            var e = t && t.__esModule ? function() {
                        return t.default
                    }
                    : function() {
                        return t
                    }
            ;
            return a.d(e, "a", e),
                e
        }
        ,
        a.o = function(t, e) {
            return Object.prototype.hasOwnProperty.call(t, e)
        }
        ,
        a.p = "",
        a.oe = function(t) {
            throw console.error(t),
                t
        }
    ;
    var r = window.webpackJsonp = window.webpackJsonp || []
        , l = r.push.bind(r);
    r.push = e,
        r = r.slice();
    for (var c = 0; c < r.length; c++)
        e(r[c]);
    var h = l;
    n.push([239, 0]),
        s()
}({
    103: function(t, e, s) {
        "use strict";
        var i = s(5)
            , o = s(8);
        s(21);
        function n(t, e) {
            const s = parseInt(e) || 0;
            t.each((function() {
                    const t = $(this).parent().find(".gallery__text")
                        , e = t.find(".gallery__text-item")
                        , i = e.eq(s);
                    t.height(i.height()),
                        e.removeClass("gallery__text-item_active"),
                        i.addClass("gallery__text-item_active")
                }
            ))
        }
        function a() {
            $(".gallery__slider").each((function(t) {
                    const e = $(this)
                        , s = e.closest(".gallery");
                    let a = "gallery__dots";
                    let r = " arrow_no-bg arrow_border";
                    a += parseInt(t),
                        e.siblings(".gallery__dots").addClass(a),
                    s.hasClass("gallery_arrow-no-border") && (r = " arrow_shadow"),
                        e.trigger("destroy.owl.carousel").removeClass("owl-carousel").addClass("owl-carousel").owlCarousel({
                            margin: 40,
                            navText: [`<div class="gallery__prev arrow arrow_prev${r}"></div>`, `<div class="gallery__next arrow arrow_next${r}"></div>`],
                            dotsContainer: `.${a}.dots`,
                            dotClass: "dots__item",
                            responsive: {
                                0: {
                                    items: 1,
                                    slideBy: 1,
                                    stagePadding: 30,
                                    margin: 13,
                                    animateIn: !1,
                                    animateOut: !1,
                                    nav: !0
                                },
                                770: {
                                    items: 1,
                                    slideBy: 1,
                                    nav: !0
                                }
                            },
                            onInitialized(t) {
                                Object(i.a)($(t.target).find(".gallery__picture_loader"), o.a),
                                    n(e)
                            }
                        }).on("translate.owl.carousel", t => {
                                n($(t.currentTarget), t.item.index)
                            }
                        )
                }
            ))
        }
        a(),
        $(".timeline").length && $("body").on("eksmoFancyboxAfterLoad", a)
    },
    12: function(t, e, s) {
        "use strict";
        s.d(e, "b", (function() {
                return r
            }
        )),
            s.d(e, "a", (function() {
                    return l
                }
            ));
        var i = s(15)
            , o = s.n(i)
            , n = s(0);
        const a = $(document.body);
        function r(t, e) {
            Object(n.a)(t) && a.prepend($(`<div class="js-svg-sprite${Object(n.a)(e) ? " js-svg-sprite_" + e : ""}">`).load(window.URLBuild + t, () => {
                    o()()
                }
            ))
        }
        function l(t) {
            a.find(".js-svg-sprite" + (Object(n.a)(t) ? "_" + t : "")).remove()
        }
    },
    13: function(t, e, s) {
        "use strict";
        s.d(e, "a", (function() {
                return f
            }
        ));
        var i = s(6)
            , o = s(4)
            , n = s(1)
            , a = s(16)
            , r = s(7)
            , l = s(0)
            , c = s(2)
            , h = s(3);
        const d = $("body")
            , u = []
            , p = []
            , m = "like__drop"
            , _ = "." + m
            , g = 10 * o.a
            , f = {
            init(t) {
                if (Object(l.a)(t)) {
                    const e = this
                        , s = $(document).find(t);
                    $("html").hasClass("is-authorized") ? e.load(s) : d.on("bitrixDynamicCompositeSuccess.eksmo", () => {
                            $("html").hasClass("is-authorized") && e.load(s)
                        }
                    ),
                        s.off("click.like mouseenter.like mouseleave.like"),
                        s.on("click.like", (function(t) {
                                t.preventDefault(),
                                    e.change(this)
                            }
                        )),
                        s.on("mouseenter.like", (function() {
                                if (!Object(i.a)()) {
                                    const t = $(this);
                                    t.find(_).remove(),
                                        e.setZindexBookLike(t, !1),
                                    Object(c.getW)() > h.eksmoBP.mdMin && (t.hasClass("js-active") ? t.append(`<div class="${m}"><div class="tip"><div class="tip__style">Удалить из избранного</div></div></div>`) : t.append(`<div class="${m}"><div class="tip"><div class="tip__style">Добавить в избранное</div></div></div>`)),
                                        e.setZindexBookLike(t, !0),
                                        t.find(_).show()
                                }
                            }
                        )),
                        s.on("mouseleave.like", (function() {
                                if (!Object(i.a)()) {
                                    const t = $(this);
                                    t.find(_).remove(),
                                        e.setZindexBookLike(t, !1)
                                }
                            }
                        ))
                }
            },
            load(t) {
                t.length && (t.each((function() {
                        const t = $(this)
                            , e = t.attr("data-type")
                            , s = t.attr("data-id");
                        null != e && e.length && !p.includes(e) && p.push(e),
                        null != s && s.length && !u.includes(s) && u.push(s)
                    }
                )),
                p.length && u.length && !Object(r.a)() && $.post("/ajax/like/list/", {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        },
                        type: p,
                        a_guid: u
                    }, e => {
                        const s = $.parseJSON(e);
                        for (let e = 0; e < s.length; e++) {
                            const i = s[e];
                            if (Object(l.a)(null == i ? void 0 : i.GUID) && "string" == typeof (null == i ? void 0 : i.SELECTED) && "Y" === (null == i ? void 0 : i.SELECTED)) {
                                let e = "";
                                e = i.TYPE ? t.filter(`[data-id=${i.GUID}]`).filter(`[data-type=${i.TYPE}]`) : t.filter(`[data-id=${i.GUID}]`),
                                    e.addClass("js-active")
                            }
                        }
                    }
                ))
            },
            change(t) {
                const e = $(t);
                if (e.length) {
                    const t = e.attr("data-type")
                        , s = e.attr("data-id");
                    null != t && t.length && null != s && s.length && $.get("/ajax/like/add/", {
                            headers: {
                                "X-Requested-With": "XMLHttpRequest"
                            },
                            type: t,
                            guid: s
                        }, i => {
                            if ("AUTH" === i.trim())
                                Object(a.a)();
                            else {
                                var o, r;
                                let a = !1
                                    , p = $.parseJSON(i);
                                if (p = null === (o = p) || void 0 === o ? void 0 : o[s],
                                    "Y" === (null === (r = p) || void 0 === r ? void 0 : r.SELECTED) ? (e.addClass("js-active"),
                                        a = !0) : e.removeClass("js-active"),
                                    e.find(_).remove(),
                                    this.setZindexBookLike(e, !1),
                                Object(c.getW)() > h.eksmoBP.mdMin && (e.hasClass("js-active") ? e.append(`<div class="${m}">\n                                            <div class="tip tip_orange">\n                                                <div class="tip__style">Добавлено в избранное</div>\n                                            </div>\n                                        </div>`) : e.append(`<div class="${m}">\n                                            <div class="tip tip_orange">\n                                                <div class="tip__style">Удалено из избранного</div>\n                                            </div>\n                                        </div>`)),
                                    this.setZindexBookLike(e, !0),
                                    e.find(_).show(),
                                    setTimeout( () => {
                                            e.find(_).remove(),
                                                this.setZindexBookLike(e, !1)
                                        }
                                        , g),
                                    d.trigger("like.eksmo", [e, a]),
                                "products" === t || "products_electro" === t || "products_audio" === t) {
                                    var l;
                                    let t;
                                    const s = e.closest(".book")
                                        , i = e.closest(".article_book")
                                        , o = e.closest(".book-page");
                                    var u;
                                    if (s.length ? t = s.find(".book__name").first().text().trim() : i.length ? t = i.find(".article__name").first().text().trim() : o.length && (t = o.find(".book-page__card-title").first().text().trim()),
                                        a)
                                        null !== (u = t) && void 0 !== u && u.length && d.trigger("likeTo.eksmo", [e]);
                                    else
                                        null !== (l = t) && void 0 !== l && l.length && (n.a.customDL({
                                            event: "eksmo",
                                            eventAction: "click",
                                            eventCategory: "Удаление из избранного",
                                            eventLabel: t
                                        }),
                                            d.trigger("likeToCancel.eksmo", [e]));
                                    n.a.setWishListMD()
                                }
                            }
                        }
                    )
                }
            },
            setZindexBookLike(t, e=!1) {
                const s = t.closest(".author__like")
                    , i = t.closest(".owl-item");
                i.length ? i.css({
                    "z-index": e ? 1 : 0
                }) : s.length && s.css({
                    "z-index": e ? 1 : 0
                })
            }
        }
    },
    130: function(t, e, s) {
        "use strict";
        s(21);
        var i = s(2)
            , o = s(3)
            , n = s(4)
            , a = s(5)
            , r = s(8)
            , l = s(9);
        const c = $("body")
            , h = $(".publications_slider .publications__box");
        function d(t) {
            Object(a.a)(Object(l.a)(t) ? $(t.target).find(".publications__bg") : $(".publications__bg"), r.a)
        }
        function u() {
            Object(i.getW)() > o.eksmoBP.smMin ? h.each((function() {
                    $(this).trigger("destroy.owl.carousel").removeClass("owl-carousel").addClass("owl-carousel").owlCarousel({
                        loop: !0,
                        smartSpeed: 2 * n.a,
                        margin: 16,
                        nav: !0,
                        items: 3,
                        dots: !1,
                        sArrows: ".publications__arrows",
                        navClass: ["publications__prev arrow arrow_prev arrow_shadow", "publications__next arrow arrow_next arrow_shadow"],
                        navText: ["", ""],
                        onInitialized: d,
                        responsive: {
                            1200: {
                                items: 3
                            }
                        }
                    })
                }
            )) : h.trigger("destroy.owl.carousel")
        }
        d(),
            u(),
            c.on("eksmoResizeWidth", u),
            c.on("eksmoPagenavAjax", d)
    },
    149: function(t, e, s) {
        "use strict";
        s.d(e, "a", (function() {
                return i
            }
        ));
        class i {
            static _formInited(t) {
                window.addEventListener("b24:form:init", e => {
                        const s = e.detail.object;
                        t && Object.keys(t) && 0 !== Object.keys(t).length && Object.keys(t).forEach(e => {
                                t[e] && s.setProperty(e, t[e])
                            }
                        ),
                            s.setProperty("from_url", window.location.href),
                            s.setProperty("page_title", document.querySelector("title").textContent)
                    }
                )
            }
            setEventInitedBitrix(t) {
                this._obj = t,
                    i._formInited(this._obj)
            }
            loadPopupForm(t, e) {
                !function(e, s, i, o) {
                    null === (o = document.querySelector(".b24-script")) || void 0 === o || o.remove();
                    const n = s.createElement("script");
                    n.src = `${i}?${Date.now() / 18e4 | 0}`,
                        n.setAttribute("data-b24-form", t),
                        n.setAttribute("data-skip-moving", "true"),
                        n.classList.add("b24-script");
                    const a = s.getElementsByTagName("script")[0];
                    a.parentNode.insertBefore(n, a),
                        n.onload = function() {
                            setTimeout( () => {
                                    const t = $(".b24-form").first().detach();
                                    $.fancybox.open({
                                        type: "html",
                                        src: t,
                                        touch: !1,
                                        afterLoad: () => {
                                            document.dispatchEvent(new CustomEvent("open.popup.eksmo"))
                                        }
                                    })
                                }
                                , 300)
                        }
                }(window, document, e)
            }
        }
    },
    15: function(t, e, s) {
        var i, o;
        o = this,
        void 0 === (i = function() {
            return o.svg4everybody = function() {
                /*! svg4everybody v2.1.9 | github.com/jonathantneal/svg4everybody */
                function t(t, e, s) {
                    if (s) {
                        var i = document.createDocumentFragment()
                            , o = !e.hasAttribute("viewBox") && s.getAttribute("viewBox");
                        o && e.setAttribute("viewBox", o);
                        for (var n = s.cloneNode(!0); n.childNodes.length; )
                            i.appendChild(n.firstChild);
                        t.appendChild(i)
                    }
                }
                function e(e) {
                    e.onreadystatechange = function() {
                        if (4 === e.readyState) {
                            var s = e._cachedDocument;
                            s || ((s = e._cachedDocument = document.implementation.createHTMLDocument("")).body.innerHTML = e.responseText,
                                e._cachedTarget = {}),
                                e._embeds.splice(0).map((function(i) {
                                        var o = e._cachedTarget[i.id];
                                        o || (o = e._cachedTarget[i.id] = s.getElementById(i.id)),
                                            t(i.parent, i.svg, o)
                                    }
                                ))
                        }
                    }
                        ,
                        e.onreadystatechange()
                }
                function s(t) {
                    for (var e = t; "svg" !== e.nodeName.toLowerCase() && (e = e.parentNode); )
                        ;
                    return e
                }
                return function(i) {
                    var o, n = Object(i), a = window.top !== window.self;
                    o = "polyfill"in n ? n.polyfill : /\bTrident\/[567]\b|\bMSIE (?:9|10)\.0\b/.test(navigator.userAgent) || (navigator.userAgent.match(/\bEdge\/12\.(\d+)\b/) || [])[1] < 10547 || (navigator.userAgent.match(/\bAppleWebKit\/(\d+)\b/) || [])[1] < 537 || /\bEdge\/.(\d+)\b/.test(navigator.userAgent) && a;
                    var r = {}
                        , l = window.requestAnimationFrame || setTimeout
                        , c = document.getElementsByTagName("use")
                        , h = 0;
                    o && function i() {
                        for (var a = 0; a < c.length; ) {
                            var d = c[a]
                                , u = d.parentNode
                                , p = s(u)
                                , m = d.getAttribute("xlink:href") || d.getAttribute("href");
                            if (!m && n.attributeName && (m = d.getAttribute(n.attributeName)),
                            p && m) {
                                if (o)
                                    if (!n.validate || n.validate(m, p, d)) {
                                        u.removeChild(d);
                                        var _ = m.split("#")
                                            , g = _.shift()
                                            , f = _.join("#");
                                        if (g.length) {
                                            var v = r[g];
                                            v || ((v = r[g] = new XMLHttpRequest).open("GET", g),
                                                v.send(),
                                                v._embeds = []),
                                                v._embeds.push({
                                                    parent: u,
                                                    svg: p,
                                                    id: f
                                                }),
                                                e(v)
                                        } else
                                            t(u, p, document.getElementById(f))
                                    } else
                                        ++a,
                                            ++h
                            } else
                                ++a
                        }
                        (!c.length || c.length - h > 0) && l(i, 67)
                    }()
                }
            }()
        }
            .apply(e, [])) || (t.exports = i)
    },
    157: function(t, e, s) {
        "use strict";
        s.r(e);
        var i = s(5)
            , o = s(8)
            , n = s(1);
        s(21);
        const a = $(".brands:not(.brands_simple)");
        function r(t, e) {
            n.a.customDL({
                event: "eksmo",
                eventAction: e,
                eventCategory: $("title").text().trim(),
                eventLabel: "Наши бренды" + ("click" === e ? " - " + t.attr("href") : "")
            })
        }
        var l;
        a.length && (l = a.find(".brands__dlogos-link"),
            Object(i.a)(l, o.a)),
            Object(i.a)($(".brands"), t => {
                    r(t, "view")
                }
                , 0, 0, .8),
            $(".brands__dlogos-link").on("click", (function() {
                    r($(this), "click")
                }
            ))
    },
    16: function(t, e, s) {
        "use strict";
        function i() {
            const t = $(".js-link-auth-forms");
            t.length && t.first().click()
        }
        s.d(e, "a", (function() {
                return i
            }
        ))
    },
    167: function(t, e, s) {
        "use strict";
        var i = s(3)
            , o = s(4)
            , n = s(2);
        s(21);
        const a = $("body")
            , r = $(".list-author-blocks__slider");
        function l(t, e) {
            e < i.eksmoBP.smMin ? r.each((function() {
                    $(this).trigger("destroy.owl.carousel").removeClass("owl-carousel").addClass("owl-carousel").owlCarousel({
                        smartSpeed: 2 * o.a,
                        autoWidth: !0
                    })
                }
            )) : r.trigger("destroy.owl.carousel")
        }
        l(0, Object(n.getW)()),
            a.on("eksmoResizeWidth", l)
    },
    169: function(t, e, s) {
        "use strict";
        var i = s(2)
            , o = s(3)
            , n = s(6)
            , a = s(149);
        const r = $(".rdc-map")
            , l = $(".rdc-map__modal")
            , c = "rdc-map__modal_show"
            , h = new a.a;
        function d(t, e, s) {
            r.attr("data-value-country", t),
                r.attr("data-value-city", e),
                r.attr("data-value-rdc", s)
        }
        function u() {
            h.setEventInitedBitrix({
                rdc_system: r.attr("data-value-rdc"),
                city: r.attr("data-value-city"),
                country: r.attr("data-value-country")
            }),
                "eksmo.ru" === window.location.hostname ? h.loadPopupForm("inline/9/ahu41e", "https://crm.eksmo.ru/upload/crm/form/loader_9_ahu41e.js") : h.loadPopupForm("inline/6/svpzga", "https://dev-i.eksmo.ru/upload/crm/form/loader_6_svpzga.js")
        }
        $(".rdc-map__dot").on("click", (function() {
                const t = $(this)
                    , e = t.closest(".rdc-map__dot-block").attr("data-dot-num")
                    , s = t.closest(".rdc-map").find(`.rdc-map__modal[data-modal="${e}"]`)
                    , i = t.find(".rdc-map__dot-text").text();
                l.removeClass(c),
                    s.addClass(c),
                    d(i)
            }
        )),
            $(".rdc-map__modal-close").on("click", () => {
                    l.removeClass(c)
                }
            ),
        Object(i.getW)() < o.eksmoBP.mdMin && Object(n.a)() && $('.rdc-map__modal[data-modal="info"]').addClass(c),
            $(".rdc-map__search-cont .search-content").on("select.dropDown.searchContent.eksmo", (t, e, s, i) => {
                    i && (d(e, s, i),
                        u())
                }
            ),
            $(".rdc-map__modal-link-form-popup").on("click", (function() {
                    const t = $(this);
                    d(t.attr("data-country"), t.attr("data-city"), t.attr("data-value")),
                        u()
                }
            ))
    },
    21: function(t, e) {
        var s, i, o;
        !function(t, e, s, i) {
            function o(e, s) {
                this.settings = null,
                    this.options = t.extend({}, o.Defaults, s),
                    this.$element = t(e),
                    this._handlers = {},
                    this._plugins = {},
                    this._supress = {},
                    this._current = null,
                    this._speed = null,
                    this._coordinates = [],
                    this._breakpoint = null,
                    this._width = null,
                    this._items = [],
                    this._clones = [],
                    this._mergers = [],
                    this._widths = [],
                    this._invalidated = {},
                    this._pipe = [],
                    this._drag = {
                        time: null,
                        target: null,
                        pointer: null,
                        stage: {
                            start: null,
                            current: null
                        },
                        direction: null
                    },
                    this._states = {
                        current: {},
                        tags: {
                            initializing: ["busy"],
                            animating: ["busy"],
                            dragging: ["interacting"]
                        }
                    },
                    t.each(["onResize", "onThrottledResize"], t.proxy((function(e, s) {
                            this._handlers[s] = t.proxy(this[s], this)
                        }
                    ), this)),
                    t.each(o.Plugins, t.proxy((function(t, e) {
                            this._plugins[t.charAt(0).toLowerCase() + t.slice(1)] = new e(this)
                        }
                    ), this)),
                    t.each(o.Workers, t.proxy((function(e, s) {
                            this._pipe.push({
                                filter: s.filter,
                                run: t.proxy(s.run, this)
                            })
                        }
                    ), this)),
                    this.setup(),
                    this.initialize()
            }
            o.Defaults = {
                items: 3,
                loop: !1,
                center: !1,
                rewind: !1,
                checkVisibility: !0,
                mouseDrag: !0,
                touchDrag: !0,
                pullDrag: !0,
                freeDrag: !1,
                margin: 0,
                stagePadding: 0,
                merge: !1,
                mergeFit: !0,
                autoWidth: !1,
                startPosition: 0,
                rtl: !1,
                smartSpeed: 250,
                fluidSpeed: !1,
                dragEndSpeed: !1,
                responsive: {},
                responsiveRefreshRate: 200,
                responsiveBaseElement: e,
                fallbackEasing: "swing",
                slideTransition: "",
                info: !1,
                nestedItemSelector: !1,
                itemElement: "div",
                stageElement: "div",
                refreshClass: "owl-refresh",
                loadedClass: "owl-loaded",
                loadingClass: "owl-loading",
                rtlClass: "owl-rtl",
                responsiveClass: "owl-responsive",
                dragClass: "owl-drag",
                itemClass: "owl-item",
                stageClass: "owl-stage",
                stageOuterClass: "owl-stage-outer",
                grabClass: "owl-grab"
            },
                o.Width = {
                    Default: "default",
                    Inner: "inner",
                    Outer: "outer"
                },
                o.Type = {
                    Event: "event",
                    State: "state"
                },
                o.Plugins = {},
                o.Workers = [{
                    filter: ["width", "settings"],
                    run: function() {
                        this._width = this.$element.width()
                    }
                }, {
                    filter: ["width", "items", "settings"],
                    run: function(t) {
                        t.current = this._items && this._items[this.relative(this._current)]
                    }
                }, {
                    filter: ["items", "settings"],
                    run: function() {
                        this.$stage.children(".cloned").remove()
                    }
                }, {
                    filter: ["width", "items", "settings"],
                    run: function(t) {
                        var e = this.settings.margin || ""
                            , s = !this.settings.autoWidth
                            , i = this.settings.rtl
                            , o = {
                            width: "auto",
                            "margin-left": i ? e : "",
                            "margin-right": i ? "" : e
                        };
                        !s && this.$stage.children().css(o),
                            t.css = o
                    }
                }, {
                    filter: ["width", "items", "settings"],
                    run: function(t) {
                        var e = (this.width() / this.settings.items).toFixed(3) - this.settings.margin
                            , s = null
                            , i = this._items.length
                            , o = !this.settings.autoWidth
                            , n = [];
                        for (t.items = {
                            merge: !1,
                            width: e
                        }; i--; )
                            s = this._mergers[i],
                                s = this.settings.mergeFit && Math.min(s, this.settings.items) || s,
                                t.items.merge = s > 1 || t.items.merge,
                                n[i] = o ? e * s : this._items[i].width();
                        this._widths = n
                    }
                }, {
                    filter: ["items", "settings"],
                    run: function() {
                        var e = []
                            , s = this._items
                            , i = this.settings
                            , o = Math.max(2 * i.items, 4)
                            , n = 2 * Math.ceil(s.length / 2)
                            , a = i.loop && s.length ? i.rewind ? o : Math.max(o, n) : 0
                            , r = ""
                            , l = "";
                        for (a /= 2; a > 0; )
                            e.push(this.normalize(e.length / 2, !0)),
                                r += s[e[e.length - 1]][0].outerHTML,
                                e.push(this.normalize(s.length - 1 - (e.length - 1) / 2, !0)),
                                l = s[e[e.length - 1]][0].outerHTML + l,
                                a -= 1;
                        this._clones = e,
                            t(r).addClass("cloned").appendTo(this.$stage),
                            t(l).addClass("cloned").prependTo(this.$stage)
                    }
                }, {
                    filter: ["width", "items", "settings"],
                    run: function() {
                        for (var t = this.settings.rtl ? 1 : -1, e = this._clones.length + this._items.length, s = -1, i = 0, o = 0, n = []; ++s < e; )
                            i = n[s - 1] || 0,
                                o = this._widths[this.relative(s)] + this.settings.margin,
                                n.push(i + o * t);
                        this._coordinates = n
                    }
                }, {
                    filter: ["width", "items", "settings"],
                    run: function() {
                        var t = this.settings.stagePadding
                            , e = this._coordinates
                            , s = {
                            width: Math.ceil(Math.abs(e[e.length - 1])) + 2 * t,
                            "padding-left": t || "",
                            "padding-right": t || ""
                        };
                        this.$stage.css(s)
                    }
                }, {
                    filter: ["width", "items", "settings"],
                    run: function(t) {
                        var e = this._coordinates.length
                            , s = !this.settings.autoWidth
                            , i = this.$stage.children();
                        if (s && t.items.merge)
                            for (; e--; )
                                t.css.width = this._widths[this.relative(e)],
                                    i.eq(e).css(t.css);
                        else
                            s && (t.css.width = t.items.width,
                                i.css(t.css))
                    }
                }, {
                    filter: ["items"],
                    run: function() {
                        this._coordinates.length < 1 && this.$stage.removeAttr("style")
                    }
                }, {
                    filter: ["width", "items", "settings"],
                    run: function(t) {
                        t.current = t.current ? this.$stage.children().index(t.current) : 0,
                            t.current = Math.max(this.minimum(), Math.min(this.maximum(), t.current)),
                            this.reset(t.current)
                    }
                }, {
                    filter: ["position"],
                    run: function() {
                        this.animate(this.coordinates(this._current))
                    }
                }, {
                    filter: ["width", "position", "items", "settings"],
                    run: function() {
                        var t, e, s, i, o = this.settings.rtl ? 1 : -1, n = 2 * this.settings.stagePadding, a = this.coordinates(this.current()) + n, r = a + this.width() * o, l = [];
                        for (s = 0,
                                 i = this._coordinates.length; s < i; s++)
                            t = this._coordinates[s - 1] || 0,
                                e = Math.abs(this._coordinates[s]) + n * o,
                            (this.op(t, "<=", a) && this.op(t, ">", r) || this.op(e, "<", a) && this.op(e, ">", r)) && l.push(s);
                        this.$stage.children(".active").removeClass("active"),
                            this.$stage.children(":eq(" + l.join("), :eq(") + ")").addClass("active"),
                            this.$stage.children(".center").removeClass("center"),
                        this.settings.center && this.$stage.children().eq(this.current()).addClass("center")
                    }
                }],
                o.prototype.initializeStage = function() {
                    this.$stage = this.$element.find("." + this.settings.stageClass),
                    this.$stage.length || (this.$element.addClass(this.options.loadingClass),
                        this.$stage = t("<" + this.settings.stageElement + ">", {
                            class: this.settings.stageClass
                        }).wrap(t("<div/>", {
                            class: this.settings.stageOuterClass
                        })),
                        this.$element.append(this.$stage.parent()))
                }
                ,
                o.prototype.initializeItems = function() {
                    var e = this.$element.find(".owl-item");
                    if (e.length)
                        return this._items = e.get().map((function(e) {
                                return t(e)
                            }
                        )),
                            this._mergers = this._items.map((function() {
                                    return 1
                                }
                            )),
                            void this.refresh();
                    this.replace(this.$element.children().not(this.$stage.parent())),
                        this.isVisible() ? this.refresh() : this.invalidate("width"),
                        this.$element.removeClass(this.options.loadingClass).addClass(this.options.loadedClass)
                }
                ,
                o.prototype.initialize = function() {
                    var t, e, s;
                    (this.enter("initializing"),
                        this.trigger("initialize"),
                        this.$element.toggleClass(this.settings.rtlClass, this.settings.rtl),
                    this.settings.autoWidth && !this.is("pre-loading")) && (t = this.$element.find("img"),
                        e = this.settings.nestedItemSelector ? "." + this.settings.nestedItemSelector : i,
                        s = this.$element.children(e).width(),
                    t.length && s <= 0 && this.preloadAutoWidthImages(t));
                    this.initializeStage(),
                        this.initializeItems(),
                        this.registerEventHandlers(),
                        this.leave("initializing"),
                        this.trigger("initialized")
                }
                ,
                o.prototype.isVisible = function() {
                    return !this.settings.checkVisibility || this.$element.is(":visible")
                }
                ,
                o.prototype.setup = function() {
                    var e = this.viewport()
                        , s = this.options.responsive
                        , i = -1
                        , o = null;
                    s ? (t.each(s, (function(t) {
                            t <= e && t > i && (i = Number(t))
                        }
                    )),
                    "function" == typeof (o = t.extend({}, this.options, s[i])).stagePadding && (o.stagePadding = o.stagePadding()),
                        delete o.responsive,
                    o.responsiveClass && this.$element.attr("class", this.$element.attr("class").replace(new RegExp("(" + this.options.responsiveClass + "-)\\S+\\s","g"), "$1" + i))) : o = t.extend({}, this.options),
                        this.trigger("change", {
                            property: {
                                name: "settings",
                                value: o
                            }
                        }),
                        this._breakpoint = i,
                        this.settings = o,
                        this.invalidate("settings"),
                        this.trigger("changed", {
                            property: {
                                name: "settings",
                                value: this.settings
                            }
                        })
                }
                ,
                o.prototype.optionsLogic = function() {
                    this.settings.autoWidth && (this.settings.stagePadding = !1,
                        this.settings.merge = !1)
                }
                ,
                o.prototype.prepare = function(e) {
                    var s = this.trigger("prepare", {
                        content: e
                    });
                    return s.data || (s.data = t("<" + this.settings.itemElement + "/>").addClass(this.options.itemClass).append(e)),
                        this.trigger("prepared", {
                            content: s.data
                        }),
                        s.data
                }
                ,
                o.prototype.update = function() {
                    for (var e = 0, s = this._pipe.length, i = t.proxy((function(t) {
                            return this[t]
                        }
                    ), this._invalidated), o = {}; e < s; )
                        (this._invalidated.all || t.grep(this._pipe[e].filter, i).length > 0) && this._pipe[e].run(o),
                            e++;
                    this._invalidated = {},
                    !this.is("valid") && this.enter("valid")
                }
                ,
                o.prototype.width = function(t) {
                    switch (t = t || o.Width.Default) {
                        case o.Width.Inner:
                        case o.Width.Outer:
                            return this._width;
                        default:
                            return this._width - 2 * this.settings.stagePadding + this.settings.margin
                    }
                }
                ,
                o.prototype.refresh = function() {
                    this.enter("refreshing"),
                        this.trigger("refresh"),
                        this.setup(),
                        this.optionsLogic(),
                        this.$element.addClass(this.options.refreshClass),
                        this.update(),
                        this.$element.removeClass(this.options.refreshClass),
                        this.leave("refreshing"),
                        this.trigger("refreshed")
                }
                ,
                o.prototype.onThrottledResize = function() {
                    e.clearTimeout(this.resizeTimer),
                        this.resizeTimer = e.setTimeout(this._handlers.onResize, this.settings.responsiveRefreshRate)
                }
                ,
                o.prototype.onResize = function() {
                    return !!this._items.length && this._width !== this.$element.width() && !!this.isVisible() && (this.enter("resizing"),
                        this.trigger("resize").isDefaultPrevented() ? (this.leave("resizing"),
                            !1) : (this.invalidate("width"),
                            this.refresh(),
                            this.leave("resizing"),
                            void this.trigger("resized")))
                }
                ,
                o.prototype.registerEventHandlers = function() {
                    t.support.transition && this.$stage.on(t.support.transition.end + ".owl.core", t.proxy(this.onTransitionEnd, this)),
                    !1 !== this.settings.responsive && this.on(e, "resize", this._handlers.onThrottledResize),
                    this.settings.mouseDrag && (this.$element.addClass(this.options.dragClass),
                        this.$stage.on("mousedown.owl.core", t.proxy(this.onDragStart, this)),
                        this.$stage.on("dragstart.owl.core selectstart.owl.core", (function() {
                                return !1
                            }
                        ))),
                    this.settings.touchDrag && (this.$stage.on("touchstart.owl.core", t.proxy(this.onDragStart, this)),
                        this.$stage.on("touchcancel.owl.core", t.proxy(this.onDragEnd, this)))
                }
                ,
                o.prototype.onDragStart = function(e) {
                    var i = null;
                    3 !== e.which && (t.support.transform ? i = {
                        x: (i = this.$stage.css("transform").replace(/.*\(|\)| /g, "").split(","))[16 === i.length ? 12 : 4],
                        y: i[16 === i.length ? 13 : 5]
                    } : (i = this.$stage.position(),
                        i = {
                            x: this.settings.rtl ? i.left + this.$stage.width() - this.width() + this.settings.margin : i.left,
                            y: i.top
                        }),
                    this.is("animating") && (t.support.transform ? this.animate(i.x) : this.$stage.stop(),
                        this.invalidate("position")),
                        this.$element.toggleClass(this.options.grabClass, "mousedown" === e.type),
                        this.speed(0),
                        this._drag.time = (new Date).getTime(),
                        this._drag.target = t(e.target),
                        this._drag.stage.start = i,
                        this._drag.stage.current = i,
                        this._drag.pointer = this.pointer(e),
                        t(s).on("mouseup.owl.core touchend.owl.core", t.proxy(this.onDragEnd, this)),
                        t(s).one("mousemove.owl.core touchmove.owl.core", t.proxy((function(e) {
                                var i = this.difference(this._drag.pointer, this.pointer(e));
                                t(s).on("mousemove.owl.core touchmove.owl.core", t.proxy(this.onDragMove, this)),
                                Math.abs(i.x) < Math.abs(i.y) && this.is("valid") || (e.preventDefault(),
                                    this.enter("dragging"),
                                    this.trigger("drag"))
                            }
                        ), this)))
                }
                ,
                o.prototype.onDragMove = function(t) {
                    var e = null
                        , s = null
                        , i = null
                        , o = this.difference(this._drag.pointer, this.pointer(t))
                        , n = this.difference(this._drag.stage.start, o);
                    this.is("dragging") && (t.preventDefault(),
                        this.settings.loop ? (e = this.coordinates(this.minimum()),
                            s = this.coordinates(this.maximum() + 1) - e,
                            n.x = ((n.x - e) % s + s) % s + e) : (e = this.settings.rtl ? this.coordinates(this.maximum()) : this.coordinates(this.minimum()),
                            s = this.settings.rtl ? this.coordinates(this.minimum()) : this.coordinates(this.maximum()),
                            i = this.settings.pullDrag ? -1 * o.x / 5 : 0,
                            n.x = Math.max(Math.min(n.x, e + i), s + i)),
                        this._drag.stage.current = n,
                        this.animate(n.x))
                }
                ,
                o.prototype.onDragEnd = function(e) {
                    var i = this.difference(this._drag.pointer, this.pointer(e))
                        , o = this._drag.stage.current
                        , n = i.x > 0 ^ this.settings.rtl ? "left" : "right";
                    t(s).off(".owl.core"),
                        this.$element.removeClass(this.options.grabClass),
                    (0 !== i.x && this.is("dragging") || !this.is("valid")) && (this.speed(this.settings.dragEndSpeed || this.settings.smartSpeed),
                        this.current(this.closest(o.x, 0 !== i.x ? n : this._drag.direction)),
                        this.invalidate("position"),
                        this.update(),
                        this._drag.direction = n,
                    (Math.abs(i.x) > 3 || (new Date).getTime() - this._drag.time > 300) && this._drag.target.one("click.owl.core", (function() {
                            return !1
                        }
                    ))),
                    this.is("dragging") && (this.leave("dragging"),
                        this.trigger("dragged"))
                }
                ,
                o.prototype.closest = function(e, s) {
                    var o = -1
                        , n = this.width()
                        , a = this.coordinates();
                    return this.settings.freeDrag || t.each(a, t.proxy((function(t, r) {
                            return "left" === s && e > r - 30 && e < r + 30 ? o = t : "right" === s && e > r - n - 30 && e < r - n + 30 ? o = t + 1 : this.op(e, "<", r) && this.op(e, ">", a[t + 1] !== i ? a[t + 1] : r - n) && (o = "left" === s ? t + 1 : t),
                            -1 === o
                        }
                    ), this)),
                    this.settings.loop || (this.op(e, ">", a[this.minimum()]) ? o = e = this.minimum() : this.op(e, "<", a[this.maximum()]) && (o = e = this.maximum())),
                        o
                }
                ,
                o.prototype.animate = function(e) {
                    var s = this.speed() > 0;
                    this.is("animating") && this.onTransitionEnd(),
                    s && (this.enter("animating"),
                        this.trigger("translate")),
                        t.support.transform3d && t.support.transition ? this.$stage.css({
                            transform: "translate3d(" + e + "px,0px,0px)",
                            transition: this.speed() / 1e3 + "s" + (this.settings.slideTransition ? " " + this.settings.slideTransition : "")
                        }) : s ? this.$stage.animate({
                            left: e + "px"
                        }, this.speed(), this.settings.fallbackEasing, t.proxy(this.onTransitionEnd, this)) : this.$stage.css({
                            left: e + "px"
                        })
                }
                ,
                o.prototype.is = function(t) {
                    return this._states.current[t] && this._states.current[t] > 0
                }
                ,
                o.prototype.current = function(t) {
                    if (t === i)
                        return this._current;
                    if (0 === this._items.length)
                        return i;
                    if (t = this.normalize(t),
                    this._current !== t) {
                        var e = this.trigger("change", {
                            property: {
                                name: "position",
                                value: t
                            }
                        });
                        e.data !== i && (t = this.normalize(e.data)),
                            this._current = t,
                            this.invalidate("position"),
                            this.trigger("changed", {
                                property: {
                                    name: "position",
                                    value: this._current
                                }
                            })
                    }
                    return this._current
                }
                ,
                o.prototype.invalidate = function(e) {
                    return "string" === t.type(e) && (this._invalidated[e] = !0,
                    this.is("valid") && this.leave("valid")),
                        t.map(this._invalidated, (function(t, e) {
                                return e
                            }
                        ))
                }
                ,
                o.prototype.reset = function(t) {
                    (t = this.normalize(t)) !== i && (this._speed = 0,
                        this._current = t,
                        this.suppress(["translate", "translated"]),
                        this.animate(this.coordinates(t)),
                        this.release(["translate", "translated"]))
                }
                ,
                o.prototype.normalize = function(t, e) {
                    var s = this._items.length
                        , o = e ? 0 : this._clones.length;
                    return !this.isNumeric(t) || s < 1 ? t = i : (t < 0 || t >= s + o) && (t = ((t - o / 2) % s + s) % s + o / 2),
                        t
                }
                ,
                o.prototype.relative = function(t) {
                    return t -= this._clones.length / 2,
                        this.normalize(t, !0)
                }
                ,
                o.prototype.maximum = function(t) {
                    var e, s, i, o = this.settings, n = this._coordinates.length;
                    if (o.loop)
                        n = this._clones.length / 2 + this._items.length - 1;
                    else if (o.autoWidth || o.merge) {
                        if (e = this._items.length)
                            for (s = this._items[--e].width(),
                                     i = this.$element.width(); e-- && !((s += this._items[e].width() + this.settings.margin) > i); )
                                ;
                        n = e + 1
                    } else
                        n = o.center ? this._items.length - 1 : this._items.length - o.items;
                    return t && (n -= this._clones.length / 2),
                        Math.max(n, 0)
                }
                ,
                o.prototype.minimum = function(t) {
                    return t ? 0 : this._clones.length / 2
                }
                ,
                o.prototype.items = function(t) {
                    return t === i ? this._items.slice() : (t = this.normalize(t, !0),
                        this._items[t])
                }
                ,
                o.prototype.mergers = function(t) {
                    return t === i ? this._mergers.slice() : (t = this.normalize(t, !0),
                        this._mergers[t])
                }
                ,
                o.prototype.clones = function(e) {
                    var s = this._clones.length / 2
                        , o = s + this._items.length
                        , n = function(t) {
                        return t % 2 == 0 ? o + t / 2 : s - (t + 1) / 2
                    };
                    return e === i ? t.map(this._clones, (function(t, e) {
                            return n(e)
                        }
                    )) : t.map(this._clones, (function(t, s) {
                            return t === e ? n(s) : null
                        }
                    ))
                }
                ,
                o.prototype.speed = function(t) {
                    return t !== i && (this._speed = t),
                        this._speed
                }
                ,
                o.prototype.coordinates = function(e) {
                    var s, o = 1, n = e - 1;
                    return e === i ? t.map(this._coordinates, t.proxy((function(t, e) {
                            return this.coordinates(e)
                        }
                    ), this)) : (this.settings.center ? (this.settings.rtl && (o = -1,
                        n = e + 1),
                        s = this._coordinates[e],
                        s += (this.width() - s + (this._coordinates[n] || 0)) / 2 * o) : s = this._coordinates[n] || 0,
                        s = Math.ceil(s))
                }
                ,
                o.prototype.duration = function(t, e, s) {
                    return 0 === s ? 0 : Math.min(Math.max(Math.abs(e - t), 1), 6) * Math.abs(s || this.settings.smartSpeed)
                }
                ,
                o.prototype.to = function(t, e) {
                    var s = this.current()
                        , i = null
                        , o = t - this.relative(s)
                        , n = (o > 0) - (o < 0)
                        , a = this._items.length
                        , r = this.minimum()
                        , l = this.maximum();
                    this.settings.loop ? (!this.settings.rewind && Math.abs(o) > a / 2 && (o += -1 * n * a),
                    (i = (((t = s + o) - r) % a + a) % a + r) !== t && i - o <= l && i - o > 0 && (s = i - o,
                        t = i,
                        this.reset(s))) : this.settings.rewind ? t = (t % (l += 1) + l) % l : t = Math.max(r, Math.min(l, t)),
                        this.speed(this.duration(s, t, e)),
                        this.current(t),
                    this.isVisible() && this.update()
                }
                ,
                o.prototype.next = function(t) {
                    t = t || !1,
                        this.to(this.relative(this.current()) + 1, t)
                }
                ,
                o.prototype.prev = function(t) {
                    t = t || !1,
                        this.to(this.relative(this.current()) - 1, t)
                }
                ,
                o.prototype.onTransitionEnd = function(t) {
                    if (t !== i && (t.stopPropagation(),
                    (t.target || t.srcElement || t.originalTarget) !== this.$stage.get(0)))
                        return !1;
                    this.leave("animating"),
                        this.trigger("translated")
                }
                ,
                o.prototype.viewport = function() {
                    var i;
                    return this.options.responsiveBaseElement !== e ? i = t(this.options.responsiveBaseElement).width() : e.innerWidth ? i = e.innerWidth : s.documentElement && s.documentElement.clientWidth ? i = s.documentElement.clientWidth : console.warn("Can not detect viewport width."),
                        i
                }
                ,
                o.prototype.replace = function(e) {
                    this.$stage.empty(),
                        this._items = [],
                    e && (e = e instanceof jQuery ? e : t(e)),
                    this.settings.nestedItemSelector && (e = e.find("." + this.settings.nestedItemSelector)),
                        e.filter((function() {
                                return 1 === this.nodeType
                            }
                        )).each(t.proxy((function(t, e) {
                                e = this.prepare(e),
                                    this.$stage.append(e),
                                    this._items.push(e),
                                    this._mergers.push(1 * e.find("[data-merge]").addBack("[data-merge]").attr("data-merge") || 1)
                            }
                        ), this)),
                        this.reset(this.isNumeric(this.settings.startPosition) ? this.settings.startPosition : 0),
                        this.invalidate("items")
                }
                ,
                o.prototype.add = function(e, s) {
                    var o = this.relative(this._current);
                    s = s === i ? this._items.length : this.normalize(s, !0),
                        e = e instanceof jQuery ? e : t(e),
                        this.trigger("add", {
                            content: e,
                            position: s
                        }),
                        e = this.prepare(e),
                        0 === this._items.length || s === this._items.length ? (0 === this._items.length && this.$stage.append(e),
                        0 !== this._items.length && this._items[s - 1].after(e),
                            this._items.push(e),
                            this._mergers.push(1 * e.find("[data-merge]").addBack("[data-merge]").attr("data-merge") || 1)) : (this._items[s].before(e),
                            this._items.splice(s, 0, e),
                            this._mergers.splice(s, 0, 1 * e.find("[data-merge]").addBack("[data-merge]").attr("data-merge") || 1)),
                    this._items[o] && this.reset(this._items[o].index()),
                        this.invalidate("items"),
                        this.trigger("added", {
                            content: e,
                            position: s
                        })
                }
                ,
                o.prototype.remove = function(t) {
                    (t = this.normalize(t, !0)) !== i && (this.trigger("remove", {
                        content: this._items[t],
                        position: t
                    }),
                        this._items[t].remove(),
                        this._items.splice(t, 1),
                        this._mergers.splice(t, 1),
                        this.invalidate("items"),
                        this.trigger("removed", {
                            content: null,
                            position: t
                        }))
                }
                ,
                o.prototype.preloadAutoWidthImages = function(e) {
                    e.each(t.proxy((function(e, s) {
                            this.enter("pre-loading"),
                                s = t(s),
                                t(new Image).one("load", t.proxy((function(t) {
                                        s.attr("src", t.target.src),
                                            s.css("opacity", 1),
                                            this.leave("pre-loading"),
                                        !this.is("pre-loading") && !this.is("initializing") && this.refresh()
                                    }
                                ), this)).attr("src", s.attr("src") || s.attr("data-src") || s.attr("data-src-retina"))
                        }
                    ), this))
                }
                ,
                o.prototype.destroy = function() {
                    for (var i in this.$element.off(".owl.core"),
                        this.$stage.off(".owl.core"),
                        t(s).off(".owl.core"),
                    !1 !== this.settings.responsive && (e.clearTimeout(this.resizeTimer),
                        this.off(e, "resize", this._handlers.onThrottledResize)),
                        this._plugins)
                        this._plugins[i].destroy();
                    this.$stage.children(".cloned").remove(),
                        this.$stage.unwrap(),
                        this.$stage.children().contents().unwrap(),
                        this.$stage.children().unwrap(),
                        this.$stage.remove(),
                        this.$element.removeClass(this.options.refreshClass).removeClass(this.options.loadingClass).removeClass(this.options.loadedClass).removeClass(this.options.rtlClass).removeClass(this.options.dragClass).removeClass(this.options.grabClass).attr("class", this.$element.attr("class").replace(new RegExp(this.options.responsiveClass + "-\\S+\\s","g"), "")).removeData("owl.carousel")
                }
                ,
                o.prototype.op = function(t, e, s) {
                    var i = this.settings.rtl;
                    switch (e) {
                        case "<":
                            return i ? t > s : t < s;
                        case ">":
                            return i ? t < s : t > s;
                        case ">=":
                            return i ? t <= s : t >= s;
                        case "<=":
                            return i ? t >= s : t <= s
                    }
                }
                ,
                o.prototype.on = function(t, e, s, i) {
                    t.addEventListener ? t.addEventListener(e, s, i) : t.attachEvent && t.attachEvent("on" + e, s)
                }
                ,
                o.prototype.off = function(t, e, s, i) {
                    t.removeEventListener ? t.removeEventListener(e, s, i) : t.detachEvent && t.detachEvent("on" + e, s)
                }
                ,
                o.prototype.trigger = function(e, s, i, n, a) {
                    var r = {
                        item: {
                            count: this._items.length,
                            index: this.current()
                        }
                    }
                        , l = t.camelCase(t.grep(["on", e, i], (function(t) {
                            return t
                        }
                    )).join("-").toLowerCase())
                        , c = t.Event([e, "owl", i || "carousel"].join(".").toLowerCase(), t.extend({
                        relatedTarget: this
                    }, r, s));
                    return this._supress[e] || (t.each(this._plugins, (function(t, e) {
                            e.onTrigger && e.onTrigger(c)
                        }
                    )),
                        this.register({
                            type: o.Type.Event,
                            name: e
                        }),
                        this.$element.trigger(c),
                    this.settings && "function" == typeof this.settings[l] && this.settings[l].call(this, c)),
                        c
                }
                ,
                o.prototype.enter = function(e) {
                    t.each([e].concat(this._states.tags[e] || []), t.proxy((function(t, e) {
                            this._states.current[e] === i && (this._states.current[e] = 0),
                                this._states.current[e]++
                        }
                    ), this))
                }
                ,
                o.prototype.leave = function(e) {
                    t.each([e].concat(this._states.tags[e] || []), t.proxy((function(t, e) {
                            this._states.current[e]--
                        }
                    ), this))
                }
                ,
                o.prototype.register = function(e) {
                    if (e.type === o.Type.Event) {
                        if (t.event.special[e.name] || (t.event.special[e.name] = {}),
                            !t.event.special[e.name].owl) {
                            var s = t.event.special[e.name]._default;
                            t.event.special[e.name]._default = function(t) {
                                return !s || !s.apply || t.namespace && -1 !== t.namespace.indexOf("owl") ? t.namespace && t.namespace.indexOf("owl") > -1 : s.apply(this, arguments)
                            }
                                ,
                                t.event.special[e.name].owl = !0
                        }
                    } else
                        e.type === o.Type.State && (this._states.tags[e.name] ? this._states.tags[e.name] = this._states.tags[e.name].concat(e.tags) : this._states.tags[e.name] = e.tags,
                            this._states.tags[e.name] = t.grep(this._states.tags[e.name], t.proxy((function(s, i) {
                                    return t.inArray(s, this._states.tags[e.name]) === i
                                }
                            ), this)))
                }
                ,
                o.prototype.suppress = function(e) {
                    t.each(e, t.proxy((function(t, e) {
                            this._supress[e] = !0
                        }
                    ), this))
                }
                ,
                o.prototype.release = function(e) {
                    t.each(e, t.proxy((function(t, e) {
                            delete this._supress[e]
                        }
                    ), this))
                }
                ,
                o.prototype.pointer = function(t) {
                    var s = {
                        x: null,
                        y: null
                    };
                    return (t = (t = t.originalEvent || t || e.event).touches && t.touches.length ? t.touches[0] : t.changedTouches && t.changedTouches.length ? t.changedTouches[0] : t).pageX ? (s.x = t.pageX,
                        s.y = t.pageY) : (s.x = t.clientX,
                        s.y = t.clientY),
                        s
                }
                ,
                o.prototype.isNumeric = function(t) {
                    return !isNaN(parseFloat(t))
                }
                ,
                o.prototype.difference = function(t, e) {
                    return {
                        x: t.x - e.x,
                        y: t.y - e.y
                    }
                }
                ,
                t.fn.owlCarousel = function(e) {
                    var s = Array.prototype.slice.call(arguments, 1);
                    return this.each((function() {
                            var i = t(this)
                                , n = i.data("owl.carousel");
                            n || (n = new o(this,"object" == typeof e && e),
                                i.data("owl.carousel", n),
                                t.each(["next", "prev", "to", "destroy", "refresh", "replace", "add", "remove"], (function(e, s) {
                                        n.register({
                                            type: o.Type.Event,
                                            name: s
                                        }),
                                            n.$element.on(s + ".owl.carousel.core", t.proxy((function(t) {
                                                    t.namespace && t.relatedTarget !== this && (this.suppress([s]),
                                                        n[s].apply(this, [].slice.call(arguments, 1)),
                                                        this.release([s]))
                                                }
                                            ), n))
                                    }
                                ))),
                            "string" == typeof e && "_" !== e.charAt(0) && n[e].apply(n, s)
                        }
                    ))
                }
                ,
                t.fn.owlCarousel.Constructor = o
        }(window.Zepto || window.jQuery, window, document),
            s = window.Zepto || window.jQuery,
            i = window,
            document,
            (o = function(t) {
                    this._core = t,
                        this._interval = null,
                        this._visible = null,
                        this._handlers = {
                            "initialized.owl.carousel": s.proxy((function(t) {
                                    t.namespace && this._core.settings.autoRefresh && this.watch()
                                }
                            ), this)
                        },
                        this._core.options = s.extend({}, o.Defaults, this._core.options),
                        this._core.$element.on(this._handlers)
                }
            ).Defaults = {
                autoRefresh: !0,
                autoRefreshInterval: 500
            },
            o.prototype.watch = function() {
                this._interval || (this._visible = this._core.isVisible(),
                    this._interval = i.setInterval(s.proxy(this.refresh, this), this._core.settings.autoRefreshInterval))
            }
            ,
            o.prototype.refresh = function() {
                this._core.isVisible() !== this._visible && (this._visible = !this._visible,
                    this._core.$element.toggleClass("owl-hidden", !this._visible),
                this._visible && this._core.invalidate("width") && this._core.refresh())
            }
            ,
            o.prototype.destroy = function() {
                var t, e;
                for (t in i.clearInterval(this._interval),
                    this._handlers)
                    this._core.$element.off(t, this._handlers[t]);
                for (e in Object.getOwnPropertyNames(this))
                    "function" != typeof this[e] && (this[e] = null)
            }
            ,
            s.fn.owlCarousel.Constructor.Plugins.AutoRefresh = o,
            function(t, e, s, i) {
                var o = function(e) {
                    this._core = e,
                        this._loaded = [],
                        this._handlers = {
                            "initialized.owl.carousel change.owl.carousel resized.owl.carousel": t.proxy((function(e) {
                                    if (e.namespace && this._core.settings && this._core.settings.lazyLoad && (e.property && "position" == e.property.name || "initialized" == e.type)) {
                                        var s = this._core.settings
                                            , i = s.center && Math.ceil(s.items / 2) || s.items
                                            , o = s.center && -1 * i || 0
                                            , n = (e.property && void 0 !== e.property.value ? e.property.value : this._core.current()) + o
                                            , a = this._core.clones().length
                                            , r = t.proxy((function(t, e) {
                                                this.load(e)
                                            }
                                        ), this);
                                        for (s.lazyLoadEager > 0 && (i += s.lazyLoadEager,
                                        s.loop && (n -= s.lazyLoadEager,
                                            i++)); o++ < i; )
                                            this.load(a / 2 + this._core.relative(n)),
                                            a && t.each(this._core.clones(this._core.relative(n)), r),
                                                n++
                                    }
                                }
                            ), this)
                        },
                        this._core.options = t.extend({}, o.Defaults, this._core.options),
                        this._core.$element.on(this._handlers)
                };
                o.Defaults = {
                    lazyLoad: !1,
                    lazyLoadEager: 0
                },
                    o.prototype.load = function(s) {
                        var i = this._core.$stage.children().eq(s)
                            , o = i && i.find(".owl-lazy");
                        !o || t.inArray(i.get(0), this._loaded) > -1 || (o.each(t.proxy((function(s, i) {
                                var o, n = t(i), a = e.devicePixelRatio > 1 && n.attr("data-src-retina") || n.attr("data-src") || n.attr("data-srcset");
                                this._core.trigger("load", {
                                    element: n,
                                    url: a
                                }, "lazy"),
                                    n.is("img") ? n.one("load.owl.lazy", t.proxy((function() {
                                            n.css("opacity", 1),
                                                this._core.trigger("loaded", {
                                                    element: n,
                                                    url: a
                                                }, "lazy")
                                        }
                                    ), this)).attr("src", a) : n.is("source") ? n.one("load.owl.lazy", t.proxy((function() {
                                            this._core.trigger("loaded", {
                                                element: n,
                                                url: a
                                            }, "lazy")
                                        }
                                    ), this)).attr("srcset", a) : ((o = new Image).onload = t.proxy((function() {
                                            n.css({
                                                "background-image": 'url("' + a + '")',
                                                opacity: "1"
                                            }),
                                                this._core.trigger("loaded", {
                                                    element: n,
                                                    url: a
                                                }, "lazy")
                                        }
                                    ), this),
                                        o.src = a)
                            }
                        ), this)),
                            this._loaded.push(i.get(0)))
                    }
                    ,
                    o.prototype.destroy = function() {
                        var t, e;
                        for (t in this.handlers)
                            this._core.$element.off(t, this.handlers[t]);
                        for (e in Object.getOwnPropertyNames(this))
                            "function" != typeof this[e] && (this[e] = null)
                    }
                    ,
                    t.fn.owlCarousel.Constructor.Plugins.Lazy = o
            }(window.Zepto || window.jQuery, window, document),
            function(t, e, s, i) {
                var o = function(s) {
                    this._core = s,
                        this._previousHeight = null,
                        this._handlers = {
                            "initialized.owl.carousel refreshed.owl.carousel": t.proxy((function(t) {
                                    t.namespace && this._core.settings.autoHeight && this.update()
                                }
                            ), this),
                            "changed.owl.carousel": t.proxy((function(t) {
                                    t.namespace && this._core.settings.autoHeight && "position" === t.property.name && this.update()
                                }
                            ), this),
                            "loaded.owl.lazy": t.proxy((function(t) {
                                    t.namespace && this._core.settings.autoHeight && t.element.closest("." + this._core.settings.itemClass).index() === this._core.current() && this.update()
                                }
                            ), this)
                        },
                        this._core.options = t.extend({}, o.Defaults, this._core.options),
                        this._core.$element.on(this._handlers),
                        this._intervalId = null;
                    var i = this;
                    t(e).on("load", (function() {
                            i._core.settings.autoHeight && i.update()
                        }
                    )),
                        t(e).resize((function() {
                                i._core.settings.autoHeight && (null != i._intervalId && clearTimeout(i._intervalId),
                                    i._intervalId = setTimeout((function() {
                                            i.update()
                                        }
                                    ), 250))
                            }
                        ))
                };
                o.Defaults = {
                    autoHeight: !1,
                    autoHeightClass: "owl-height"
                },
                    o.prototype.update = function() {
                        var e = this._core._current
                            , s = e + this._core.settings.items
                            , i = this._core.settings.lazyLoad
                            , o = this._core.$stage.children().toArray().slice(e, s)
                            , n = []
                            , a = 0;
                        t.each(o, (function(e, s) {
                                n.push(t(s).height())
                            }
                        )),
                        (a = Math.max.apply(null, n)) <= 1 && i && this._previousHeight && (a = this._previousHeight),
                            this._previousHeight = a,
                            this._core.$stage.parent().height(a).addClass(this._core.settings.autoHeightClass)
                    }
                    ,
                    o.prototype.destroy = function() {
                        var t, e;
                        for (t in this._handlers)
                            this._core.$element.off(t, this._handlers[t]);
                        for (e in Object.getOwnPropertyNames(this))
                            "function" != typeof this[e] && (this[e] = null)
                    }
                    ,
                    t.fn.owlCarousel.Constructor.Plugins.AutoHeight = o
            }(window.Zepto || window.jQuery, window, document),
            function(t, e, s, i) {
                var o = function(e) {
                    this._core = e,
                        this._videos = {},
                        this._playing = null,
                        this._handlers = {
                            "initialized.owl.carousel": t.proxy((function(t) {
                                    t.namespace && this._core.register({
                                        type: "state",
                                        name: "playing",
                                        tags: ["interacting"]
                                    })
                                }
                            ), this),
                            "resize.owl.carousel": t.proxy((function(t) {
                                    t.namespace && this._core.settings.video && this.isInFullScreen() && t.preventDefault()
                                }
                            ), this),
                            "refreshed.owl.carousel": t.proxy((function(t) {
                                    t.namespace && this._core.is("resizing") && this._core.$stage.find(".cloned .owl-video-frame").remove()
                                }
                            ), this),
                            "changed.owl.carousel": t.proxy((function(t) {
                                    t.namespace && "position" === t.property.name && this._playing && this.stop()
                                }
                            ), this),
                            "prepared.owl.carousel": t.proxy((function(e) {
                                    if (e.namespace) {
                                        var s = t(e.content).find(".owl-video");
                                        s.length && (s.css("display", "none"),
                                            this.fetch(s, t(e.content)))
                                    }
                                }
                            ), this)
                        },
                        this._core.options = t.extend({}, o.Defaults, this._core.options),
                        this._core.$element.on(this._handlers),
                        this._core.$element.on("click.owl.video", ".owl-video-play-icon", t.proxy((function(t) {
                                this.play(t)
                            }
                        ), this))
                };
                o.Defaults = {
                    video: !1,
                    videoHeight: !1,
                    videoWidth: !1
                },
                    o.prototype.fetch = function(t, e) {
                        var s = t.attr("data-vimeo-id") ? "vimeo" : t.attr("data-vzaar-id") ? "vzaar" : "youtube"
                            , i = t.attr("data-vimeo-id") || t.attr("data-youtube-id") || t.attr("data-vzaar-id")
                            , o = t.attr("data-width") || this._core.settings.videoWidth
                            , n = t.attr("data-height") || this._core.settings.videoHeight
                            , a = t.attr("href");
                        if (!a)
                            throw new Error("Missing video URL.");
                        if ((i = a.match(/(http:|https:|)\/\/(player.|www.|app.)?(vimeo\.com|youtu(be\.com|\.be|be\.googleapis\.com|be\-nocookie\.com)|vzaar\.com)\/(video\/|videos\/|embed\/|channels\/.+\/|groups\/.+\/|watch\?v=|v\/)?([A-Za-z0-9._%-]*)(\&\S+)?/))[3].indexOf("youtu") > -1)
                            s = "youtube";
                        else if (i[3].indexOf("vimeo") > -1)
                            s = "vimeo";
                        else {
                            if (!(i[3].indexOf("vzaar") > -1))
                                throw new Error("Video URL not supported.");
                            s = "vzaar"
                        }
                        i = i[6],
                            this._videos[a] = {
                                type: s,
                                id: i,
                                width: o,
                                height: n
                            },
                            e.attr("data-video", a),
                            this.thumbnail(t, this._videos[a])
                    }
                    ,
                    o.prototype.thumbnail = function(e, s) {
                        var i, o, n = s.width && s.height ? "width:" + s.width + "px;height:" + s.height + "px;" : "", a = e.find("img"), r = "src", l = "", c = this._core.settings, h = function(s) {
                            '<div class="owl-video-play-icon"></div>',
                                i = c.lazyLoad ? t("<div/>", {
                                    class: "owl-video-tn " + l,
                                    srcType: s
                                }) : t("<div/>", {
                                    class: "owl-video-tn",
                                    style: "opacity:1;background-image:url(" + s + ")"
                                }),
                                e.after(i),
                                e.after('<div class="owl-video-play-icon"></div>')
                        };
                        if (e.wrap(t("<div/>", {
                            class: "owl-video-wrapper",
                            style: n
                        })),
                        this._core.settings.lazyLoad && (r = "data-src",
                            l = "owl-lazy"),
                            a.length)
                            return h(a.attr(r)),
                                a.remove(),
                                !1;
                        "youtube" === s.type ? (o = "//img.youtube.com/vi/" + s.id + "/hqdefault.jpg",
                            h(o)) : "vimeo" === s.type ? t.ajax({
                            type: "GET",
                            url: "//vimeo.com/api/v2/video/" + s.id + ".json",
                            jsonp: "callback",
                            dataType: "jsonp",
                            success: function(t) {
                                o = t[0].thumbnail_large,
                                    h(o)
                            }
                        }) : "vzaar" === s.type && t.ajax({
                            type: "GET",
                            url: "//vzaar.com/api/videos/" + s.id + ".json",
                            jsonp: "callback",
                            dataType: "jsonp",
                            success: function(t) {
                                o = t.framegrab_url,
                                    h(o)
                            }
                        })
                    }
                    ,
                    o.prototype.stop = function() {
                        this._core.trigger("stop", null, "video"),
                            this._playing.find(".owl-video-frame").remove(),
                            this._playing.removeClass("owl-video-playing"),
                            this._playing = null,
                            this._core.leave("playing"),
                            this._core.trigger("stopped", null, "video")
                    }
                    ,
                    o.prototype.play = function(e) {
                        var s, i = t(e.target).closest("." + this._core.settings.itemClass), o = this._videos[i.attr("data-video")], n = o.width || "100%", a = o.height || this._core.$stage.height();
                        this._playing || (this._core.enter("playing"),
                            this._core.trigger("play", null, "video"),
                            i = this._core.items(this._core.relative(i.index())),
                            this._core.reset(i.index()),
                            (s = t('<iframe frameborder="0" allowfullscreen mozallowfullscreen webkitAllowFullScreen ></iframe>')).attr("height", a),
                            s.attr("width", n),
                            "youtube" === o.type ? s.attr("src", "//www.youtube.com/embed/" + o.id + "?autoplay=1&rel=0&v=" + o.id) : "vimeo" === o.type ? s.attr("src", "//player.vimeo.com/video/" + o.id + "?autoplay=1") : "vzaar" === o.type && s.attr("src", "//view.vzaar.com/" + o.id + "/player?autoplay=true"),
                            t(s).wrap('<div class="owl-video-frame" />').insertAfter(i.find(".owl-video")),
                            this._playing = i.addClass("owl-video-playing"))
                    }
                    ,
                    o.prototype.isInFullScreen = function() {
                        var e = s.fullscreenElement || s.mozFullScreenElement || s.webkitFullscreenElement;
                        return e && t(e).parent().hasClass("owl-video-frame")
                    }
                    ,
                    o.prototype.destroy = function() {
                        var t, e;
                        for (t in this._core.$element.off("click.owl.video"),
                            this._handlers)
                            this._core.$element.off(t, this._handlers[t]);
                        for (e in Object.getOwnPropertyNames(this))
                            "function" != typeof this[e] && (this[e] = null)
                    }
                    ,
                    t.fn.owlCarousel.Constructor.Plugins.Video = o
            }(window.Zepto || window.jQuery, window, document),
            function(t, e, s, i) {
                var o = function(e) {
                    this.core = e,
                        this.core.options = t.extend({}, o.Defaults, this.core.options),
                        this.swapping = !0,
                        this.previous = i,
                        this.next = i,
                        this.handlers = {
                            "change.owl.carousel": t.proxy((function(t) {
                                    t.namespace && "position" == t.property.name && (this.previous = this.core.current(),
                                        this.next = t.property.value)
                                }
                            ), this),
                            "drag.owl.carousel dragged.owl.carousel translated.owl.carousel": t.proxy((function(t) {
                                    t.namespace && (this.swapping = "translated" == t.type)
                                }
                            ), this),
                            "translate.owl.carousel": t.proxy((function(t) {
                                    t.namespace && this.swapping && (this.core.options.animateOut || this.core.options.animateIn) && this.swap()
                                }
                            ), this)
                        },
                        this.core.$element.on(this.handlers)
                };
                o.Defaults = {
                    animateOut: !1,
                    animateIn: !1
                },
                    o.prototype.swap = function() {
                        if (1 === this.core.settings.items && t.support.animation && t.support.transition) {
                            this.core.speed(0);
                            var e, s = t.proxy(this.clear, this), i = this.core.$stage.children().eq(this.previous), o = this.core.$stage.children().eq(this.next), n = this.core.settings.animateIn, a = this.core.settings.animateOut;
                            this.core.current() !== this.previous && (a && (e = this.core.coordinates(this.previous) - this.core.coordinates(this.next),
                                i.one(t.support.animation.end, s).css({
                                    left: e + "px"
                                }).addClass("animated owl-animated-out").addClass(a)),
                            n && o.one(t.support.animation.end, s).addClass("animated owl-animated-in").addClass(n))
                        }
                    }
                    ,
                    o.prototype.clear = function(e) {
                        t(e.target).css({
                            left: ""
                        }).removeClass("animated owl-animated-out owl-animated-in").removeClass(this.core.settings.animateIn).removeClass(this.core.settings.animateOut),
                            this.core.onTransitionEnd()
                    }
                    ,
                    o.prototype.destroy = function() {
                        var t, e;
                        for (t in this.handlers)
                            this.core.$element.off(t, this.handlers[t]);
                        for (e in Object.getOwnPropertyNames(this))
                            "function" != typeof this[e] && (this[e] = null)
                    }
                    ,
                    t.fn.owlCarousel.Constructor.Plugins.Animate = o
            }(window.Zepto || window.jQuery, window, document),
            function(t, e, s, i) {
                var o = function(e) {
                    this._core = e,
                        this._call = null,
                        this._time = 0,
                        this._timeout = 0,
                        this._paused = !0,
                        this._handlers = {
                            "changed.owl.carousel": t.proxy((function(t) {
                                    t.namespace && "settings" === t.property.name ? this._core.settings.autoplay ? this.play() : this.stop() : t.namespace && "position" === t.property.name && this._paused && (this._time = 0)
                                }
                            ), this),
                            "initialized.owl.carousel": t.proxy((function(t) {
                                    t.namespace && this._core.settings.autoplay && this.play()
                                }
                            ), this),
                            "play.owl.autoplay": t.proxy((function(t, e, s) {
                                    t.namespace && this.play(e, s)
                                }
                            ), this),
                            "stop.owl.autoplay": t.proxy((function(t) {
                                    t.namespace && this.stop()
                                }
                            ), this),
                            "mouseover.owl.autoplay": t.proxy((function() {
                                    this._core.settings.autoplayHoverPause && this._core.is("rotating") && this.pause()
                                }
                            ), this),
                            "mouseleave.owl.autoplay": t.proxy((function() {
                                    this._core.settings.autoplayHoverPause && this._core.is("rotating") && this.play()
                                }
                            ), this),
                            "touchstart.owl.core": t.proxy((function() {
                                    this._core.settings.autoplayHoverPause && this._core.is("rotating") && this.pause()
                                }
                            ), this),
                            "touchend.owl.core": t.proxy((function() {
                                    this._core.settings.autoplayHoverPause && this.play()
                                }
                            ), this)
                        },
                        this._core.$element.on(this._handlers),
                        this._core.options = t.extend({}, o.Defaults, this._core.options)
                };
                o.Defaults = {
                    autoplay: !1,
                    autoplayTimeout: 5e3,
                    autoplayHoverPause: !1,
                    autoplaySpeed: !1
                },
                    o.prototype._next = function(i) {
                        this._call = e.setTimeout(t.proxy(this._next, this, i), this._timeout * (Math.round(this.read() / this._timeout) + 1) - this.read()),
                        this._core.is("interacting") || s.hidden || this._core.next(i || this._core.settings.autoplaySpeed)
                    }
                    ,
                    o.prototype.read = function() {
                        return (new Date).getTime() - this._time
                    }
                    ,
                    o.prototype.play = function(s, i) {
                        var o;
                        this._core.is("rotating") || this._core.enter("rotating"),
                            s = s || this._core.settings.autoplayTimeout,
                            o = Math.min(this._time % (this._timeout || s), s),
                            this._paused ? (this._time = this.read(),
                                this._paused = !1) : e.clearTimeout(this._call),
                            this._time += this.read() % s - o,
                            this._timeout = s,
                            this._call = e.setTimeout(t.proxy(this._next, this, i), s - o)
                    }
                    ,
                    o.prototype.stop = function() {
                        this._core.is("rotating") && (this._time = 0,
                            this._paused = !0,
                            e.clearTimeout(this._call),
                            this._core.leave("rotating"))
                    }
                    ,
                    o.prototype.pause = function() {
                        this._core.is("rotating") && !this._paused && (this._time = this.read(),
                            this._paused = !0,
                            e.clearTimeout(this._call))
                    }
                    ,
                    o.prototype.destroy = function() {
                        var t, e;
                        for (t in this.stop(),
                            this._handlers)
                            this._core.$element.off(t, this._handlers[t]);
                        for (e in Object.getOwnPropertyNames(this))
                            "function" != typeof this[e] && (this[e] = null)
                    }
                    ,
                    t.fn.owlCarousel.Constructor.Plugins.autoplay = o
            }(window.Zepto || window.jQuery, window, document),
            function(t, e, s, i) {
                "use strict";
                var o = function(e) {
                    this._core = e,
                        this._initialized = !1,
                        this._pages = [],
                        this._controls = {},
                        this._templates = [],
                        this.$element = this._core.$element,
                        this._overrides = {
                            next: this._core.next,
                            prev: this._core.prev,
                            to: this._core.to
                        },
                        this._handlers = {
                            "prepared.owl.carousel": t.proxy((function(e) {
                                    e.namespace && this._core.settings.dotsData && this._templates.push('<div class="' + this._core.settings.dotClass + '">' + t(e.content).find("[data-dot]").addBack("[data-dot]").attr("data-dot") + "</div>")
                                }
                            ), this),
                            "added.owl.carousel": t.proxy((function(t) {
                                    t.namespace && this._core.settings.dotsData && this._templates.splice(t.position, 0, this._templates.pop())
                                }
                            ), this),
                            "remove.owl.carousel": t.proxy((function(t) {
                                    t.namespace && this._core.settings.dotsData && this._templates.splice(t.position, 1)
                                }
                            ), this),
                            "changed.owl.carousel": t.proxy((function(t) {
                                    t.namespace && "position" == t.property.name && this.draw()
                                }
                            ), this),
                            "initialized.owl.carousel": t.proxy((function(t) {
                                    t.namespace && !this._initialized && (this._core.trigger("initialize", null, "navigation"),
                                        this.initialize(),
                                        this.update(),
                                        this.draw(),
                                        this._initialized = !0,
                                        this._core.trigger("initialized", null, "navigation"))
                                }
                            ), this),
                            "refreshed.owl.carousel": t.proxy((function(t) {
                                    t.namespace && this._initialized && (this._core.trigger("refresh", null, "navigation"),
                                        this.update(),
                                        this.draw(),
                                        this._core.trigger("refreshed", null, "navigation"))
                                }
                            ), this)
                        },
                        this._core.options = t.extend({}, o.Defaults, this._core.options),
                        this.$element.on(this._handlers)
                };
                o.Defaults = {
                    nav: !1,
                    navText: ['<span aria-label="Previous">&#x2039;</span>', '<span aria-label="Next">&#x203a;</span>'],
                    navSpeed: !1,
                    navElement: 'button type="button" role="presentation"',
                    navContainer: !1,
                    navContainerClass: "owl-nav",
                    navClass: ["owl-prev", "owl-next"],
                    slideBy: 1,
                    dotClass: "owl-dot",
                    dotsClass: "owl-dots",
                    dots: !0,
                    dotsEach: !1,
                    dotsData: !1,
                    dotsSpeed: !1,
                    dotsContainer: !1
                },
                    o.prototype.initialize = function() {
                        var e, s = this._core.settings;
                        for (e in this._controls.$relative = (s.navContainer ? t(s.navContainer) : t("<div>").addClass(s.navContainerClass).appendTo(this.$element)).addClass("disabled"),
                            this._controls.$previous = t("<" + s.navElement + ">").addClass(s.navClass[0]).html(s.navText[0]).prependTo(this._controls.$relative).on("click", t.proxy((function(t) {
                                    this.prev(s.navSpeed)
                                }
                            ), this)),
                            this._controls.$next = t("<" + s.navElement + ">").addClass(s.navClass[1]).html(s.navText[1]).appendTo(this._controls.$relative).on("click", t.proxy((function(t) {
                                    this.next(s.navSpeed)
                                }
                            ), this)),
                        s.dotsData || (this._templates = [t('<button role="button">').addClass(s.dotClass).append(t("<span>")).prop("outerHTML")]),
                            this._controls.$absolute = (s.dotsContainer ? t(s.dotsContainer) : t("<div>").addClass(s.dotsClass).appendTo(this.$element)).addClass("disabled"),
                            this._controls.$absolute.on("click", "button", t.proxy((function(e) {
                                    var i = t(e.target).parent().is(this._controls.$absolute) ? t(e.target).index() : t(e.target).parent().index();
                                    e.preventDefault(),
                                        this.to(i, s.dotsSpeed)
                                }
                            ), this)),
                            this._overrides)
                            this._core[e] = t.proxy(this[e], this)
                    }
                    ,
                    o.prototype.destroy = function() {
                        var t, e, s, i, o;
                        for (t in o = this._core.settings,
                            this._handlers)
                            this.$element.off(t, this._handlers[t]);
                        for (e in this._controls)
                            "$relative" === e && o.navContainer ? this._controls[e].html("") : this._controls[e].remove();
                        for (i in this.overides)
                            this._core[i] = this._overrides[i];
                        for (s in Object.getOwnPropertyNames(this))
                            "function" != typeof this[s] && (this[s] = null)
                    }
                    ,
                    o.prototype.update = function() {
                        var t, e, s = this._core.clones().length / 2, i = s + this._core.items().length, o = this._core.maximum(!0), n = this._core.settings, a = n.center || n.autoWidth || n.dotsData ? 1 : n.dotsEach || n.items;
                        if ("page" !== n.slideBy && (n.slideBy = Math.min(n.slideBy, n.items)),
                        n.dots || "page" == n.slideBy)
                            for (this._pages = [],
                                     t = s,
                                     e = 0,
                                     0; t < i; t++) {
                                if (e >= a || 0 === e) {
                                    if (this._pages.push({
                                        start: Math.min(o, t - s),
                                        end: t - s + a - 1
                                    }),
                                    Math.min(o, t - s) === o)
                                        break;
                                    e = 0
                                }
                                e += this._core.mergers(this._core.relative(t))
                            }
                    }
                    ,
                    o.prototype.draw = function() {
                        var e, s = this._core.settings, i = this._core.items().length <= s.items, o = this._core.relative(this._core.current()), n = s.loop || s.rewind;
                        this._controls.$relative.toggleClass("disabled", !s.nav || i),
                        s.nav && (this._controls.$previous.toggleClass("disabled", !n && o <= this._core.minimum(!0)),
                            this._controls.$next.toggleClass("disabled", !n && o >= this._core.maximum(!0))),
                            this._controls.$absolute.toggleClass("disabled", !s.dots || i),
                        s.dots && (e = this._pages.length - this._controls.$absolute.children().length,
                            s.dotsData && 0 !== e ? this._controls.$absolute.html(this._templates.join("")) : e > 0 ? this._controls.$absolute.append(new Array(e + 1).join(this._templates[0])) : e < 0 && this._controls.$absolute.children().slice(e).remove(),
                            this._controls.$absolute.find(".active").removeClass("active"),
                            this._controls.$absolute.children().eq(t.inArray(this.current(), this._pages)).addClass("active"))
                    }
                    ,
                    o.prototype.onTrigger = function(e) {
                        var s = this._core.settings;
                        e.page = {
                            index: t.inArray(this.current(), this._pages),
                            count: this._pages.length,
                            size: s && (s.center || s.autoWidth || s.dotsData ? 1 : s.dotsEach || s.items)
                        }
                    }
                    ,
                    o.prototype.current = function() {
                        var e = this._core.relative(this._core.current());
                        return t.grep(this._pages, t.proxy((function(t, s) {
                                return t.start <= e && t.end >= e
                            }
                        ), this)).pop()
                    }
                    ,
                    o.prototype.getPosition = function(e) {
                        var s, i, o = this._core.settings;
                        return "page" == o.slideBy ? (s = t.inArray(this.current(), this._pages),
                            i = this._pages.length,
                            e ? ++s : --s,
                            s = this._pages[(s % i + i) % i].start) : (s = this._core.relative(this._core.current()),
                            i = this._core.items().length,
                            e ? s += o.slideBy : s -= o.slideBy),
                            s
                    }
                    ,
                    o.prototype.next = function(e) {
                        t.proxy(this._overrides.to, this._core)(this.getPosition(!0), e)
                    }
                    ,
                    o.prototype.prev = function(e) {
                        t.proxy(this._overrides.to, this._core)(this.getPosition(!1), e)
                    }
                    ,
                    o.prototype.to = function(e, s, i) {
                        var o;
                        !i && this._pages.length ? (o = this._pages.length,
                            t.proxy(this._overrides.to, this._core)(this._pages[(e % o + o) % o].start, s)) : t.proxy(this._overrides.to, this._core)(e, s)
                    }
                    ,
                    t.fn.owlCarousel.Constructor.Plugins.Navigation = o
            }(window.Zepto || window.jQuery, window, document),
            function(t, e, s, i) {
                "use strict";
                var o = function(s) {
                    this._core = s,
                        this._hashes = {},
                        this.$element = this._core.$element,
                        this._handlers = {
                            "initialized.owl.carousel": t.proxy((function(s) {
                                    s.namespace && "URLHash" === this._core.settings.startPosition && t(e).trigger("hashchange.owl.navigation")
                                }
                            ), this),
                            "prepared.owl.carousel": t.proxy((function(e) {
                                    if (e.namespace) {
                                        var s = t(e.content).find("[data-hash]").addBack("[data-hash]").attr("data-hash");
                                        if (!s)
                                            return;
                                        this._hashes[s] = e.content
                                    }
                                }
                            ), this),
                            "changed.owl.carousel": t.proxy((function(s) {
                                    if (s.namespace && "position" === s.property.name) {
                                        var i = this._core.items(this._core.relative(this._core.current()))
                                            , o = t.map(this._hashes, (function(t, e) {
                                                return t === i ? e : null
                                            }
                                        )).join();
                                        if (!o || e.location.hash.slice(1) === o)
                                            return;
                                        e.location.hash = o
                                    }
                                }
                            ), this)
                        },
                        this._core.options = t.extend({}, o.Defaults, this._core.options),
                        this.$element.on(this._handlers),
                        t(e).on("hashchange.owl.navigation", t.proxy((function(t) {
                                var s = e.location.hash.substring(1)
                                    , i = this._core.$stage.children()
                                    , o = this._hashes[s] && i.index(this._hashes[s]);
                                void 0 !== o && o !== this._core.current() && this._core.to(this._core.relative(o), !1, !0)
                            }
                        ), this))
                };
                o.Defaults = {
                    URLhashListener: !1
                },
                    o.prototype.destroy = function() {
                        var s, i;
                        for (s in t(e).off("hashchange.owl.navigation"),
                            this._handlers)
                            this._core.$element.off(s, this._handlers[s]);
                        for (i in Object.getOwnPropertyNames(this))
                            "function" != typeof this[i] && (this[i] = null)
                    }
                    ,
                    t.fn.owlCarousel.Constructor.Plugins.Hash = o
            }(window.Zepto || window.jQuery, window, document),
            function(t, e, s, i) {
                function o(e, s) {
                    var i = !1
                        , o = e.charAt(0).toUpperCase() + e.slice(1);
                    return t.each((e + " " + r.join(o + " ") + o).split(" "), (function(t, e) {
                            if (void 0 !== a[e])
                                return i = !s || e,
                                    !1
                        }
                    )),
                        i
                }
                function n(t) {
                    return o(t, !0)
                }
                var a = t("<support>").get(0).style
                    , r = "Webkit Moz O ms".split(" ")
                    , l = {
                    transition: {
                        end: {
                            WebkitTransition: "webkitTransitionEnd",
                            MozTransition: "transitionend",
                            OTransition: "oTransitionEnd",
                            transition: "transitionend"
                        }
                    },
                    animation: {
                        end: {
                            WebkitAnimation: "webkitAnimationEnd",
                            MozAnimation: "animationend",
                            OAnimation: "oAnimationEnd",
                            animation: "animationend"
                        }
                    }
                }
                    , c = function() {
                    return !!o("transform")
                }
                    , h = function() {
                    return !!o("perspective")
                }
                    , d = function() {
                    return !!o("animation")
                };
                (function() {
                        return !!o("transition")
                    }
                )() && (t.support.transition = new String(n("transition")),
                    t.support.transition.end = l.transition.end[t.support.transition]),
                d() && (t.support.animation = new String(n("animation")),
                    t.support.animation.end = l.animation.end[t.support.animation]),
                c() && (t.support.transform = new String(n("transform")),
                    t.support.transform3d = h())
            }(window.Zepto || window.jQuery, window, document)
    },
    239: function(t, e, s) {
        "use strict";
        s.r(e);
        s(53),
            s(38);
        var i = s(12);
        s(240),
            s(169),
            s(157),
            s(57),
            s(103),
            s(167),
            s(74),
            s(130),
            s(52),
            s(39),
            s(243),
            s(92);
        s(13).a.init(".js-book-like"),
            Object(i.b)("/site/about-company/svg/sprite.svg?v=20190212")
    },
    240: function(t, e, s) {
        "use strict";
        (function(t) {
                var e = s(4);
                s(21),
                    s(241),
                    s(242);
                const i = $(".about-company__holding-slider");
                function o(t, e) {
                    const s = $(".about-company__test-hr-step_active")
                        , i = "about-company__test-hr-step-btn-next_inactive";
                    t && e ? (s.find(".about-company__test-hr-step-btn-next").removeClass(i),
                        s.find(".about-company__test-hr-step-btn-result").removeClass(i)) : (s.find(".about-company__test-hr-step-btn-next").addClass(i),
                        s.find(".about-company__test-hr-step-btn-result").addClass(i))
                }
                function n() {
                    if (!$(this).hasClass("about-company__test-hr-step-btn-next_inactive")) {
                        const t = $(this).closest(".about-company__test-hr-step");
                        t.removeClass("about-company__test-hr-step_active"),
                            t.next().addClass("about-company__test-hr-step_active"),
                            $(".about-company__test-hr-step_active").each((function() {
                                    const t = $(this).find("input").not('[type="radio"]')
                                        , e = $(this).find('input[type="radio"]')
                                        , s = $(this).find('.checkbox-accept-form__input[type="checkbox"]');
                                    let i = []
                                        , n = !0;
                                    t.on("input", () => {
                                            var a, r;
                                            n = !0,
                                                t.each((function() {
                                                        n = !(!$(this).val() || !n)
                                                    }
                                                )),
                                                o(n && 0 === (null === (a = i) || void 0 === a ? void 0 : a.length) || n && s.length && (null === (r = i) || void 0 === r ? void 0 : r.every(t => !0 === t)), 0 === e.length)
                                        }
                                    ),
                                        s.on("change", () => {
                                                var t, a;
                                                i = [],
                                                    s.each((function() {
                                                            let t = !1;
                                                            $(this).is(":checked") && (t = !0),
                                                                t ? i.push(!0) : i.push(!1)
                                                        }
                                                    )),
                                                    o(n && 0 === (null === (t = i) || void 0 === t ? void 0 : t.length) || n && s.length && (null === (a = i) || void 0 === a ? void 0 : a.every(t => !0 === t)), 0 === e.length)
                                            }
                                        ),
                                        e.on("change", () => {
                                                const e = [];
                                                $(this).find(".about-company__test-hr-question-answer-box").each((function() {
                                                        const t = $(this).find('input[type="radio"]');
                                                        let s = !1;
                                                        t.each((function() {
                                                                $(this).is(":checked") && (s = !0)
                                                            }
                                                        )),
                                                            s ? e.push(!0) : e.push(!1)
                                                    }
                                                )),
                                                    o(0 === t.length, e.every(t => !1 !== t))
                                            }
                                        )
                                }
                            ))
                    }
                }
                i.find(".about-company__holding-slider-item").length > 1 && i.each((function() {
                        $(this).trigger("destroy.owl.carousel").removeClass("owl-carousel").addClass("owl-carousel").owlCarousel({
                            smartSpeed: e.a,
                            dots: !1,
                            navClass: ["about-company__holding-slider-prev arrow arrow_prev arrow_shadow", "about-company__holding-slider-next arrow arrow_next arrow_shadow"],
                            navText: ["", ""],
                            responsive: {
                                0: {
                                    items: 1,
                                    slideBy: 1
                                },
                                620: {
                                    items: 2,
                                    slideBy: 2
                                },
                                770: {
                                    items: 2,
                                    slideBy: 2,
                                    nav: !0
                                },
                                880: {
                                    items: 2,
                                    slideBy: 2,
                                    nav: !0
                                },
                                1100: {
                                    items: 3,
                                    slideBy: 3,
                                    nav: !0
                                }
                            }
                        })
                    }
                )),
                    $(".about-company__selectbox .selectbox__option").on("click", (function() {
                            const t = $(this).attr("data-value");
                            $(".about-company__form-about").removeClass("about-company__form-about_active"),
                                "Я — корпоративный клиент" === t ? $(".about-company__form-about_corp-client").addClass("about-company__form-about_active") : "Я — оптовый клиент" === t ? $(".about-company__form-about_opt-client").addClass("about-company__form-about_active") : $(".about-company__form-about_default").addClass("about-company__form-about_active")
                        }
                    )),
                    n(),
                    $(".about-company__test-hr-step-btn-next").on("click", n),
                    $(".about-company__test-hr").on("submit", e => {
                            e.preventDefault();
                            const s = e.currentTarget
                                , i = new FormData(s)
                                , o = $(".about-company__test-hr").attr("data-action")
                                , n = $(".about-company__test-hr-step-btn-result");
                            n.addClass("about-company__test-hr-step-btn-result_load"),
                                fetch(o, {
                                    method: "POST",
                                    body: i
                                }).then(e => e.ok ? t.resolve(e.json()) : t.reject(new Error("Ошибка"))).then(t => {
                                        let e = "";
                                        const s = t.DATA
                                            , i = $(".about-company__test-hr-result-desc");
                                        i.text(i.text().replace(/#name#/g, s.NAME)),
                                            s.LIST.forEach(t => {
                                                    e += `\n                    <div class="about-company__test-hr-result-item">\n                        <div class="about-company__test-hr-result-item-title-box">\n                            <div class="about-company__test-hr-result-item-title">${t.NAME}</div>\n                            <div class="about-company__test-hr-result-item-percent">${t.PERCENT}</div>\n                        </div>\n\n                        <ul class="about-company__test-hr-result-item-list">${t.TEXT}</ul>\n                    </div>\n                `
                                                }
                                            ),
                                            $(".about-company__test-hr-result-item-box").append(e),
                                            n.removeClass("about-company__test-hr-step-btn-result_load"),
                                            $(".about-company__test-hr-step").removeClass("about-company__test-hr-step_active"),
                                            $(".about-company__test-hr-step_result").addClass("about-company__test-hr-step_active")
                                    }
                                )
                        }
                    )
            }
        ).call(this, s(19))
    },
    241: function(t, e) {
        const s = $(".shop-matrix__item");
        $(".about-company__shops-tab").on("click", (function() {
                const t = $(".about-company__shops-select")
                    , e = $(".about-company__shops-city-or-country");
                $(".about-company__shops-tab").toggleClass("about-company__shops-tab_active"),
                    $(".about-company__shops").find(".drop-down__item").toggleClass("about-company__shops-drop-down-hidden"),
                    t.text("Не выбрано"),
                    $(".about-company__shop-filter-title-for-change").text(t.text()),
                    e.text(0 === $(this).index() ? "Город" : "Страна"),
                    s.addClass("shop-matrix__item_hidden")
            }
        )),
            $(".about-company__shops .drop-down__item").on("click", (function() {
                    const t = $(this).text();
                    s.addClass("shop-matrix__item_hidden"),
                        $(".about-company__shop-filter-title-for-change").text(t),
                        $(".about-company__shops-select").text(t),
                        s.each((function() {
                                const e = $(this)
                                    , s = e.attr("data-country");
                                (e.attr("data-city").includes(t) || s.includes(t)) && e.removeClass("shop-matrix__item_hidden"),
                                null == e || e.find(".shop-matrix__item-address").each((function() {
                                        const e = $(this);
                                        e.attr("data-city") === t ? e.addClass("shop-matrix__item-address_active") : e.removeClass("shop-matrix__item-address_active")
                                    }
                                )),
                                    e.find(".shop-matrix__item-address_active").length ? e.find(".shop-matrix__item-arrow-down").addClass("shop-matrix__item-arrow-down_active") : e.find(".shop-matrix__item-arrow-down").removeClass("shop-matrix__item-arrow-down_active"),
                                s.includes("Россия") || (e.find(".shop-matrix__item-address").addClass("shop-matrix__item-address_active"),
                                    e.find(".shop-matrix__item-arrow-down").addClass("shop-matrix__item-arrow-down_active"))
                            }
                        ))
                }
            ))
    },
    242: function(t, e, s) {
        (function(t) {
                new t( (t, e) => {
                        const s = document.createElement("script");
                        document.getElementById("map-shops") && t(),
                            s.onload = () => {
                                t()
                            }
                            ,
                            s.onerror = () => {
                                e()
                            }
                            ,
                            s.id = "map-shops",
                            document.head.insertBefore(s, document.head.firstChild),
                            s.src = "https://api-maps.yandex.ru/2.1/?lang=ru_RU&apikey=36184aa5-8afc-454e-bdfb-df0a3a0d667d"
                    }
                ).then( () => {
                        window.ymaps.ready((function() {
                                const t = window.ymaps.geolocation
                                    , e = new window.ymaps.Map("map",{
                                    center: [55, 34],
                                    zoom: 10
                                },{
                                    searchControlProvider: "yandex#search"
                                })
                                    , s = new window.ymaps.ObjectManager({
                                    clusterize: !0,
                                    gridSize: 32,
                                    clusterDisableClickZoom: !0
                                });
                                t.get({
                                    provider: "yandex",
                                    mapStateAutoApply: !0
                                }).then(t => {
                                        t.geoObjects.get(0).properties.set({
                                            balloonContentBody: "Ваш город"
                                        }),
                                            e.geoObjects.add(t.geoObjects),
                                            s.objects.options.set("preset", "islands#orangeDotIcon"),
                                            s.clusters.options.set("preset", "islands#orangeClusterIcons"),
                                            e.geoObjects.add(s),
                                            $.ajax({
                                                url: $(".map-shops").attr("data-href")
                                            }).done(t => {
                                                    const e = [];
                                                    JSON.parse(t).forEach( (t, s) => {
                                                            var i;
                                                            e.push({
                                                                type: "Feature",
                                                                id: s,
                                                                geometry: {
                                                                    type: "Point",
                                                                    coordinates: [t.coords.latitude, t.coords.longitude]
                                                                },
                                                                properties: {
                                                                    balloonContentHeader: `<b>${t.name}</b>`,
                                                                    balloonContentBody: `\n                                            <p class="map-shops__map-address">${t.address}</p>\n                                            ${null != t && null !== (i = t.link) && void 0 !== i && i.name ? `<a href="${t.link.url}" class="map-shops__map-link" target="_blank">${t.link.name ? t.link.name : t.link.url}</a>` : ""}\n                                        `,
                                                                    hintContent: t.name
                                                                }
                                                            })
                                                        }
                                                    ),
                                                        s.add({
                                                            type: "FeatureCollection",
                                                            features: e
                                                        })
                                                }
                                            )
                                    }
                                ).catch(console.log)
                            }
                        ))
                    }
                ).catch( () => console.log("Api Яндекс карт не загрузилось!"))
            }
        ).call(this, s(19))
    },
    243: function(t, e) {
        $(".shop-matrix__item-arrow-down").on("click", (function() {
                const t = $(this).closest(".shop-matrix__item");
                t.find(".shop-matrix__item-address-box").slideToggle(),
                    t.toggleClass("shop-matrix__item-active")
            }
        ))
    },
    25: function(t, e, s) {
        "use strict";
        (function(t) {
                s.d(e, "a", (function() {
                        return u
                    }
                ));
                var i = s(12)
                    , o = s(7)
                    , n = s(13)
                    , a = s(3)
                    , r = s(2)
                    , l = s(6)
                    , c = s(0)
                    , h = s(24)
                    , d = s(1);
                class u {
                    constructor(t=null) {
                        this._nomcode = t,
                            this._$body = $("body"),
                            this._build = window.URLBuild + "/site/book-fast-view",
                            this._scriptSrc = this._build + "/js/script.js",
                            this._styleSrc = this._build + "/css/style.css"
                    }
                    _loadScript() {
                        return new t( (t, e) => {
                                const s = document.createElement("script");
                                s.onload = () => t(),
                                    s.onerror = () => e(),
                                    s.src = this._scriptSrc,
                                    document.head.insertBefore(s, document.head.firstChild)
                            }
                        )
                    }
                    _loadStyle() {
                        return new t( (t, e) => {
                                const s = document.createElement("link");
                                s.onload = () => t(),
                                    s.onerror = () => e(),
                                    s.href = this._styleSrc,
                                    s.type = "text/css",
                                    s.rel = "stylesheet",
                                    document.head.insertBefore(s, document.head.firstChild)
                            }
                        )
                    }
                    _loadResources(e) {
                        t.all([this._loadScript(), this._loadStyle()]).then(e)
                    }
                    _deleteResources() {
                        $(`script[src="${this._scriptSrc}"]`).remove(),
                            $(`link[href="${this._styleSrc}"]`).remove(),
                            Object(i.a)("book-fast-view")
                    }
                    show(t, e, i) {
                        if (i || Object(r.getW)() > a.eksmoBP.smMax && !Object(l.a)() && Object(c.a)(this._nomcode)) {
                            const i = ".book-page_fast-view";
                            $.fancybox.close(),
                                $.fancybox.open({
                                    baseClass: "fancybox-book-fast-view",
                                    type: "ajax",
                                    src: Object(o.a)() ? "/eksmo/_verstka/ajax/book-fast-view.php?NC=" + this._nomcode : "/ajax/book/fast-view/?NC=" + this._nomcode,
                                    touch: !1,
                                    afterLoad: (o, r) => {
                                        this._$body.trigger("eksmoFancyboxAfterLoad", [o, r]),
                                            this._loadResources( () => {
                                                    "string" == typeof e && this._$body.trigger("switchTab.tabs.eksmo", [$(e)]),
                                                        this._$body.trigger("init.tabs.eksmo"),
                                                        n.a.init(i + " .js-like"),
                                                        $(".fancybox__fast-view-loader").remove(),
                                                        r.$slide.find(i).removeClass("fancybox__fast-view-loading"),
                                                        this._$body.trigger("init.fastViewBook"),
                                                        document.querySelectorAll(".mail-form__form").forEach(t => {
                                                                new h.a("subscription",".mail-form__form",".checkbox input",".checkbox__content-offset",".mail-form__btn",t).setEventCheckboxAccept()
                                                            }
                                                        ),
                                                        s.e(104).then(s.bind(null, 62)).then( ({getObjDetailBook: t}) => {
                                                                d.a.viewBookDetailSS(t())
                                                            }
                                                        )
                                                }
                                            ),
                                        "function" == typeof t && t(),
                                            this._$body.on("eksmoResizeWidth.fastViewBook", (t, e) => {
                                                    e < a.eksmoBP.mdMin && o.close()
                                                }
                                            )
                                    }
                                    ,
                                    afterShow: (t, e) => {
                                        e.$slide.find(".audio-play").each((function() {
                                                $(this).trigger("eksmoCallAudioPlaySet")
                                            }
                                        ))
                                    }
                                    ,
                                    beforeClose: (t, e) => {
                                        this._$body.off("eksmoResizeWidth.fastViewBook"),
                                            e.$slide.find(".audio-play").each((function() {
                                                    $(this).trigger("eksmoCallAudioPlayPause")
                                                }
                                            )),
                                            $(i).addClass("fancybox__fast-view-loading"),
                                            this._deleteResources()
                                    }
                                })
                        }
                    }
                }
            }
        ).call(this, s(19))
    },
    35: function(t, e, s) {
        "use strict";
        s.d(e, "b", (function() {
                return o
            }
        )),
            s.d(e, "a", (function() {
                    return a
                }
            ));
        var i = s(64);
        const o = window.location.search.substring(1)
            , n = o.length ? o : []
            , a = Object(i.a)(n)
    },
    38: function(t, e, s) {
        "use strict";
        var i = s(0)
            , o = s(11);
        $("body").on("click", ".js-anchor-link", (function(t) {
                t.preventDefault();
                const e = $(this)
                    , s = e.attr("href")
                    , n = e.attr("data-href");
                let a = null;
                if (Object(i.a)(s) ? a = s : Object(i.a)(n) && (a = n),
                    a) {
                    a = a.substr(1);
                    const t = Object(o.a)(e.attr("data-plus"))
                        , s = Object(o.a)(e.attr("data-minus"))
                        , i = Object(o.a)(e.attr("data-speed"))
                        , n = $(`[name=${a}]`).first();
                    if (n.length) {
                        const o = n.offset().top + t - s;
                        let a = Math.abs($(window).scrollTop() - o) / 4;
                        a > 750 && (a = 750),
                        i && (a = i),
                            $("html, body").animate({
                                scrollTop: o
                            }, a),
                            e.trigger("eksmoJsAnchorLink", [n])
                    }
                }
            }
        ))
    },
    39: function(t, e, s) {
        "use strict";
        var i = s(5)
            , o = s(1)
            , n = s(10)
            , a = s.n(n)
            , r = s(17)
            , l = s(14)
            , c = s(8)
            , h = (s(27),
            s(6))
            , d = s(22)
            , u = s(4);
        const p = $("body");
        function m(t) {
            const e = $(t.target)
                , s = e.closest(".book")
                , i = s.find(".book__img-back");
            function o() {
                s.removeClass("book_back-show")
            }
            if ("mouseleave" === t.type || "mouseout" === t.type ? o() : t.pageX - e.offset().left > e.width() / 2 ? s.addClass("book_back-show") : o(),
                $(".book").not(s).removeClass("book_back-show"),
                !i.length) {
                const t = s.attr("data-id");
                if ("string" == typeof t && t.length) {
                    const i = e.closest(".book__image-align");
                    i.append(`<img class="book__img book__img_shadow book__img-back" src="https://cdn.eksmo.ru/v2/${t}/COVER/cover4__w${Object(d.a)() ? "410" : "220"}.jpg?p404=${s.attr("data-404-category")}" alt="">`),
                        i.find(".book__img-back").one("load", () => {
                                s.addClass("book_back-load")
                            }
                        )
                }
            }
        }
        function _(t) {
            const e = ".book_back .book__img:not(.book__img-back)";
            (void 0 !== t ? $(t.target).find(e) : $(e)).on("mousemove mouseleave", $.throttle(u.a, m))
        }
        Object(h.a)() || (_(),
            p.on("eksmoPagenavAjax", _),
            $(".books-slider_post-load").on("eksmoBooksSliderPostLoaded", _),
            p.on("eksmoFancyboxAfterLoad", (t, e, s) => {
                    _(s.$slide[0])
                }
            ));
        var g = s(2)
            , f = s(3)
            , v = s(25);
        const b = $("body");
        function y(t) {
            const e = void 0 !== t ? $(t.target).find(".book_fast-view") : $(".book_fast-view")
                , s = ".book__fast-view-btn";
            e.on("mousemove", $.throttle(u.a, (function() {
                    const t = $(this);
                    if (!t.find(s).length) {
                        const e = t.find(".book__image-align");
                        e.append('<div class="book__fast-view-btn btn btn_small btn_nowrap btn_shadow">Быстрый просмотр</div>'),
                            e.find(s).on("click", (function(e) {
                                    const s = new v.a($(this).closest(".book_fast-view").attr("data-id"))
                                        , i = $(this).closest(".book_fast-view").attr("data-format");
                                    let o;
                                    "paper" === i ? o = 0 : "el" === i ? o = 1 : "audio" === i && (o = 2),
                                        e.preventDefault(),
                                        s.show( () => function t(e) {
                                            const s = e.closest(".books")
                                                , i = e.attr("data-pos");
                                            function o(e, s) {
                                                if (e.length) {
                                                    const i = $(".book-page_fast-view");
                                                    i.append(`<div class="book-page__fast-view-arrow arrow ${s}"></div>`),
                                                        i.find(".book-page__fast-view-arrow." + s).on("click", () => {
                                                                new v.a(e.attr("data-id")).show( () => t(e))
                                                            }
                                                        )
                                                }
                                            }
                                            "string" == typeof i && i.length && (o(s.find(`.book_fast-view[data-pos=${parseInt(i) - 1}]`).first(), "arrow_prev"),
                                                o(s.find(`.book_fast-view[data-pos=${parseInt(i) + 1}]`).first(), "arrow_next"))
                                        }(t), `.prices-card__tab[data-tab-index="${o}"]`)
                                }
                            ))
                    }
                }
            )))
        }
        Object(g.getW)() > f.eksmoBP.smMax && !Object(h.a)() && (y(),
            b.on("eksmoPagenavAjax", y),
            $(".books-slider_post-load").on("eksmoBooksSliderPostLoaded", y),
            b.on("eksmoFancyboxAfterLoad", (t, e, s) => {
                    y(s.$slide[0])
                }
            ));
        var w = s(28)
            , k = s(31)
            , x = s(30);
        const C = $("body")
            , j = ".book__like"
            , O = ".book__delete-btn, .book__collection-add-menu-item_delete";
        function E(t, e) {
            Object(i.a)(t.find(".book__img"), t => {
                    Object(c.a)(t),
                        t.on("eksmoImgLoadSrcOrBg", () => {
                                t.addClass("book__img_loader")
                            }
                        )
                }
            ),
                t.each((function() {
                        const t = $(this)
                            , s = t.find(".book__img").first();
                        "function" == typeof e && s.one("eksmoImgLoadSrcOrBg", () => {
                                e(t)
                            }
                        )
                    }
                ))
        }
        function z(t) {
            t.each((function() {
                    const t = $(this)
                        , e = t.find(j)
                        , s = t.find(".book__img").first();
                    e.length && s.length && a.a.measure( () => {
                            const t = 157 - s.height() / s.width() * 100;
                            t > 0 && a.a.mutate( () => {
                                    e.css({
                                        "margin-top": t + "%"
                                    })
                                }
                            )
                        }
                    )
                }
            ))
        }
        function T(t) {
            Object(i.a)(t, t => {
                    t.closest(".book").first().length && B(t.closest(".book"), "impressions")
                }
                , 0, 0, .8)
        }
        function B(t, e) {
            if (t) {
                const s = t.closest(".book");
                if (s.length) {
                    const i = Number(Object(l.a)(s.find(".book__price-old").text()))
                        , n = Number(Object(l.a)(s.find(".book__price-cur").text()))
                        , a = Number(s.find(".btn-shop").first().text().trim().includes("Предзаказ"))
                        , r = s.find(".btn-shop").first()
                        , c = r.attr("data-book24-widget-basket-button-title") || r.attr("data-book24-widget-order-button-title") || r.text().trim()
                        , h = {
                        idGuid: s.attr("data-guid"),
                        price: n,
                        isPreorder: a,
                        textBtnBasket: c,
                        name: s.find(".book__name").text().trim(),
                        id: s.attr("data-id"),
                        oldPrice: i,
                        picture: s.find(".book__img").attr("src"),
                        discountPrice: i && n ? i - n : null,
                        brand: s.attr("data-brand"),
                        author: s.attr("data-author") || s.find(".text-insert__authors").text().trim(),
                        firstCategory: s.attr("data-first-category"),
                        lastCategory: s.attr("data-last-category"),
                        type: s.find(".book__format").text(),
                        list: t.closest("[data-ga-ecommerce-name]").attr("data-ga-ecommerce-name") || "",
                        index: s.attr("data-pos")
                    }
                        , d = t.attr("href")
                        , u = t.attr("data-ym");
                    "Электронная книга" === h.type ? ("addBasket" === e && o.a.clickYM("click_litres_ebook", d),
                        h.typeShort = "e",
                        h.type = "Электронная",
                        h.shop = "litres_ebook") : "Аудиокнига" === h.type ? ("addBasket" === e && o.a.clickYM("click_litres_audio", d),
                        h.typeShort = "a",
                        h.type = "Аудиокнига",
                        h.shop = "litres_audio") : (h.typeShort = "p",
                        h.type = "Бумажная",
                        h.shop = "chitajgorod"),
                    u && (h.shop = u.replace("click_", "")),
                        "wishList" === e ? h.typeWishList = "Добавить в избранное" : "wishListRemove" === e ? h.typeWishList = "Удалить из избранного" : "wishListCollections" === e && (h.typeWishList = "Добавить в подборку"),
                        o.a.impressionsClickAddBasketBookGA4(h, e)
                }
            }
        }
        const S = $("html")
            , P = $(".book__btn-get-gift")
            , L = $(".js-immediate-auth-call");
        L.length && (!S.hasClass("is-authorized") || S.hasClass("is-authorized") && L.hasClass("js-immediate-auth-call_hash-error") ? (Object(x.a)(L.attr("href") || L.attr("data-href")),
            P.addClass("btn_disabled")) : P.on("click", (function() {
                $.fancybox.close(),
                    $.fancybox.open({
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        },
                        type: "ajax",
                        src: $(this).attr("data-src"),
                        touch: !1,
                        afterLoad() {
                            Object(w.a)($(".book").find(".book__img").last()),
                                E($(".book").last()),
                                Object(k.a)()
                        }
                    })
            }
        ))),
            C.on("click", ".book__btn-add-collection", (function() {
                    const t = $(this)
                        , e = t.closest(".book").attr("data-id")
                        , s = t.closest(".books").attr("data-collection-id");
                    C.trigger("collectionAdd.eksmo", [t, e, s]),
                        B(t, "wishListCollections")
                }
            )),
            C.on("likeTo.eksmo", (t, e) => B(e, "wishList")),
            C.on("likeToCancel.eksmo", (t, e) => {
                    B(e, "wishListRemove")
                }
            ),
            T($(".books:not(.books-slider) .book__link")),
            E($(".book"), z),
            C.on("eksmoPagenavAjax", t => {
                    T($(t.target).find(".books:not(.books-slider) .book__link")),
                        E($(t.target).find(".book"), z)
                }
            ),
            $(".books-slider").on("eksmoBooksSliderPostLoaded", t => {
                    E($(t.target).find(".book"), z)
                }
            ),
            C.on("click", ".btn-shop:not(.btn-shop_b24):not(.book__btn-add-collection):not(.book__btn-review), .book-marketplace__item", (function() {
                    const t = $(this);
                    t.closest(".book").length && B(t, "addBasket")
                }
            )),
            C.on("click", ".book__link", (function(t) {
                    const e = $(this)
                        , s = e.closest(".book").first();
                    if (e.closest(".owl-item:not(.active)").length)
                        t.preventDefault();
                    else if (s.length) {
                        const i = s.attr("data-id");
                        $(t.target).closest(j).length || $(t.target).is(j) || (B(e, "click"),
                        null != i && i.length && Object(r.a)() && localStorage.setItem("EksmoRecommEnkodBookID", i),
                            "Электронная книга" === $(t.target).closest(".book").find(".book__format").text() ? o.a.customDL({
                                event: "buyLitres",
                                eventCategory: "ecommerce",
                                eventAction: "click",
                                eventLabel: "eBook",
                                eventStatus: "success",
                                eventNonInteraction: "false",
                                firingOptions: "oncePerEvent"
                            }) : o.a.customDL({
                                event: "buyLitres",
                                eventCategory: "ecommerce",
                                eventAction: "click",
                                eventLabel: "aBook",
                                eventStatus: "success",
                                eventNonInteraction: "false",
                                firingOptions: "oncePerEvent"
                            }))
                    }
                }
            )),
        C.find(O).length && C.on("click", O, (function(t) {
                const e = $(this);
                t.preventDefault(),
                    $.ajax({
                        type: "POST",
                        url: e.closest(".books").attr("data-delete-url"),
                        data: {
                            id: e.closest(".book").attr("data-id")
                        },
                        dataType: "json",
                        success: t => {
                            void 0 !== t.error ? $.fancybox.open(`<div><p class="text text_c-gray">Ошибка</p><p>"${t.error}"</p></div>`) : window.location.reload(!0)
                        }
                        ,
                        error: () => {
                            $.fancybox.open('\n                    <div>\n                        <p class="text text_c-gray">Ошибка</p>\n                        <p>Попробуйте еще раз или обратитесь в службу технической поддержки.</p>\n                    </div>\n                ')
                        }
                    })
            }
        ))
    },
    52: function(t, e, s) {
        "use strict";
        (function(t) {
                s.d(e, "a", (function() {
                        return C
                    }
                ));
                var i = s(13)
                    , o = s(3)
                    , n = s(1)
                    , a = s(2)
                    , r = s(5)
                    , l = s(4)
                    , c = s(8)
                    , h = (s(21),
                    s(7))
                    , d = s(0)
                    , u = s(14);
                const p = $("body")
                    , m = ".books-slider__slider";
                let _ = v();
                const g = "books-slider_post-loaded"
                    , f = $(".books-slider_post-load");
                function v() {
                    return Object(a.getW)() < o.eksmoBP.smMin
                }
                function b(t) {
                    const e = t.closest(".books-slider");
                    Object(r.a)(e.find(".book__image"), t => {
                            Object(c.a)(t.find(".books-slider__img-loader"))
                        }
                        , e.hasClass("books-slider_post-load-before") ? 2e3 : 0)
                }
                function y(t) {
                    Object(r.a)(t.find(".books-slider__link"), t => {
                            const e = t.closest(".books-slider__item");
                            if (e.length && !e.closest(".owl-item:not(.active)").length) {
                                const t = e.attr("data-id")
                                    , s = Number(Object(u.a)(e.find(".book__price-cur").text()))
                                    , i = Number(Object(u.a)(e.find(".book__price-old").text()))
                                    , o = Number(e.find(".btn-shop").first().text().trim().includes("Предзаказ"));
                                n.a.impressionsGA4({
                                    price: s,
                                    name: e.hasClass("book_oe") ? $(".book-page__card-title").first().text().trim() : e.find(".book__name").first().text().trim(),
                                    id: t,
                                    oldPrice: i,
                                    isPreorder: o,
                                    discountPrice: i && s ? i - s : null,
                                    brand: e.attr("data-brand"),
                                    author: e.attr("data-author") || e.find(".book__author").text().trim(),
                                    firstCategory: e.attr("data-first-category"),
                                    lastCategory: e.attr("data-last-category"),
                                    type: e.find(".book__format").text(),
                                    list: e.closest("[data-ga-ecommerce-name]").attr("data-ga-ecommerce-name"),
                                    index: e.attr("data-pos")
                                })
                            }
                        }
                        , 0, 0, .8)
                }
                function w() {
                    $(m).each((function() {
                            k($(this))
                        }
                    ))
                }
                function k(t) {
                    const e = t.closest(".books-slider");
                    if (e.length && (!e.hasClass("books-slider_post-load") || e.hasClass(g)))
                        if (v())
                            t.trigger("destroy.owl.carousel").removeClass("owl-carousel"),
                                b(t),
                                y(t);
                        else if (t.find(".books-slider__item_arrow").remove(),
                            t.find(".books-slider__item").length) {
                            const a = e.hasClass("books-slider_isset-sidebar")
                                , r = e.hasClass("books-slider_j-article")
                                , c = e.hasClass("books-slider_small-books")
                                , h = e.hasClass("books-slider_other-editions")
                                , d = e.hasClass("books-slider_together-cheaper")
                                , u = e.hasClass("books-slider_dots")
                                , p = e.closest(".container_big");
                            let _ = {
                                0: {
                                    items: 4,
                                    slideBy: 4
                                },
                                880: {
                                    items: 3,
                                    slideBy: 3
                                },
                                992: {
                                    items: 4,
                                    slideBy: 4
                                }
                            }
                                , g = "books-slider__dots";
                            const f = e.hasClass("books-slider_arrow-small") ? " arrow_small" : "";
                            g += $(m).index(t),
                                e.find(".books-slider__dots").addClass(g),
                                e.attr("data-number-slides") ? (_ = {},
                                    $.extend(_, JSON.parse(e.attr("data-number-slides")))) : a && !p.length ? $.extend(_, {
                                    992: {
                                        items: 4,
                                        slideBy: 4
                                    }
                                }) : r ? $.extend(_, {
                                    880: {
                                        items: 4,
                                        slideBy: 4
                                    },
                                    992: {
                                        items: 3,
                                        slideBy: 3
                                    }
                                }) : h ? $.extend(_, {
                                    0: {
                                        items: 6,
                                        slideBy: 6
                                    },
                                    880: {
                                        items: 7,
                                        slideBy: 7
                                    },
                                    992: {
                                        items: 3,
                                        slideBy: 3
                                    }
                                }) : d ? $.extend(_, {
                                    0: {
                                        items: 6,
                                        slideBy: 6
                                    },
                                    770: {
                                        items: 3,
                                        slideBy: 3
                                    },
                                    992: {
                                        items: 3,
                                        slideBy: 3
                                    }
                                }) : c ? $.extend(_, {
                                    0: {
                                        items: 5,
                                        slideBy: 5,
                                        margin: 8
                                    },
                                    880: {
                                        items: 6,
                                        slideBy: 6
                                    },
                                    1024: {
                                        items: 7,
                                        slideBy: 7
                                    }
                                }) : p.length ? $.extend(_, {
                                    1024: {
                                        items: 4,
                                        slideBy: 4
                                    },
                                    1200: {
                                        items: 5,
                                        slideBy: 5
                                    },
                                    1600: {
                                        items: 6,
                                        slideBy: 6
                                    }
                                }) : e.hasClass("books-slider_main") && $.extend(_, {
                                    880: {
                                        items: 4,
                                        slideBy: 4
                                    }
                                }, {
                                    1024: {
                                        items: 5,
                                        slideBy: 5
                                    }
                                });
                            const v = {
                                smartSpeed: l.a,
                                dots: !1,
                                nav: !0,
                                navClass: ["books-slider__prev arrow arrow_prev arrow_shadow" + f, "books-slider__next arrow arrow_next arrow_shadow" + f],
                                navText: ["", ""],
                                responsive: _,
                                onInitialized(t) {
                                    b($(t.target)),
                                        y($(t.target)),
                                    void 0 !== i.a && i.a.init(".js-book-like")
                                }
                            };
                            var s, o, n;
                            if (e.hasClass("books-slider_autoscroll"))
                                $.extend(v.responsive, {
                                    880: {
                                        items: null === (s = v.responsive[880]) || void 0 === s ? void 0 : s.items,
                                        slideBy: 1
                                    },
                                    992: {
                                        items: null === (o = v.responsive[992]) || void 0 === o ? void 0 : o.items,
                                        slideBy: 1
                                    },
                                    1024: {
                                        items: null === (n = v.responsive[1024]) || void 0 === n ? void 0 : n.items,
                                        slideBy: 1
                                    }
                                }),
                                    v.loop = 1,
                                    v.slideBy = 1,
                                    v.autoplay = !0,
                                    v.autoplayTimeout = 4e3;
                            u && (v.dots = !0,
                                v.dotsContainer = `.${g}.dots`,
                                v.dotClass = "dots__item"),
                                t.trigger("destroy.owl.carousel").removeClass("owl-carousel").addClass("owl-carousel").owlCarousel(v)
                        }
                }
                async function x(e) {
                    if (e.length && !e.hasClass(g)) {
                        const s = await async function(t) {
                            const e = t.attr("data-post-load")
                                , s = {
                                type: "default",
                                nomcodes: []
                            };
                            return !s.nomcodes.length && Object(d.a)(e) && (s.nomcodes = e.split(",")),
                                s
                        }(e)
                            , o = e.find(".books-slider__item-tpl").first()
                            , n = o.html()
                            , a = e.find(m).first();
                        if (a.length && s.nomcodes.length) {
                            const r = s.nomcodes.map(t => Object(h.a)() ? `/eksmo/_verstka/data/book/${t}.json` : `https://${window.location.hostname}/ms/price/${t}/`)
                                , l = await t.all(r.map(t => fetch(t)))
                                , c = (await t.all(l.map(t => !!t.ok && t.json()))).map( (t, s) => {
                                    if (t) {
                                        var i, o, a, r, l, c, h, u, p;
                                        let x = n
                                            , C = ""
                                            , j = ""
                                            , O = ""
                                            , E = "";
                                        const z = t.author
                                            , T = t.nomcode
                                            , B = t.guid
                                            , S = t.age18 ? " popup18 popup18_active" : ""
                                            , P = null == t ? void 0 : t.customImage
                                            , L = parseInt(null == t || null === (i = t.price) || void 0 === i ? void 0 : i.price)
                                            , D = parseInt(null === (o = t.price) || void 0 === o ? void 0 : o.oldprice)
                                            , A = t.desc_short ? `<div class="book__desc-short">${t.desc_short}</div>` : ""
                                            , M = !Number.isNaN(L) && !Number.isNaN(D) && L && D && L < D ? 100 - Math.round(L / D * 100) : 0;
                                        let I = "";
                                        const N = "true" === (null === (a = t.price) || void 0 === a ? void 0 : a.preorder)
                                            , R = `\n                        <div class="book__like">\n                            <div class="like js-book-like" data-type="products" data-id="${B}" data-bdl-id="${T}">\n                                <svg class="like__svg like__svg_n"><use xlink:href="#like"></use></svg>\n                                <svg class="like__svg like__svg_y"><use xlink:href="#like-color"></use></svg>\n                            </div>\n                        </div>\n                    `;
                                        let W = "";
                                        const H = e.hasClass("books-slider_btn-review");
                                        let q = !1;
                                        const F = t.livelib ? `<div class="book__info-item"><svg class="book__info-item-icon"><use xlink:href="#livelib-color"></use></svg>${t.livelib}</div>` : ""
                                            , Z = t.reviews_count ? `<div class="book__info-item"><svg class="book__info-item-icon"><use xlink:href="#reviews"></use></svg>${t.reviews_count}</div>` : ""
                                            , V = "Аудиокнига" === t.format || "Электронная книга" === t.format;
                                        var m, _, g, f, v, b, y, w;
                                        if (I += t.charity ? `<a href="${t.charity}" class="book__shield book__shield_charity${t.releases_info ? " book__shield_releases-info" : ""}"></a>` : "",
                                        (null != t && null !== (r = t.marketplaces) && void 0 !== r && r.ozon || null != t && null !== (l = t.marketplaces) && void 0 !== l && l.chitaj_gorod || null != t && null !== (c = t.marketplaces) && void 0 !== c && c.wildberries || null != t && null !== (h = t.marketplaces) && void 0 !== h && h.yandex) && !V && (Number.isNaN(L) || !L))
                                            W = `\n                            <div class="book-marketplace">\n                                <div class="book-marketplace__box">\n                                    ${null != t && null !== (m = t.marketplaces) && void 0 !== m && m.ozon ? `<a class="book-marketplace__item" href="${null == t || null === (_ = t.marketplaces) || void 0 === _ ? void 0 : _.ozon}" target="_blank" rel="noopener nofollow" data-ym="click_ozon">\n                                                <svg class="book-marketplace__item-icon">\n                                                    <use xlink:href="#ozon" />\n                                                </svg>\n                                            </a>` : ""}\n\n                                    ${null != t && null !== (g = t.marketplaces) && void 0 !== g && g.chitaj_gorod ? `<a class="book-marketplace__item" href="${null == t || null === (f = t.marketplaces) || void 0 === f ? void 0 : f.chitaj_gorod}" target="_blank" rel="noopener nofollow" data-ym="click_chitajgorod">\n                                                <svg class="book-marketplace__item-icon">\n                                                    <use xlink:href="#chitaj-gorod" />\n                                                </svg>\n                                            </a>` : ""}\n\n                                    ${null != t && null !== (v = t.marketplaces) && void 0 !== v && v.wildberries ? `<a class="book-marketplace__item" href="${null == t || null === (b = t.marketplaces) || void 0 === b ? void 0 : b.wildberries}" target="_blank" rel="noopener nofollow" data-ym="click_wildberries">\n                                                <svg class="book-marketplace__item-icon">\n                                                    <use xlink:href="#wildberries" />\n                                                </svg>\n                                            </a>` : ""}\n\n                                    ${null != t && null !== (y = t.marketplaces) && void 0 !== y && y.yandex ? `<a class="book-marketplace__item" href="${null == t || null === (w = t.marketplaces) || void 0 === w ? void 0 : w.yandex}" target="_blank" rel="noopener nofollow" data-ym="click_yandexmarket">\n                                                <svg class="book-marketplace__item-icon">\n                                                    <use xlink:href="#market" />\n                                                </svg>\n                                            </a>` : ""}\n                                </div>\n                            </div>\n                        `;
                                        if (Object(d.a)(t.author) && (C = `\n                                        <div class="book__author">${t.author}</div>\n                                    `),
                                        Object(d.a)(t.format) && (j = `\n                                        <div class="book__format">${t.format}</div>\n                                    `),
                                            !Number.isNaN(L) && L ? O = `\n                                        <div class="book__price-block">\n                                            <div class="book__price">\n                                                <span class="book__price-cur" data-price="${D || L}" data-price-sale="${L || ""}">${D && e.hasClass("books-slider_together-cheaper") ? D : L} <span class="book__currency">${t.price.currency}</span></span>\n                                                ${M ? `<span class="book__price-old">${D} <span class="book__currency">${t.price.currency}</span></span><div class="book__sale">-${M}%</div>` : ""}\n                                            </div>\n                                        </div>\n                                    ` : (q = !0,
                                                O = '\n                            <div class="book__btns book__btns_na">\n                                <svg class="book__price-icon-na"><use xlink:href="#na"></use></svg>\n                            </div>\n                          '),
                                            e.attr("data-collection-id"))
                                            E = '<div class="book__btns"><div class="btn btn_border btn_small book__btn-add-collection">В подборку</div></div>';
                                        else if (H)
                                            E = `<div class="book__btns"><a href="${t.url}#reviews" class="btn btn_border btn_small book__btn-review">Оставить отзыв</a></div>`;
                                        else if (null !== (u = t.price) && void 0 !== u && u.shop) {
                                            var k, $;
                                            S && (E = `\n                                <div class="book__btns popup18__content18">\n                                    <div class="btn-shop btn-shop_disabled${N ? " btn-shop_gray" : ""}">\n                                      Контент 18+\n                                    </div>\n                                </div>\n                            `),
                                                N ? E += `\n                                <div class="book__btns${S ? " popup18__content-no18" : ""}">\n                                    <a href="${t.price.buy_link}" class="btn-shop btn-shop_chg btn-shop_gray"\n                                        data-price="${L}"\n                                        data-id="${T}"\n                                        target="_blank" rel="nofollow noopener">\n                                        <svg class="btn-shop__icon"><use xlink:href="#chitaj-gorod-no-color"></use></svg>\n                                        Предзаказ\n                                    </a>\n                                </div>\n                            ` : null !== (k = t.price) && void 0 !== k && k.outer_href_book || "litres" === (null === ($ = t.price) || void 0 === $ ? void 0 : $.shop) ? E += `\n                                <div class="book__btns${S ? " popup18__content-no18" : ""}">\n                                    <a class="btn-shop" href="${t.price.buy_link}" target="_blank" rel="nofollow noopener"><span class="btn-shop__inner-text-hide">Купить&nbsp;</span>На Литрес</a>\n                                </div>\n                            ` : E += `\n                                <div class="book__btns${S ? " popup18__content-no18" : ""}">\n                                    <a href="${t.price.buy_link}" target="_blank" rel="nofollow noopener"\n                                        class="btn-shop btn-shop_chg"\n                                        data-price="${L}"\n                                        data-id="${T}"\n                                        data-guid="${B}"\n                                    >\n                                        <svg class="btn-shop__icon"><use xlink:href="#chitaj-gorod-no-color"></use></svg>\n                                        Купить&nbsp;в ЧГ</span>\n                                    </a>\n                                </div>\n                            `
                                        }
                                        return P && (x = x.replace(/https:\/\/cdn.eksmo.ru\/v2\/#nomcode#\/COVER\/cover1__w220.webp, https:\/\/cdn.eksmo.ru\/v2\/#nomcode#\/COVER\/cover1__w410.webp 2x/g, P),
                                            x = x.replace(/https:\/\/cdn.eksmo.ru\/v2\/#nomcode#\/COVER\/cover1__w220.jpg/g, P),
                                            x = x.replace(/https:\/\/cdn.eksmo.ru\/v2\/#nomcode#\/COVER\/cover1__w410.jpg/g, P)),
                                            x.replace(/#book24-widget#/g, null === (p = t.price) || void 0 === p ? void 0 : p.product_id).replace(/#nomcode#/g, T).replace(/#pos#/g, s + 1).replace(/#brand#/g, t.brand).replace(/#category#/g, t.category).replace(/#categoryFirst#/g, t.first_category ? t.first_category : "").replace(/#available#/g, t.available).replace(/#url#/g, H ? t.url + "#reviews" : t.url).replace(/#name#/g, e.hasClass("books-slider_other-editions") ? "" : t.name).replace(/#html-author#/g, C).replace(/#author#/g, z).replace(/#html-format#/g, j).replace(/#html-price#/g, W || q ? "" : O).replace(/#html-btn#/g, E).replace(/#livelib-rating#/g, F || "").replace(/#reviews-count#/g, Z || "").replace(/#html-marketplaces#/g, W || (q ? O : "")).replace(/#html-like#/g, R).replace(/#class#/g, S || "").replace(/#classImg#/g, S ? " popup18__img" : "").replace(/#preorder#/g, t.releases_info ? `<div class="book__alert-preorder">${t.releases_info}</div>` : "").replace(/#charity#/g, I || "").replace(/#desc-short#/g, A || "").replace(/#guid#/g, B || "")
                                    }
                                    return ""
                                }
                            );
                            o.remove(),
                                a.find(".books-slider__item-skeleton").remove(),
                                a.prepend(c.join("\n")),
                                e.addClass(g),
                                k(a),
                                e.trigger("eksmoBooksSliderPostLoaded"),
                            e.find("[data-dmp-event=click-this-book-in-other-editions]").length && document.dispatchEvent(new Event("otherEditionsLoaded.dmp.eksmo")),
                                i.a.init(".js-book-like")
                        }
                    }
                }
                function C(t) {
                    t.length && t.each((function() {
                            const t = $(this);
                            Object(r.a)(t, x, t.hasClass("books-slider_post-load-before") ? 2e3 : 0)
                        }
                    ))
                }
                w(),
                    p.on("eksmoResizeWidth", () => {
                            v() !== _ && (w(),
                                _ = v())
                        }
                    ),
                    p.on("eksmoPagenavAjax", t => {
                            k($(t.target).find(m))
                        }
                    ),
                    p.on("click", ".books-slider__link", (function(t) {
                            $(this).closest(".owl-item:not(.active)").length && t.preventDefault()
                        }
                    )),
                    C(f)
            }
        ).call(this, s(19))
    },
    57: function(t, e, s) {
        "use strict";
        var i = s(4)
            , o = s(0);
        const n = $("body")
            , a = "spoiler_inited"
            , r = "spoiler_active"
            , l = "spoiler_opened"
            , c = ".spoiler__text-block"
            , h = ".spoiler__btn";
        function d(t) {
            t.not("." + a).each((function() {
                    const t = $(this)
                        , e = t.find(c).first()
                        , s = t.find(".spoiler__text").first()
                        , i = t.attr("data-height")
                        , n = t.attr("data-max-height");
                    let r = e.outerHeight();
                    (Object(o.a)(i) || Object(o.a)(n)) && (e.height(i || n),
                    Object(o.a)(n) || (r = i)),
                    r >= s.outerHeight() && (t.find(h).hide(),
                        e.css("height", "auto"),
                        t.addClass("spoiler_disable")),
                        t.addClass(a)
                }
            ))
        }
        function u(t) {
            t.filter("." + a).each((function() {
                    const t = $(this);
                    t.find(c).first().removeAttr("style"),
                        t.find(h).first().show(),
                        t.removeClass("spoiler_disable"),
                        t.removeClass(a),
                        t.removeClass(r),
                        t.removeClass(l)
                }
            ))
        }
        d($(".spoiler")),
            n.on("click", h, (function() {
                    const t = $(this)
                        , e = t.closest(".spoiler")
                        , s = e.find(c).first()
                        , n = e.find(".spoiler__text").first().outerHeight()
                        , a = e.attr("data-height");
                    e.hasClass(r) ? Object(o.a)(a) && (e.removeClass(l),
                        s.height(a),
                        e.removeClass(r)) : (e.attr("data-height", s.outerHeight()),
                        s.height(n),
                        e.addClass(r),
                    e.hasClass("spoiler_hidden-btn") && t.remove(),
                        setTimeout( () => {
                                e.addClass(l)
                            }
                            , i.a))
                }
            )),
            n.on("eksmoResizeWidth", () => {
                    $(".spoiler").each((function() {
                            const t = $(this)
                                , e = t.attr("data-height");
                            if (t.hasClass(r) && Object(o.a)(e)) {
                                const s = t.find(c).first();
                                t.find(c).first().height(e),
                                    t.removeClass(l),
                                    s.height(e),
                                    t.removeClass(r)
                            }
                        }
                    ))
                }
            ),
            n.on("eksmo.spoiler.init", t => {
                    const e = $(t.target);
                    e.is(".spoiler") && (u(e),
                        d(e))
                }
            ),
            n.on("eksmoPagenavAjax", t => {
                    const e = $(t.target).find(".spoiler");
                    u(e),
                        d(e)
                }
            ),
            n.on("eksmoFancyboxAfterLoad", (t, e, s) => {
                    const i = s.$slide.find(".spoiler");
                    u(i),
                        d(i)
                }
            ),
            n.on("bitrixDynamicComposite.eksmo", () => {
                    const t = $("body").find(".spoiler");
                    u(t),
                        d(t)
                }
            ),
            n.on("toggle.tabsBookPageReviews.eksmo", (t, e) => {
                    const s = e.find(".spoiler");
                    u(s),
                        d(s)
                }
            )
    },
    64: function(t, e, s) {
        "use strict";
        function i(t) {
            if (t && null != t && t.length) {
                const e = {}
                    , s = null == t ? void 0 : t.split("&");
                for (let t = 0; t < s.length; t++) {
                    const [i,o] = s[t].split("=");
                    e[i] ? (Array.isArray(e[i]) || (e[i] = [e[i]]),
                        e[i].push(o)) : e[i] = o
                }
                return e
            }
            return []
        }
        s.d(e, "a", (function() {
                return i
            }
        ))
    },
    74: function(t, e) {
        const s = $("body")
            , i = ".radio__input";
        s.on("change", i, (function() {
                const t = $(this).data("radio-num");
                $(`${i}[data-radio-num=${t}]`).prop("checked", !0)
            }
        )),
            s.on("click", ".radio", (function() {
                    const t = $(this)
                        , e = t.find(i);
                    "LABEL" !== t[0].tagName && e.prop("checked", !e.is(":checked")),
                        t.trigger("eksmoChangeRadio", [e.is(":checked")])
                }
            ))
    },
    92: function(t, e, s) {
        "use strict";
        var i = s(4)
            , o = s(55)
            , n = s(17)
            , a = s(0)
            , r = s(1)
            , l = s(2)
            , c = s(3)
            , h = s(35);
        const d = $(".menu-left")
            , u = document.querySelectorAll(".menu-left__filter-input")
            , p = document.querySelector(".js-previous-filters");
        if (p && Object(n.a)()) {
            var m;
            let t = ""
                , e = 0;
            const s = {}
                , i = null === JSON || void 0 === JSON ? void 0 : JSON.parse(null === (m = localStorage) || void 0 === m ? void 0 : m.getItem("EksmoCatalogMenuPreviousFilters"))
                , o = null == i ? void 0 : i.split("&")
                , n = h.b ? `?${h.b}&` : "?"
                , r = []
                , d = Object(l.getW)() > c.eksmoBP.smMin ? '<div class="text text_bold">Ранее примененные фильтры:</div>' : '<div class="text text_s14">Ранее примененные фильтры:</div>';
            u.forEach(t => {
                    var e;
                    const s = t.value
                        , i = t.getAttribute("name")
                        , o = null === (e = t.closest(".checkbox")) || void 0 === e ? void 0 : e.querySelector(".checkbox__content-offset")
                        , n = o ? o.textContent.replace(/[0-9]/g, "") : ""
                        , a = t.getAttribute("data-single-filter-url");
                    n && i && s && r.push({
                        text: n,
                        name: i,
                        value: s,
                        single: a
                    })
                }
            );
            for (let t = 0; t < (null == o ? void 0 : o.length); t++) {
                const e = o[t].split("=")[0];
                s[e] || (s[e] = []),
                    s[e].push(o[t].split("=")[1])
            }
            let _ = "";
            if (r.map(t => {
                    const e = `${t.name}=${t.value}`
                        , s = t.single;
                    return !(!s || !document.location.pathname.includes(s)) && (_ = _ ? `${_}&${e}` : `${n}${e}`,
                        !0)
                }
            ),
                r.forEach(i => {
                        const o = i.single
                            , a = i.text;
                        let r = "";
                        r = Object.keys(h.a).length || !o || _ ? _ ? `${_}&${i.name}=${i.value}` : `${n}${i.name}=${i.value}` : o,
                            Object.keys(s).forEach(n => {
                                    s[n].forEach(s => {
                                            (Array.isArray(h.a[n]) && !h.a[n].some(t => t === s) || !Array.isArray(h.a[n]) && h.a[n] !== s) && s === i.value && n === i.name && (o && document.location.pathname.includes(o) || (e++,
                                                t += `<a href="${r}" class="btn btn_small filter-row__item">${a}</a>`))
                                        }
                                    )
                                }
                            )
                    }
                ),
                Object(a.a)(t)) {
                const s = Object(l.getW)() > c.eksmoBP.smMin && e > 6 ? '<div class="colflex__item colflex__item_grow spoiler__btn"><div class="r"></div><span class="a a_orange a_dashed">Еще</span></div>' : "";
                p.insertAdjacentHTML("afterbegin", `\n            <div class="colflex colflex_margin-min${Object(l.getW)() < c.eksmoBP.xsMax ? " colflex_wrap" : ""}">\n                <div class="colflex__item">\n                    <div class="r"></div>\n                    ${d}\n                </div>\n\n                <div class="colflex__item colflex__item_grow">\n                    <div class="colflex spoiler spoiler_hidden-btn" data-height="40">\n                        <div class="colflex__item colflex__item_grow spoiler__text-block js-colflex-row-list">\n                            <div class="filter-row filter-row_scroll filter-row_no-bg">\n                                <div class="filter-row__block">\n                                    <div class="filter-row__list">${t}</div>\n                                </div>\n\n                            </div>\n                        </div>\n                        ${s}\n                    </div>\n\n                </div>\n            </div>\n            <div class="r20"></div>\n        `),
                    setTimeout( () => {
                            p.style.display = "block"
                        }
                        , 200)
            }
        }
        $("body").on("click", ".menu-left__filter-submit", () => {
                const t = Object(o.a)(d.find(".menu-left__filter-input"));
                localStorage.setItem("EksmoCatalogMenuPreviousFilters", JSON.stringify(t))
            }
        );
        const _ = $(".menu-left")
            , g = $(".menu-left__control").first()
            , f = $(".menu-left__filter-submit")
            , v = $(".menu-left__filter-submit-fly").first()
            , b = g.find(".menu-left__filter-reset").first();
        let y = b.attr("href");
        const w = ".menu-left__finder-item"
            , k = "EksmoCatalogMenuClosedSpoilers";
        let x = Object(n.a)() && localStorage.getItem(k) ? JSON.parse(localStorage.getItem(k)) : [];
        const C = "menu-left__spoiler_opened"
            , j = $(".menu-left__spoiler-link");
        let O = "";
        function E(t) {
            t.target.checked ? O = "" : (O = $(t.target).attr("data-single-back-filter-url"),
                T($(this)))
        }
        function z() {
            if (f.length && b.length && Object(a.a)(y)) {
                const e = Object(o.a)(_.find(".menu-left__filter-input"))
                    , s = e.split("&")
                    , [i,n] = 1 === s.length ? s[0].split("=") : ["", ""]
                    , r = `.menu-left__filter-input[name="${i}"][value="${n}"]`;
                if (Object(a.a)(e)) {
                    y = O || y;
                    let t = y + (y.includes("?") ? "&" : "?") + e
                        , s = !1;
                    if (Object(a.a)(i)) {
                        const e = $(r).attr("data-single-filter-url");
                        Object(a.a)(e) && (t = e,
                            s = !0),
                            document.querySelector(r).addEventListener("change", E)
                    }
                    f.attr("href", s && "?q=" === y || "/" === y[0] ? t.replace(/page[0-9]+\//g, "") : `${document.location.pathname.replace(/page[0-9]+\//g, "")}${t}`),
                        g.removeClass("menu-left__control_hidden")
                } else if (O)
                    f.attr("href", O),
                        g.removeClass("menu-left__control_hidden");
                else {
                    var t;
                    f.attr("href", y),
                    null === (t = document.querySelector(r)) || void 0 === t || t.removeEventListener("change", E)
                }
            }
        }
        function T(t) {
            const e = Math.abs((t.outerHeight() - v.outerHeight()) / 2)
                , s = t.closest(_).width();
            z(),
            t.length && (v.css({
                top: t.position().top - e,
                left: t.position().left + s
            }),
                v.removeClass("menu-left__filter-submit-fly_hidden")),
                r.a.customDL({
                    event: "eksmo",
                    eventAction: "filter",
                    eventCategory: "microchast",
                    eventLabel: t.find(".checkbox__content-offset").text().replace(/[0-9]/g, "").trim()
                })
        }
        z(),
        Object(n.a)() && j.each((function() {
                const t = $(this);
                x.includes(t.text().trim()) && t.closest(".menu-left__spoiler").removeClass(C)
            }
        )),
            j.on("click", (function(t) {
                    const e = $(this)
                        , s = e.closest(".menu-left__spoiler")
                        , o = s.find(".menu-left__spoiler-container")
                        , r = s.find(".menu-left__spoiler-cont");
                    if (o.length && r.length) {
                        const l = !s.hasClass(C);
                        t.preventDefault(),
                            l ? (o.height(r.outerHeight(!0)),
                                setTimeout( () => {
                                        o.removeAttr("style"),
                                            s.addClass(C)
                                    }
                                    , i.a)) : (o.height(r.outerHeight(!0)),
                                o.height(0),
                                s.removeClass(C)),
                            function(t, e) {
                                const s = t.trim();
                                Object(a.a)(s) && "boolean" == typeof e && Object(n.a)() && (e ? x = x.filter(t => t !== s) : x.includes(s) || x.push(s),
                                    localStorage.setItem(k, JSON.stringify(x)))
                            }(e.text(), l)
                    }
                }
            )),
            _.on("eksmoClickResultItemFinder", ".menu-left__finder", (function(t, e) {
                    const s = $(this).closest(w)
                        , i = s.find(".menu-left__item-result-finder-template").first()
                        , o = s.siblings(w).find(`.menu-left__filter-input[value=${e.id}]`);
                    if (o.length)
                        o.prop("checked", !0);
                    else if (i.length) {
                        let t = i.html();
                        if (t.length) {
                            Object.keys(e).forEach(s => {
                                    t = t.replace(new RegExp(`{${s}}`,"ig"), e[s])
                                }
                            ),
                                t = t.replace(new RegExp(/\{(.+?)\}/,"ig"), ""),
                                s.after(t);
                            const i = s.next(w).find(".checkbox").first().find("input[type=checkbox]");
                            i.prop("checked", !0),
                                i.trigger("change"),
                                z()
                        }
                    }
                    T($(this).closest(".menu-left__spoiler-cont").find(".menu-left__item-search").next()),
                        z()
                }
            )),
            _.on("change", ".menu-left__filter-input", (function() {
                    T($(this).closest(".menu-left__link"))
                }
            )),
            $(document).on("click", t => {
                    $(t.target).is(".finder__result-item") || $(t.target).closest(".menu-left__filter-submit-fly").length || $(t.target).is(".menu-left__filter-submit-fly") || $(t.target).is(".menu-left__filter-input") || (v.addClass("menu-left__filter-submit-fly_hidden"),
                        t.stopPropagation())
                }
            )
    }
});
//# sourceMappingURL=script.js.map
