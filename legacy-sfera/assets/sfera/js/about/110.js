(window.webpackJsonp = window.webpackJsonp || []).push([[110], {
    156: function(o, e, n) {
        "use strict";
        n.r(e);
        var i = n(26);
        const a = $("body");
        function c() {
            $("html").hasClass("is-authorized") || "Y" === Object(i.a)("EKSMO_COOKIE_ACCEPT_SHOWED") || $(".cookie-accept").length || $(document).ready( () => {
                    a.append('\n                    <div class="cookie-accept bg bg_lighterblack">\n                        <div class="container">\n                            <div class="cookie-accept__row">\n                                <div class="cookie-accept__left">\n                                    <div class="cookie-accept__text">\n                                         Мы используем cookies для&nbsp;улучшения работы сайта. Продолжая пользоваться сайтом, вы&nbsp;<a href="/soglasie/soglasie-na-ispolzovanie-i-obrabotku-cookie-faylov/" class="a a_orange a_noline">соглашаетесь с&nbsp;использованием cookies</a> и&nbsp;<a href="/publishers/politika-obrabotki-personalnykh-dannykh/" class="a a_orange a_noline">обработкой персональных данных</a>.\n                                    </div>\n                                </div>\n                                <div class="cookie-accept__right">\n                                    <div class="cookie-accept__btn btn btn_small btn_full-width btn_orange">Принять</div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                ')
                }
            )
        }
        c(),
            a.on("bitrixDynamicComposite.eksmo", () => {
                    c()
                }
            ),
            a.on("click", ".cookie-accept__btn", () => {
                    !function(o) {
                        const e = new Date((new Date).getTime() + 31536e7);
                        document.cookie = `EKSMO_${o}_SHOWED=Y; path=/; domain=${window.location.hostname}; expires=${e.toUTCString()}; SameSite=None; Secure`
                    }("COOKIE_ACCEPT"),
                        $(".cookie-accept").remove()
                }
            )
    }
}]);
//# sourceMappingURL=110.js.map
