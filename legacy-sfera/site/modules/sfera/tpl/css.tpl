<style>


    :root {
        --viewport-vertical-indention: 50px;
        --content-padding: 48px;
        --wide-content-padding-vertical: 64px;
        --max-width-content: 960px;
        --min-width-content: 392px;
        --arrow-size-s-side: 12px;
        --s-container-width: 90px;
        --s-star-width: 14px;
        --s-star-height: 14px;
        --s-star-margin: 1px;
        --s-star-padding: 1px;
        --m-container-width: 90px;
        --m-star-width: 16px;
        --m-star-height: 16px;
        --m-star-margin: 1px;
        --m-star-padding: 0;
        --l-container-width: 140px;
        --l-star-width: 20px;
        --l-star-height: 20px;
        --l-star-padding: 1px;
        --l-star-margin: 3px;
        --lxl-container-width: 160px;
        --lxl-star-width: 32px;
        --lxl-star-height: 32px;
        --lxl-star-padding: 0;
        --lxl-star-margin: 0;
        --xl-container-width: 220px;
        --xl-star-width: 32px;
        --xl-star-height: 32px;
        --xl-star-padding: 4px;
        --xl-star-margin: 2px;
        --minus-one: -1;
        --cbPrimaryColor: #60cfcf;
        --ozCtrlPrimaryPale: rgba(0,150,255,.08);
        --ozTextMarketing: #5b51de;
        --ozTextPositive: #10c44c;
        --ozTextSecondary: #707f8d;
        --ozTextQuaternary: #96a3ae;
        --ozBGSecondary: #fff;
        --ozBGPrimaryInverse: #eff3f6;
        --ozSeparator: rgba(204,214,228,.6);
        --ozShadowSpread: rgba(0,26,52,.16);
        --ozAccentAlert: #f91155;
        --outline: 0 0 1px 1px var(--ozBlue);
        --shadow: 0 2px 10px 0 rgba(0,0,0,.12);
        --transition: 0.2s cubic-bezier(0.4,0,0.2,1);
        --animation-loading-btn: blink 1s infinite ease-in-out;
        --will-change-btn: color, background-color, opacity;
        --scroll-bg-color: #dfdfdf;
        --scroll-thumb-color: var(--ozBlue);
        --boxShadow: 0 4px 16px 1px rgba(0,26,52,.16);
        --modal-gap-top: 40px;
        --modal-gap-vertical: 40px;
        --modal-gap: 20px;
        --desktop-screen-l: 1472px;
        --desktop-screen-old: 1330px;
        --desktop-screen-m: 1280px;
        --desktop-screen-s: 1200px;
        --mobile-screen: 320px;
        --mobile-padding: 16px;
        --gap: 24px;
        --desktop-padding-m: 52px;
        --desktop-padding-default: 28px;
        --desktop-screen-default: var(--desktop-screen-l);
        --desktop-screen-default-old: var(--desktop-screen-m);
        --desktop-screen-default-without-paddings: 1416px;
        --desktop-screen-ally: 960px;
        --z-index-modal: 1000;
        --z-index-popover: 500;
        --tsHeadline900XxLargeHeight: 52px;
        --tsHeadline800XxLargeHeight: 44px;
        --tsHeadline700XLargeHeight: 36px;
        --tsHeadline600MediumHeight: 30px;
        --tsHeadline600LargeHeight: 32px;
        --tsHeadline550MediumHeight: 30px;
        --tsHeadline500MediumHeight: 24px;
        --tsHeadline500XMediumHeight: 26px;
        --tsHeadline400SmallHeight: 20px;
        --tsHeadline300XSmallHeight: 16px;
        --tsHeadlineNumeric800XxLargeHeight: 44px;
        --tsHeadlineNumeric700XLargeHeight: 36px;
        --tsHeadlinePromo500MediumHeight: 24px;
        --tsHeadlinePromo400SmallHeight: 20px;
        --tsHeadlineCompact400SmallHeight: 18px;
        --tsHeadlineCompact400MediumHeight: 18px;
        --tsBody600MediumHeight: 26px;
        --tsBody500MediumHeight: 24px;
        --tsBody500LargeHeight: 22px;
        --tsBody500SmallHeight: 22px;
        --tsBody400LargeHeight: 22px;
        --tsBody400SmallHeight: 20px;
        --tsBody300XSmallHeight: 16px;
        --tsBody200XSmallHeight: 14px;
        --tsBodyAccent500MediumHeight: 24px;
        --tsBodyAccent400SmallHeight: 20px;
        --tsBodyAccent300XSmallHeight: 16px;
        --tsBodyAccent250CaptionHeight: 14px;
        --tsBodyControl700XLargeHeight: 28px;
        --tsBodyControl700LargeHeight: 20px;
        --tsBodyControl600LargeHeight: 26px;
        --tsBodyControl500MediumHeight: 24px;
        --tsBodyControl400SmallHeight: 20px;
        --tsBodyControl300XSmallHeight: 16px;
        --tsBodyNumeric600LargeHeight: 24px;
        --tsBodyNumeric500MediumHeight: 24px;
        --tsBodyNumeric400SmallHeight: 20px;
        --tsBodyNumeric300XSmallHeight: 16px;
        --tsBodyNumeric200XSmallHeight: 14px;
        --tsBodyPromo300XSmallHeight: 16px;
        --tsCompact600LargeHeight: 22px;
        --tsCompact500MediumHeight: 20px;
        --tsCompact400LargeHeight: 18px;
        --tsCompact400SmallHeight: 16px;
        --tsCompact300XSmallHeight: 14px;
        --tsCompactControl500MediumHeight: 20px;
        --tsCompactControl400SmallHeight: 16px;
        --tsCompactControl300XSmallHeight: 14px;
        --tsCompactNumeric600LargeHeight: 22px;
        --tsCompactNumeric400SmallHeight: 16px;
        --tsKeyPromo700LargeHeight: 88px;
        --tsKeyPromo700XLargeHeight: 88px;
        --tsKeyPromo600XLargeHeight: 72px;
        --tsKeyPromo600LargeHeight: 72px;
        --tsKeyPromo500MediumHeight: 72px;
        --tsHeadline900XxLargeHeightMob: 44px;
        --tsHeadline800XxLargeHeightMob: 36px;
        --tsHeadline700XLargeHeightMob: 32px;
        --tsHeadline600MediumHeightMob: 30px;
        --tsHeadline600LargeHeightMob: 28px;
        --tsHeadline550MediumHeightMob: 30px;
        --tsHeadline500MediumHeightMob: 24px;
        --tsHeadline500XMediumHeightMob: 26px;
        --tsHeadline400SmallHeightMob: 20px;
        --tsHeadline300XSmallHeightMob: 16px;
        --tsHeadlineNumeric800XxLargeHeightMob: 36px;
        --tsHeadlineNumeric700XLargeHeightMob: 32px;
        --tsHeadlinePromo500MediumHeightMob: 24px;
        --tsHeadlinePromo400SmallHeightMob: 20px;
        --tsHeadlineCompact400SmallHeightMob: 18px;
        --tsHeadlineCompact400MediumHeightMob: 18px;
        --tsBody600MediumHeightMob: 26px;
        --tsBody500MediumHeightMob: 24px;
        --tsBody500LargeHeightMob: 22px;
        --tsBody500SmallHeightMob: 22px;
        --tsBody400LargeHeightMob: 20px;
        --tsBody400SmallHeightMob: 20px;
        --tsBody300XSmallHeightMob: 16px;
        --tsBody200XSmallHeightMob: 14px;
        --tsBodyAccent500MediumHeightMob: 24px;
        --tsBodyAccent400SmallHeightMob: 20px;
        --tsBodyAccent300XSmallHeightMob: 16px;
        --tsBodyAccent250CaptionHeightMob: 14px;
        --tsBodyControl700XLargeHeightMob: 28px;
        --tsBodyControl700LargeHeightMob: 20px;
        --tsBodyControl600LargeHeightMob: 26px;
        --tsBodyControl500MediumHeightMob: 24px;
        --tsBodyControl400SmallHeightMob: 20px;
        --tsBodyControl300XSmallHeightMob: 16px;
        --tsBodyNumeric600LargeHeightMob: 24px;
        --tsBodyNumeric500MediumHeightMob: 24px;
        --tsBodyNumeric400SmallHeightMob: 20px;
        --tsBodyNumeric300XSmallHeightMob: 16px;
        --tsBodyNumeric200XSmallHeightMob: 14px;
        --tsBodyPromo300XSmallHeightMob: 16px;
        --tsCompact600LargeHeightMob: 22px;
        --tsCompact500MediumHeightMob: 20px;
        --tsCompact400LargeHeightMob: 18px;
        --tsCompact400SmallHeightMob: 16px;
        --tsCompact300XSmallHeightMob: 14px;
        --tsCompactControl500MediumHeightMob: 20px;
        --tsCompactControl400SmallHeightMob: 16px;
        --tsCompactControl300XSmallHeightMob: 14px;
        --tsCompactNumeric600LargeHeightMob: 22px;
        --tsCompactNumeric400SmallHeightMob: 16px;
        --tsKeyPromo700LargeHeightMob: 88px;
        --tsKeyPromo700XLargeHeightMob: 88px;
        --tsKeyPromo600XLargeHeightMob: 72px;
        --tsKeyPromo600LargeHeightMob: 72px;
        --tsKeyPromo500MediumHeightMob: 64px;
        --mainFont: "GTEestiPro", arial, sans-serif;
        --fontBold: 700;
        --fontMedium: 500;
        --fontNormal: 400;
        --letter02: 0.2px;
        --letter04: 0.4px;
        --letter06: 0.6px;
        --letter08: 0.8px;
        --tabularNums: tabular-nums;
        --headXXLFont: 38px;
        --headXXLLine: 46px;
        --headXLFont: 30px;
        --headXLLine: 38px;
        --headLFont: 24px;
        --headLLine: 30px;
        --headMFont: 20px;
        --headMLine: 26px;
        --bodyXLFont: 20px;
        --bodyXLLine: 26px;
        --bodyLFont: 16px;
        --bodyLLine: 20px;
        --bodyMFont: 14px;
        --bodyMLine: 18px;
        --captionFont: 12px;
        --captionLine: 16px;
        --badgeXSFont: 10px;
        --badgeXSLine: 14px;
        --promoXXLFont: 80px;
        --promoXXLLine: 88px;
        --font700: 700;
        --font500: 500;
        --font400: 400
    }
    .tsHeadXXL {
        font-size: var(--headXXLFont);
        line-height: var(--headXXLLine)
    }
    .tsHeadXL, .tsHeadXXL {
        font-weight: var(--fontBold);
        letter-spacing: var(--letter04)
    }
    .tsHeadXL {
        font-size: var(--headXLFont);
        line-height: var(--headXLLine)
    }
    .tsHeadL {
        font-size: var(--headLFont);
        font-weight: var(--fontBold);
        letter-spacing: var(--letter04);
        line-height: var(--headLLine)
    }
    .tsHeadM {
        font-weight: var(--fontBold)
    }
    .tsHeadM, .tsHeadMItalic {
        font-size: var(--headMFont);
        letter-spacing: var(--letter04);
        line-height: var(--headMLine)
    }
    .tsHeadMItalic {
        font-style: italic;
        font-weight: var(--fontMedium)
    }
    .tsBodyXLBold {
        font-weight: var(--fontBold);
        letter-spacing: var(--letter04)
    }
    .tsBodyXL, .tsBodyXLBold {
        font-size: var(--bodyXLFont);
        line-height: var(--bodyXLLine)
    }
    .tsBodyXL {
        font-weight: var(--fontNormal)
    }
    .tsBodyLBold, .tsBodyLBoldItalic, .tsBodyLMedium {
        font-size: var(--bodyLFont);
        font-weight: var(--fontMedium);
        letter-spacing: var(--letter02);
        line-height: var(--bodyLLine)
    }
    .tsBodyLBoldItalic {
        font-style: italic
    }
    .tsBodyL {
        font-size: var(--bodyLFont);
        font-weight: var(--fontNormal);
        letter-spacing: var(--letter02);
        line-height: var(--bodyLLine)
    }
    .tsBodyMBold, .tsBodyMMedium {
        font-weight: var(--fontMedium)
    }
    .tsBodyM, .tsBodyMBold, .tsBodyMMedium {
        font-size: var(--bodyMFont);
        letter-spacing: var(--letter02);
        line-height: var(--bodyMLine)
    }
    .tsBodyM {
        font-weight: var(--fontNormal)
    }
    .tsBodyMAC {
        letter-spacing: var(--letter08);
        text-transform: uppercase
    }
    .tsBodyMAC, .tsBodyMBoldMonospace {
        font-size: var(--bodyMFont);
        font-weight: var(--fontMedium);
        line-height: var(--bodyMLine)
    }
    .tsBodyMBoldMonospace {
        font-variant-numeric: var(--tabularNums)
    }
    .tsBadgeBoldAC {
        font-size: var(--badgeXSFont);
        font-weight: var(--fontBold);
        letter-spacing: var(--letter02);
        line-height: var(--badgeXSLine)
    }
    .tsCaption, .tsCaptionItalic {
        font-size: var(--captionFont);
        font-weight: var(--fontNormal);
        letter-spacing: var(--letter02);
        line-height: var(--captionLine)
    }
    .tsCaptionItalic {
        font-style: italic
    }
    .tsCaptionBold, .tsCaptionBoldItalic {
        font-size: var(--captionFont);
        font-weight: var(--fontMedium);
        letter-spacing: var(--letter02);
        line-height: var(--captionLine)
    }
    .tsCaptionBoldItalic {
        font-style: italic
    }
    .tsCaptionAC {
        letter-spacing: var(--letter06);
        text-transform: uppercase
    }
    .tsCaptionAC, .tsCaptionMonospace {
        font-size: var(--captionFont);
        font-weight: var(--fontMedium);
        line-height: var(--captionLine)
    }
    .tsCaptionMonospace {
        font-variant-numeric: var(--tabularNums)
    }
    .tsPromoXXLItalic {
        font-size: var(--promoXXLFont);
        font-style: italic;
        font-weight: var(--fontMedium);
        letter-spacing: var(--letter06);
        line-height: var(--promoXXLLine)
    }
    .a0 {
        display: grid;
        grid-auto-rows: 0;
        grid-template: 100%/100%;
        min-height: 100 vh;
        position: relative
    }
    .a0.a1 {
        min-width: var(--desktop-screen-s)
    }
    .a0.a1, .a0.a2 {
        display: flex;
        flex-direction: column
    }
    .a3 {
        max-width: 100 vw
    }
    .a4 {
        image-rendering: pixelated
    }
    .a5 {
        text-rendering: optimizeSpeed
    }
    .a {
        --headXXLFont: 1.3 rem;
        --headXXLLine: 1.5 rem;
        --headXLFont: 1.2 rem;
        --headXLLine: 1.5 rem;
        --headLFont: 1.1 rem;
        --headLLine: 1.5 rem;
        --headMFont: 1.1 rem;
        --headMLine: 1.5 rem;
        --bodyMFont: 1.1 rem;
        --bodyMLine: 1.5 rem;
        --bodyLFont: 1.1 rem;
        --bodyLLine: 1.5 rem;
        --captionFont: 1 rem;
        --captionLine: 1.5 rem
    }
    a, abbr, acronym, address, applet, b, big, blockquote, body, center, cite, code, dd, del, dfn, div, dl, dt, em, fieldset, form, h1, h2, h3, h4, h5, h6, html, i, iframe, img, ins, kbd, label, legend, li, object, ol, p, pre, q, s, samp, small, span, strike, strong, sub, sup, tt, u, ul, var {
        margin: 0;
        padding: 0
    }
    ul {
        list-style: none
    }
    li::marker {
        content: "";
        display: none
    }
    img {
        border: none;
        outline: none
    }
    h1, h2, h3, h4, h5, h6 {
        font-family: var(--title-font);
        font-style: normal;
        letter-spacing: normal;
        text-decoration: none;
        text-transform: none;
        word-spacing: normal
    }
    input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button {
        -webkit-appearance: none;
        margin: 0;
        padding-bottom: 0;
        padding-top: 0
    }
    input[type=number] {
        -moz-appearance: textfield
    }
    html {
        font-size: 100.1%;
        overflow-y: scroll
    }
    body {
        background-color: #fff;
        color: #001a34;
        font-size: var(--bodyMFont);
        font-weight: var(--fontNormal);
        line-height: var(--bodyMLine);
        min-height: 100%;
        font-family: var(--mainFont);
    }
    body, td, tfoot, th, thead {
        letter-spacing: normal;
        text-transform: none;
        word-spacing: normal
    }
    td, tfoot, th, thead {
        font-size: 1em
    }
    th {
        font-weight: var(--fontMedium);
        vertical-align: baseline
    }
    p {
        margin: 5px 0 10px
    }
    h1, h2, h3 {
        font-weight: var(--fontBold)
    }
    b, h4, h5, h6, strong {
        font-weight: var(--fontMedium)
    }
    h1 {
        font-size: 1.5em
    }
    h2 {
        font-size: 1.2em
    }
    h3 {
        font-size: 1.1em
    }
    h4 {
        font-size: 1em
    }
    h5 {
        font-size: .9em
    }
    h6 {
        font-size: .8em
    }
    a {
        color: var(--cbPrimaryColor)
    }
    a, a:hover {
        text-decoration: none
    }
    a:hover {
        color: var(--cbPrimaryColor)
    }
    input, option, select, textarea {
        font-family: var(--mainFont);
        font-size: 100.1%;
        font-style: normal;
        letter-spacing: normal;
        text-decoration: none;
        text-transform: none;
        word-spacing: normal
    }
    small {
        font-size: .9em
    }
    sub, sup {
        font-size: 75%;
        line-height: 0;
        position: relative;
        vertical-align: baseline
    }
    sup {
        top: -.5em
    }
    sub {
        bottom: -.25em
    }
    ol {
        margin: 5px 0 5px 20px;
        padding: 0 0 0 10px
    }
    ol li {
        margin: 4px 0;
        padding: 0
    }
    font:not([color]) {
        color: inherit
    }
    .reset-button {
        -moz-appearance: none;
        -webkit-appearance: none;
        appearance: none;
        background-color: transparent;
        border: none
    }
    body {
        -webkit-text-size-adjust: none;
        -moz-text-size-adjust: none;
        text-size-adjust: none;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-family: var(--mainFont)
    }@keyframes appear{0%{opacity:0}
         to {
             opacity: 1
         }}@keyframes disappear{0%{opacity:1}
               to {
                   opacity: 0
               }}
    .custom-pdp-tooltip {
        animation: disappear .3s;
        position: absolute
    }
    .custom-pdp-tooltip.open {
        animation: appear .3s
    }
    body > .custom-pdp-tooltip {
        margin: 0;
        max-width: 300px;
        padding: 5px 0;
        position: relative;
        z-index: 23
    }
    .custom-pdp-tooltip .tooltip-arrow {
        border-style: solid;
        height: 0;
        left: calc(50% - 5px);
        margin: 0 5px;
        position: absolute;
        width: 0;
        z-index: 1
    }
    .custom-pdp-tooltip[x-placement=top] .tooltip-arrow {
        border-color: #fff transparent transparent !important;
        border-width: 5px 5px 0;
        bottom: 0
    }
    .custom-pdp-tooltip[x-placement=bottom] .tooltip-arrow {
        border-color: transparent transparent #fff !important;
        border-width: 0 5px 5px;
        top: 0
    }
    .custom-pdp-tooltip[x-placement=right] .tooltip-arrow {
        border-width: 0
    }
    .custom-pdp-tooltip .tooltip-inner {
        background: #fff;
        border-radius: 8px;
        box-shadow: var(--shadow);
        color: #001a34;
        font-size: 14px;
        padding: 18px 23px
    }
    .tsBodyXL {
        font-family: var(--title-font);
        font-size: var(--headMFont);
        letter-spacing: var(--letter04);
        line-height: var(--headMLine)
    }
    .tsBodyMLong {
        font-size: var(--bodyMFont);
        line-height: 20px
    }
    .tsBold {
        font-weight: var(--fontBold)
    }
    .modAlly {
        --headXXLFont: 1.3 rem;
        --headXXLLine: 1.5 rem;
        --headXLFont: 1.2 rem;
        --headXLLine: 1.5 rem;
        --headLFont: 1.1 rem;
        --headLLine: 1.5 rem;
        --headMFont: 1.1 rem;
        --headMLine: 1.5 rem;
        --bodyMFont: 1.1 rem;
        --bodyMLine: 1.5 rem;
        --bodyLFont: 1.1 rem;
        --bodyLLine: 1.5 rem;
        --captionFont: 1 rem;
        --captionLine: 1.5 rem
    }
</style>
