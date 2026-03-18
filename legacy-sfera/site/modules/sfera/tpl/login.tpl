
<div class="modal remodal md-cart_login" data-remodal-id="cart_login">
    <button class="modal__close close-btn" data-remodal-action="close">
        Закрыть
    </button>

    <div data-widget="modalLayout" class="ja5">
        <div class="b2 aj6" data-widget="blockVertical" style="width: auto;">
            <div class="d8" data-widget="row">
                <div class="c4" data-widget="column" ~~*style="max-width: 426px; flex-basis: 426px;"*~>

                    <iframe src="/login/"  class="t-iframe"></iframe>

                </div>
            </div>
        </div>
    </div>
</div>


<style>
    .t-iframe {
        background-color: transparent;
        border: none;
        /*width: 400px;*/
        height: 380px;/**/
        margin-top: -20px;/**/
    }

    .t-iframe::-webkit-scrollbar {
        width: 0;
    }

    .remodal-wrapper {
        /*left: unset;
        padding-top: 35px!important;*/
    }

</style>

<script>
    //скрипт слушатель, получатель письма из айфрейма
    window.onmessage = function(event) {
        console.log(event.data);

        switch (event.data.task) {

            case 'message':
                toastr.info(event.data.message);
                break;

            case 'go2order':
                window.location.href = "/order/";
                break;

            default:
                console.log(`Sorry, we are out of ${event.data.task}.`);
        }
    };
</script>

~~*
<style>
    .remodal-wrapper::-webkit-scrollbar {
        width: 0;
    }
</style>

<style nonce="8d1970a2-c8d2-446f-94b3-221f946e1802" data-href="https://st.ozone.ru/s3/shared-deps/%40bx-fe/ui-kit-ds-button/3.0.0/index.css">.b200-a{border-radius:inherit;bottom:0;left:0;opacity:0;position:absolute;right:0;top:0;z-index:1}.b200-a0{-webkit-touch-callout:none;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;-webkit-appearance:none;-moz-appearance:none;appearance:none;background:transparent;border:none;border-radius:8px;box-sizing:border-box;color:inherit;cursor:pointer;display:inline-flex;font-family:GTEestiPro,arial,sans-serif;font-size:inherit;font-weight:inherit;margin:0;overflow:hidden;padding:10px 16px;position:relative;text-align:center;text-decoration:none}.b200-a0,.b200-a1{align-items:center;justify-content:center}.b200-a1{display:flex;height:24px;white-space:nowrap;width:100%}.b200-a1.b200-a2{visibility:hidden}.b200-a3{align-items:center;bottom:0;display:flex;justify-content:center;left:0;position:absolute;right:0;top:0}.b200-a4{width:100%}.b200-a2,.b200-a5{cursor:default}.b200-a6 .b200-a1{justify-content:space-between}.b200-a7{display:flex;flex-direction:column;overflow:hidden}.b200-a8{display:block}.b200-a9{margin-left:8px}.b200-a8,.b200-a9,.b200-b{overflow:hidden;text-overflow:ellipsis}.b200-b0{flex-shrink:0;margin-right:8px}.b200-b1{padding:8px 12px}.b200-b1 .b200-a1{height:16px}.b200-b2{border-radius:12px;padding:16px 24px}.b200-b2.b200-a6{padding-right:12px}.b200-b2 .b200-a9.b200-b3{border-radius:4px;padding:4px 8px}.b200-b4{border-radius:16px;padding:24px 32px}.b200-b4.b200-a6{padding-right:16px}.b200-b4 .b200-a9.b200-b3{border-radius:4px;padding:8px 12px}.b200-b5{background-color:var(--theme-rmcolor);color:#fff}.b200-b5 .b200-b0{color:rgba(245,247,250,.9)}.b200-b5 .b200-a9.b200-b3{background-color:hsla(0,0%,100%,.12)}.b200-b5 .b200-a{background-color:#fff}.b200-b6{background-color:rgba(0,150,255,.078)}.b200-b6,.b200-b6 .b200-b0{color:var(--theme-rmcolor)}.b200-b6 .b200-a9.b200-b3{background-color:rgba(0,150,255,.078)}.b200-b6 .b200-a{background-color:var(--theme-rmcolor)}.b200-b7{background-color:var(--theme-rmcolor);color:#fff}.b200-b7 .b200-b0{color:rgba(245,247,250,.9)}.b200-b7 .b200-a9.b200-b3{background-color:hsla(0,0%,100%,.16)}.b200-b7 .b200-a{background-color:#fff}.b200-b8{background-color:rgba(255,92,140,.078)}.b200-b8,.b200-b8 .b200-b0{color:var(--theme-rmcolor)}.b200-b8 .b200-a9.b200-b3{background-color:rgba(255,92,140,.078)}.b200-b8 .b200-a{background-color:var(--theme-rmcolor)}.b200-b9{background-color:rgba(245,60,20,.059)}.b200-b9,.b200-b9 .b200-b0{color:#f53c14}.b200-b9 .b200-a9.b200-b3{background-color:rgba(245,60,20,.059)}.b200-b9 .b200-a{background-color:#f53c14}.b200-a5{background-color:rgba(0,48,120,.039);color:#070707}.b200-a5 .b200-a8,.b200-a5 .b200-a9,.b200-a5 .b200-b,.b200-a5 .b200-b0{opacity:.4}.b200-a5 .b200-b0{color:rgba(0,26,52,.4)}.b200-a5 .b200-a9.b200-b3{background-color:rgba(7,7,7,.039)}.b200-a5 .b200-a{background-color:#070707}@media (hover:hover){.b200-a:not(.b200-c):hover{opacity:.1}}</style>
<style nonce="8d1970a2-c8d2-446f-94b3-221f946e1802" data-href="https://st.ozone.ru/assets/12522b04/layout-desktop-grid.css">.d5m{max-width:100%}.b6{box-sizing:border-box;display:flex;flex-basis:auto;flex-direction:column;flex-grow:1;flex-shrink:0;margin:var(--gap) auto 0;max-width:var(--desktop-screen-default);padding:0 var(--desktop-padding-default);width:100%}.b6.b7{max-width:var(--desktop-screen-default-old);padding:var(--desktop-padding-m)}.b6.b8{flex-grow:0;margin:0;padding:0 var(--mobile-padding)}.b6.b9{margin:0 auto}.d8{box-sizing:border-box;display:flex;flex-direction:row;flex-wrap:wrap;margin-bottom:calc(var(--gap)*-1);margin-left:calc(var(--gap)*-1);max-width:calc(100% + var(--gap));width:calc(100% + var(--gap))}.d9{margin-bottom:0}.c4{align-items:stretch;box-sizing:border-box;display:flex;flex:1;flex-direction:column;margin-bottom:var(--gap);margin-left:var(--gap);min-width:0}.c5{margin-bottom:0}.c4.c6{display:none}.c6>div{margin-bottom:0}.c7{flex-basis:calc(8.3333% - var(--gap));max-width:calc(8.3333% - var(--gap))}.c7,.c8{flex-grow:0;flex-shrink:0}.c8{flex-basis:calc(16.6666% - var(--gap));max-width:calc(16.6666% - var(--gap))}.c9{flex-basis:calc(25% - var(--gap));max-width:calc(25% - var(--gap))}.c9,.d{flex-grow:0;flex-shrink:0}.d{flex-basis:calc(33.3333% - var(--gap));max-width:calc(33.3333% - var(--gap))}.d0{flex-basis:calc(41.6666% - var(--gap));max-width:calc(41.6666% - var(--gap))}.d0,.d1{flex-grow:0;flex-shrink:0}.d1{flex-basis:calc(50% - var(--gap));max-width:calc(50% - var(--gap))}.d2{flex-basis:calc(58.3333% - var(--gap));max-width:calc(58.3333% - var(--gap))}.d2,.d3{flex-grow:0;flex-shrink:0}.d3{flex-basis:calc(66.6666% - var(--gap));max-width:calc(66.6666% - var(--gap))}.d4{flex-basis:calc(75% - var(--gap));max-width:calc(75% - var(--gap))}.d4,.d5{flex-grow:0;flex-shrink:0}.d5{flex-basis:calc(83.3333% - var(--gap));max-width:calc(83.3333% - var(--gap))}.d6{flex-basis:calc(91.6666% - var(--gap));max-width:calc(91.6666% - var(--gap))}.d6,.d7{flex-grow:0;flex-shrink:0}.d7{flex-basis:calc(100% - var(--gap));max-width:calc(100% - var(--gap))}</style>


<style nonce="" data-href="https://st-2.ozone.ru/assets/7a8e3f37/typography-desktop-4.0.10.css">.tsHeadline800XxLarge{font-size:40px;font-weight:700;letter-spacing:.6px;line-height:44px}.tsHeadline700XLarge{font-size:32px;font-weight:700;letter-spacing:.4px;line-height:36px}.tsHeadline600Medium{line-height:30px}.tsHeadline600Large,.tsHeadline600Medium{font-size:27px;font-weight:700;letter-spacing:.4px}.tsHeadline600Large{line-height:32px}.tsHeadline550Medium{font-size:24px;font-weight:700;letter-spacing:.4px;line-height:30px}.tsHeadline500Medium{font-size:20px;font-weight:700;letter-spacing:.4px;line-height:24px}.tsHeadline500XMedium{font-size:20px;font-style:italic;font-weight:500;letter-spacing:.4px;line-height:26px}.tsHeadline400Small{font-size:16px;font-weight:700;letter-spacing:.2px;line-height:20px}.tsHeadline300XSmall{font-size:14px;font-weight:500;letter-spacing:.4px;line-height:16px;text-transform:uppercase}.tsHeadlineNumeric800XxLarge{font-size:40px;font-variant-numeric:tabular-nums;font-weight:700;letter-spacing:0;line-height:44px}.tsHeadlineNumeric700XLarge{font-size:32px;font-variant-numeric:tabular-nums;font-weight:700;letter-spacing:0;line-height:36px}.tsHeadlinePromo500Medium{font-size:20px;font-style:italic;font-weight:500;letter-spacing:.4px;line-height:24px}.tsHeadlinePromo400Small{font-size:16px;font-style:italic;font-weight:500;letter-spacing:.2px;line-height:20px}.tsHeadlineCompact400Small{font-size:16px;font-weight:700;letter-spacing:.2px;line-height:18px}.tsHeadlineCompact400Medium{font-size:16px;font-style:italic;font-weight:500;letter-spacing:.6px;line-height:18px;text-transform:uppercase}.tsBody600Medium{font-size:20px;font-weight:400;letter-spacing:.2px;line-height:26px}.tsBody500Medium{line-height:24px}.tsBody500Large,.tsBody500Medium{font-size:16px;font-weight:400;letter-spacing:.2px}.tsBody500Large{line-height:22px}.tsBody400Large{line-height:22px}.tsBody400Large,.tsBody400Small{font-size:14px;font-weight:400;letter-spacing:.2px}.tsBody400Small{line-height:20px}.tsBody300XSmall{font-size:12px;line-height:16px}.tsBody200XSmall,.tsBody300XSmall{font-weight:400;letter-spacing:.2px}.tsBody200XSmall{font-size:10px;line-height:14px}.tsBodyAccent500Medium{font-size:16px;font-weight:700;letter-spacing:.2px;line-height:24px}.tsBodyAccent400Small{font-size:14px;font-weight:700;letter-spacing:.2px;line-height:20px}.tsBodyAccent300XSmall{font-size:12px;font-weight:700;letter-spacing:.2px;line-height:16px}.tsBodyAccent250Caption{font-size:10px;font-weight:700;letter-spacing:.4px;line-height:14px;text-transform:uppercase}.tsBodyControl700XLarge{line-height:28px}.tsBodyControl700Large,.tsBodyControl700XLarge{font-size:20px;font-weight:500;letter-spacing:.4px}.tsBodyControl700Large{line-height:20px}.tsBodyControl600Large{font-size:18px;font-weight:500;letter-spacing:.4px;line-height:26px}.tsBodyControl500Medium{font-size:16px;font-weight:500;letter-spacing:.2px;line-height:24px}.tsBodyControl400Small{font-size:14px;font-weight:500;letter-spacing:.2px;line-height:20px}.tsBodyControl300XSmall{font-size:12px;font-weight:500;letter-spacing:.2px;line-height:16px}.tsBodyNumeric500Medium{font-size:16px;font-variant-numeric:tabular-nums;font-weight:400;letter-spacing:0;line-height:24px}.tsBodyNumeric400Small{font-size:14px;font-variant-numeric:tabular-nums;font-weight:400;letter-spacing:0;line-height:20px}.tsBodyNumeric300XSmall{font-size:12px;font-variant-numeric:tabular-nums;font-weight:400;letter-spacing:0;line-height:16px}.tsBodyPromo300XSmall{font-size:12px;font-style:italic;font-weight:500;letter-spacing:.2px;line-height:16px}.tsCompact500Medium{font-size:16px;font-weight:400;letter-spacing:.2px;line-height:20px}.tsCompact400Large{line-height:18px}.tsCompact400Large,.tsCompact400Small{font-size:14px;font-weight:400;letter-spacing:.2px}.tsCompact400Small{line-height:16px}.tsCompact300XSmall{font-size:12px;font-weight:400;letter-spacing:.2px;line-height:14px}.tsCompactControl500Medium{font-size:16px;font-weight:500;letter-spacing:.2px;line-height:20px}.tsCompactControl400Small{font-size:14px;font-weight:500;letter-spacing:.2px;line-height:16px}.tsCompactControl300XSmall{font-size:12px;font-weight:500;letter-spacing:.2px;line-height:14px}.tsKeyPromo700Large,.tsKeyPromo700XLarge{font-size:80px;font-weight:500;letter-spacing:.6px;line-height:88px}.tsKeyPromo600XLarge{font-style:italic}.tsKeyPromo600Large,.tsKeyPromo600XLarge{font-size:64px;font-weight:500;letter-spacing:.6px;line-height:72px}.tsKeyPromo500Medium{font-size:64px;font-style:italic;font-weight:500;letter-spacing:.5px;line-height:72px}</style><style nonce="" data-href="https://st-2.ozone.ru/assets/7a8e3f37/main.css">:root{--viewport-vertical-indention:50px;--content-padding:48px;--wide-content-padding-vertical:64px;--max-width-content:960px;--min-width-content:392px;--arrow-size-s-side:12px;--s-container-width:90px;--s-star-width:14px;--s-star-height:14px;--s-star-margin:1px;--s-star-padding:1px;--m-container-width:90px;--m-star-width:16px;--m-star-height:16px;--m-star-margin:1px;--m-star-padding:0;--l-container-width:140px;--l-star-width:20px;--l-star-height:20px;--l-star-padding:1px;--l-star-margin:3px;--lxl-container-width:160px;--lxl-star-width:32px;--lxl-star-height:32px;--lxl-star-padding:0;--lxl-star-margin:0;--xl-container-width:220px;--xl-star-width:32px;--xl-star-height:32px;--xl-star-padding:4px;--xl-star-margin:2px;--minus-one:-1;--ozCtrlPrimaryPale:rgba(0,150,255,.08);--ozTextMarketing:#5b51de;--ozTextPositive:#10c44c;--ozTextSecondary:#707f8d;--ozTextQuaternary:#96a3ae;--ozBGSecondary:#fff;--ozBGPrimaryInverse:#eff3f6;--ozSeparator:rgba(204,214,228,.6);--ozShadowSpread:rgba(0,26,52,.16);--ozAccentAlert:#f91155;--outline:0 0 1px 1px var(--ozBlue);--shadow:0 2px 10px 0 rgba(0,0,0,.12);--transition:0.2s cubic-bezier(0.4,0,0.2,1);--animation-loading-btn:blink 1s infinite ease-in-out;--will-change-btn:color,background-color,opacity;--scroll-bg-color:#dfdfdf;--scroll-thumb-color:var(--ozBlue);--boxShadow:0 4px 16px 1px rgba(0,26,52,.16);--modal-gap-top:40px;--modal-gap-vertical:40px;--modal-gap:20px;--desktop-screen-l:1472px;--desktop-screen-old:1330px;--desktop-screen-m:1280px;--desktop-screen-s:1024px;--mobile-screen:320px;--mobile-padding:16px;--gap:24px;--desktop-padding-m:52px;--desktop-padding-default:28px;--desktop-screen-default:var(--desktop-screen-l);--desktop-screen-default-old:var(--desktop-screen-m);--desktop-screen-default-without-paddings:1416px;--desktop-screen-ally:960px;--z-index-modal:1000;--z-index-popover:500;--mainFont:"GTEestiPro",arial,sans-serif;--fontBold:700;--fontMedium:500;--fontNormal:400;--letter02:0.2px;--letter04:0.4px;--letter06:0.6px;--letter08:0.8px;--tabularNums:tabular-nums;--headXXLFont:38px;--headXXLLine:46px;--headXLFont:30px;--headXLLine:38px;--headLFont:24px;--headLLine:30px;--headMFont:20px;--headMLine:26px;--bodyXLFont:20px;--bodyXLLine:26px;--bodyLFont:16px;--bodyLLine:20px;--bodyMFont:14px;--bodyMLine:18px;--captionFont:12px;--captionLine:16px;--badgeXSFont:10px;--badgeXSLine:14px;--promoXXLFont:80px;--promoXXLLine:88px;--font700:700;--font500:500;--font400:400}.tsHeadXXL{font-size:var(--headXXLFont);line-height:var(--headXXLLine)}.tsHeadXL,.tsHeadXXL{font-weight:var(--fontBold);letter-spacing:var(--letter04)}.tsHeadXL{font-size:var(--headXLFont);line-height:var(--headXLLine)}.tsHeadL{font-size:var(--headLFont);font-weight:var(--fontBold);letter-spacing:var(--letter04);line-height:var(--headLLine)}.tsHeadM{font-weight:var(--fontBold)}.tsHeadM,.tsHeadMItalic{font-size:var(--headMFont);letter-spacing:var(--letter04);line-height:var(--headMLine)}.tsHeadMItalic{font-style:italic;font-weight:var(--fontMedium)}.tsBodyXLBold{font-weight:var(--fontBold);letter-spacing:var(--letter04)}.tsBodyXL,.tsBodyXLBold{font-size:var(--bodyXLFont);line-height:var(--bodyXLLine)}.tsBodyXL{font-weight:var(--fontNormal)}.tsBodyLBold,.tsBodyLBoldItalic,.tsBodyLMedium{font-size:var(--bodyLFont);font-weight:var(--fontMedium);letter-spacing:var(--letter02);line-height:var(--bodyLLine)}.tsBodyLBoldItalic{font-style:italic}.tsBodyL{font-size:var(--bodyLFont);font-weight:var(--fontNormal);letter-spacing:var(--letter02);line-height:var(--bodyLLine)}.tsBodyMBold,.tsBodyMMedium{font-weight:var(--fontMedium)}.tsBodyM,.tsBodyMBold,.tsBodyMMedium{font-size:var(--bodyMFont);letter-spacing:var(--letter02);line-height:var(--bodyMLine)}.tsBodyM{font-weight:var(--fontNormal)}.tsBodyMAC{letter-spacing:var(--letter08);text-transform:uppercase}.tsBodyMAC,.tsBodyMBoldMonospace{font-size:var(--bodyMFont);font-weight:var(--fontMedium);line-height:var(--bodyMLine)}.tsBodyMBoldMonospace{font-variant-numeric:var(--tabularNums)}.tsBadgeBoldAC{font-size:var(--badgeXSFont);font-weight:var(--fontBold);letter-spacing:var(--letter02);line-height:var(--badgeXSLine)}.tsCaption,.tsCaptionItalic{font-size:var(--captionFont);font-weight:var(--fontNormal);letter-spacing:var(--letter02);line-height:var(--captionLine)}.tsCaptionItalic{font-style:italic}.tsCaptionBold,.tsCaptionBoldItalic{font-size:var(--captionFont);font-weight:var(--fontMedium);letter-spacing:var(--letter02);line-height:var(--captionLine)}.tsCaptionBoldItalic{font-style:italic}.tsCaptionAC{letter-spacing:var(--letter06);text-transform:uppercase}.tsCaptionAC,.tsCaptionMonospace{font-size:var(--captionFont);font-weight:var(--fontMedium);line-height:var(--captionLine)}.tsCaptionMonospace{font-variant-numeric:var(--tabularNums)}.tsPromoXXLItalic{font-size:var(--promoXXLFont);font-style:italic;font-weight:var(--fontMedium);letter-spacing:var(--letter06);line-height:var(--promoXXLLine)}.a0{display:grid;grid-auto-rows:0;grid-template:100%/100%;min-height:100vh;position:relative}.a0.a1{display:flex;flex-direction:column;min-width:var(--desktop-screen-s)}.a2{max-width:100vw}.a3{image-rendering:pixelated}.a4{text-rendering:optimizeSpeed}.a{--headXXLFont:1.3rem;--headXXLLine:1.5rem;--headXLFont:1.2rem;--headXLLine:1.5rem;--headLFont:1.1rem;--headLLine:1.5rem;--headMFont:1.1rem;--headMLine:1.5rem;--bodyMFont:1.1rem;--bodyMLine:1.5rem;--bodyLFont:1.1rem;--bodyLLine:1.5rem;--captionFont:1rem;--captionLine:1.5rem}a,abbr,acronym,address,applet,b,big,blockquote,body,center,cite,code,dd,del,dfn,div,dl,dt,em,fieldset,form,h1,h2,h3,h4,h5,h6,html,i,iframe,img,ins,kbd,label,legend,li,object,ol,p,pre,q,s,samp,small,span,strike,strong,sub,sup,tt,u,ul,var{margin:0;padding:0}ul{list-style:none}li::marker{content:"";display:none}img{border:none;outline:none}h1,h2,h3,h4,h5,h6{font-family:var(--title-font);font-style:normal;letter-spacing:normal;text-decoration:none;text-transform:none;word-spacing:normal}input[type=number]::-webkit-inner-spin-button,input[type=number]::-webkit-outer-spin-button{-webkit-appearance:none;margin:0;padding-bottom:0;padding-top:0}input[type=number]{-moz-appearance:textfield}html{font-size:100.1%;overflow-y:scroll}body{background-color:#fff;color:#001a34;font-size:var(--bodyMFont);font-weight:var(--fontNormal);line-height:var(--bodyMLine);min-height:100%}body,td,tfoot,th,thead{letter-spacing:normal;text-transform:none;word-spacing:normal}td,tfoot,th,thead{font-size:1em}th{font-weight:var(--fontMedium);vertical-align:baseline}p{margin:5px 0 10px}h1,h2,h3{font-weight:var(--fontBold)}b,h4,h5,h6,strong{font-weight:var(--fontMedium)}h1{font-size:1.5em}h2{font-size:1.2em}h3{font-size:1.1em}h4{font-size:1em}h5{font-size:.9em}h6{font-size:.8em}a{color: var(--theme-rmcolor)}a,a:hover{text-decoration:none}a:hover{color:#003ead}input,option,select,textarea{font-family:var(--mainFont);font-size:100.1%;font-style:normal;letter-spacing:normal;text-decoration:none;text-transform:none;word-spacing:normal}small{font-size:.9em}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sup{top:-.5em}sub{bottom:-.25em}ol{margin:5px 0 5px 20px;padding:0 0 0 10px}ol li{margin:4px 0;padding:0}font:not([color]){color:inherit}.reset-button{-moz-appearance:none;-webkit-appearance:none;appearance:none;background-color:transparent;border:none}body{-webkit-text-size-adjust:none;-moz-text-size-adjust:none;text-size-adjust:none;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;font-family:var(--mainFont)}@keyframes appear{0%{opacity:0}to{opacity:1}}@keyframes disappear{0%{opacity:1}to{opacity:0}}.custom-pdp-tooltip{animation:disappear .3s;position:absolute}.custom-pdp-tooltip.open{animation:appear .3s}body>.custom-pdp-tooltip{margin:0;max-width:300px;padding:5px 0;position:relative;z-index:23}.custom-pdp-tooltip .tooltip-arrow{border-style:solid;height:0;left:calc(50% - 5px);margin:0 5px;position:absolute;width:0;z-index:1}.custom-pdp-tooltip[x-placement=top] .tooltip-arrow{border-color:#fff transparent transparent!important;border-width:5px 5px 0;bottom:0}.custom-pdp-tooltip[x-placement=bottom] .tooltip-arrow{border-color:transparent transparent #fff!important;border-width:0 5px 5px;top:0}.custom-pdp-tooltip[x-placement=right] .tooltip-arrow{border-width:0}.custom-pdp-tooltip .tooltip-inner{background:#fff;border-radius:8px;box-shadow:var(--shadow);color:#001a34;font-size:14px;padding:18px 23px}.tsBodyXL{font-family:var(--title-font);font-size:var(--headMFont);letter-spacing:var(--letter04);line-height:var(--headMLine)}.tsBodyMLong{font-size:var(--bodyMFont);line-height:20px}.tsBold{font-weight:var(--fontBold)}.modAlly{--headXXLFont:1.3rem;--headXXLLine:1.5rem;--headXLFont:1.2rem;--headXLLine:1.5rem;--headLFont:1.1rem;--headLLine:1.5rem;--headMFont:1.1rem;--headMLine:1.5rem;--bodyMFont:1.1rem;--bodyMLine:1.5rem;--bodyLFont:1.1rem;--bodyLLine:1.5rem;--captionFont:1rem;--captionLine:1.5rem}</style><style nonce="" data-href="https://st-2.ozone.ru/assets/7a8e3f37/vendor-core.css"></style><style nonce="" data-href="https://st-2.ozone.ru/assets/7a8e3f37/host.css">.h5a{transition:var(--transition);transition-property:color}.ah6{color:#070707}.ah6[href]:hover{color:#0050e0;cursor:pointer}.a6h{color:#fff;cursor:pointer}.a6h[href]:hover{color:#99a3ae}.ha6{position:fixed}.b2{display:flex;flex-direction:column;flex-grow:1}.b3.b4{min-height:auto}.b5{box-shadow:0 120px 50px 15px rgba(14,50,103,.04);margin:0 auto;max-width:var(--desktop-screen-l);padding-top:120px;width:100%!important}.aj6{background:#fff;min-height:100px;min-width:288px}.aj6.a6j .ja6{margin:0 auto;max-width:960px;padding:0 16px}.j6a{color: var(--theme-rmcolor);padding:100px 220px;text-align:center}.j6a.aj7{align-items:center;display:flex;height:100%;justify-content:center;padding:0;width:100%}</style>

<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-checkbox.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-image.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-button.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-notification.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-ds-button.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-ds-text-view.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-ds-icon-button.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-ds-link-button.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-text-field-wrapper.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-input.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-field.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-tag.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-popover.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-dropdown.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-select.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-radio.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-date-picker.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-ds-checkbox.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-ds-image.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-transition.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-ds-icon.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/s3/7a8e3f37/ui-kit-ds-notification-bar.css" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="/assets/7a8e3f37/atoms-text.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/assets/7a8e3f37/atoms-button.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/assets/7a8e3f37/components-preloader-five-dots.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/assets/7a8e3f37/components-blocking-loader.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/assets/7a8e3f37/udm-all-login-or-registration.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/assets/7a8e3f37/atoms-notification.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/assets/7a8e3f37/atoms-circular-countdown.css" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/assets/7a8e3f37/notification-service.css" crossorigin="anonymous">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>

<script>
    var phone_number = "";
    var check_code = "";
    var checking_success = 0;


    $(document).ready(function($){

        $(".tel").mask("999 999-99-99");

        $(".tel").on("blur", function(){
            console.log($(".tel").val());

            phone_number = $(".tel").val().replaceAll(' ','').replaceAll('-','');

            if(phone_number.length == 0)
            {
                $("#tel_blck").removeClass("f04-b4");
            }
        });

        $(".tel").on("focus", function(){
            console.log('mask_in');

            $("#tel_blck").addClass("f04-b4");

        });

        $("#otp").on("blur", function(){
            check_code = $("#otp").val();

            if(check_code.length == 4)
            {
                $.ajax({
                    type: 'POST',
                    url: window.location.pathname,
                    dataType: 'json',
                    data: {
                        ajax: 1,
                        task: 'check_code',
                        code: check_code
                    },
                    async: false,
                    cache: false,
                    error: function (jqXHR, textStatus) {
                        console.log("Нет связи с сервером: " + textStatus);
                    },
                    success: function (data) {
                        console.log(data);
                        if (data.result)
                        {
                            toastr.info(data.text);
                            checking_success = 1;
                        }
                        else
                        {
                            toastr.error(data.text);
                        }

                    }
                });
            }
        });


    });

    function approve(form)
    {

        if(phone_number.length == 0)
        {
            console.log('номер телефона пустой');
        }
        else
        {
            $.ajax({
                type: 'POST',
                url: window.location.pathname,
                dataType: 'json',
                data: {
                    ajax: 1,
                    task: 'check_phone_by_call',
                    phone: phone_number
                },
                async: false,
                cache: false,
                error: function (jqXHR, textStatus) {
                    console.log("Нет связи с сервером: " + textStatus);
                },
                success: function (data) {

                    $("#otp").focus();

                    toastr.info("Сейчас должен поступить звонок");
                    //console.log(data);
                    //check_code = data.data.code;
                }
            });
        }
    }

    function login(form)
    {

        if(checking_success  == 1)
        {
            //form.submit();
            var url = window.location.href.replace("#cart_login", "")
            window.location.href = url;
        }
    }
</script>
*~
