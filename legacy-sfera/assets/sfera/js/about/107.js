(window.webpackJsonp = window.webpackJsonp || []).push([[107], {
    60: function(c, e, o) {
        "use strict";
        o.r(e),
            o.d(e, "setEventFormCheckboxes", (function() {
                    return r
                }
            ));
        var t = o(24);
        function n(c) {
            new t.a(c.getAttribute("data-form-name"),".checkbox-accept-form__checkbox",".checkbox-accept-form__input",".checkbox-accept-form__content-offset",".checkbox-accept-form__btn",c).setEventCheckboxAccept()
        }
        function r(c) {
            c ? n(c) : document.querySelectorAll(".checkbox-accept-form").forEach(c => {
                    n(c)
                }
            )
        }
        r(),
            $(".m-menu").on("eksmoSetMMenu", r)
    }
}]);
//# sourceMappingURL=107.js.map
