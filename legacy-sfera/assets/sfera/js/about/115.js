(window.webpackJsonp = window.webpackJsonp || []).push([[115], {
    308: function(e, t, o) {
        "use strict";
        o.r(t),
            function(e) {
                var t = o(8)
                    , n = o(23)
                    , i = o(7)
                    , a = o(26)
                    , u = o(1);
                const p = document.querySelector(".popup-unified");
                if (p) {
                    const o = (new Date).getTime()
                        , c = p.getAttribute("data-id")
                        , r = {
                        name: p.getAttribute("data-ga4-promo-name"),
                        id: p.getAttribute("data-ga4-promo-id"),
                        location_id: p.getAttribute("data-ga4-promo-location")
                    };
                    if ("Y" !== Object(a.a)(`EKSMO_POPUP_${c}_SHOWED`)) {
                        const a = p.querySelector(".popup-unified__box")
                            , d = Number(p.getAttribute("data-delay"))
                            , s = p.getAttribute("data-img")
                            , m = p.getAttribute("data-link")
                            , l = 1e3 * Number(p.getAttribute("data-dt-end"))
                            , g = [];
                        s && m && (a.innerHTML = `\n                <a class="popup-unified__href-box" href="${m}">\n                    <img class="popup-unified__img popup-unified__img-load" data-src="${s}" alt="">\n                </a>\n            `),
                            $(".popup-unified__img-load").each( (o, n) => {
                                    const i = $(n);
                                    g.push(new e(o => (i.on("eksmoImgLoadSrcOrBg", o),
                                        Object(t.a)(i),
                                        e.reject())))
                                }
                            ),
                            e.all(g).then( () => {
                                    let e;
                                    const t = new n.a("popup-unified");
                                    function a() {
                                        var e;
                                        document.addEventListener("close.popup.eksmo", () => {
                                                u.a.customDL({
                                                    event: "ClickClose_Banner" + c
                                                })
                                            }
                                        ),
                                            t.open(),
                                            u.a.customDL({
                                                event: "View_Banner" + c
                                            }),
                                            u.a.promoImpressionsGA4(r),
                                        null === (e = document.querySelector(".popup-unified__href-box")) || void 0 === e || e.addEventListener("click", () => {
                                                u.a.promoClickGA4(r)
                                            }
                                        )
                                    }
                                    e = Object(i.a)() ? new Date((new Date).getTime() + 6048e5) : new Date(l + 6048e5),
                                        document.cookie = `EKSMO_POPUP_${c}_SHOWED=Y; path=/; domain=${window.location.hostname}; expires=${e.toUTCString()}; SameSite=None; Secure`;
                                    const p = (new Date).getTime() - o;
                                    p < d ? setTimeout( () => {
                                            a()
                                        }
                                        , d - p) : a()
                                }
                            )
                    }
                }
            }
                .call(this, o(19))
    }
}]);
//# sourceMappingURL=115.js.map
