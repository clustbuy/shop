<style>
         html,
         body {
           height: 100%;
         }
         .wrapper {
           display: flex;
           flex-direction: column;
           min-height: 100%;
         }
         .content {
           flex: 1 0 auto;
         }


         a.cart {
             width: 21px;
             height: 21px;
             background: url(/images/ico-cart.svg) no-repeat;
             background-size: 100% 100%;
         }
         .counter {
             position: absolute;
             top: 4px;
             right: -8px;
             border-radius: 16px;
             border: 2px solid #fff;
             height: 20px;
             min-width: 8px;
             padding: 0 4px;
             background: #ec5a1e;
             color: #fff;
             font: 11px/16px 'PT Sans Narrow',serif;
             text-align: center;
         }

         .header__search {
           padding-left: 15px;
         }
         @font-face {
           font-family: "Roboto";
           font-style: normal;
           font-weight: 400;
           src: local("Roboto"),
                url("/assets/fonts/roboto/roboto.woff2") format("woff2"),
                url("/assets/fonts/roboto/roboto.woff") format("woff");
         }



         @media only screen and (max-width: 940px) {
           .header__search {
             padding-left: 0;
           }
         }

         @media only screen and (max-width: 480px) {
           .header__search {
             display: none;
             position: absolute;
             top: 100%;
             left: 0;
             width: 100%;
           }
         }

         .header__search .search:before {
           display: none;
         }

         @media only screen and (max-width: 760px) {
           .header__search .search__input {
             padding-top: 7px;
             padding-bottom: 7px;
           }
         }

         @media only screen and (max-width: 480px) {
           .header__search .search__input {
             border-radius: 0;
           }
         }

         @media only screen and (max-width: 480px) {
           .header__search .search__submit {
             display: none;
           }
         }

         @media only screen and (max-width: 480px) {
           .header__search .search__close {
             display: block;
           }
         }

         .search .awesomplete > ul {
           border-top: 0;
         }

         .search .awesomplete > ul > li {
           text-decoration: none;
           padding: 0;
           border-bottom: 1px solid rgba(0, 0, 0, 0.3);
         }

         .search .awesomplete > ul > li:last-child {
           border-bottom: 0;
         }


         .product-ac {
           padding: 15px 10px;
         }

         .product-ac__inn {
           table-layout: fixed;
         }

         .product-ac__inn > * {
           vertical-align: top;
         }

         .product-ac__photo {
           width: 80px;
           padding-right: 20px;
         }

         @media only screen and (max-width: 640px) {
           .product-ac__photo {
             width: 50px;
             padding-right: 10px;
           }
         }

         .product-ac__img {
           display: inline-block;
           max-width: 100%;
           width: 100%;
         }

         .product-ac__name {
           max-width: 350px;
           font-size: 14px;
           -o-text-overflow: clip;
           text-overflow: clip;
           display: inline-block;
           white-space: normal;
           overflow: visible;
           line-height: 1.3;
         }

         @media only screen and (max-width: 640px) {
           .product-ac__name {
             font-size: 12px;
           }
         }

         .product-ac .price, .product-ac .bx-soa-cart-total-line-total .bx-soa-cart-d, .bx-soa-cart-total-line-total .product-ac .bx-soa-cart-d {
           display: block;
           font-size: 16px;
         }

         @media only screen and (max-width: 640px) {
           .product-ac .price, .product-ac .bx-soa-cart-total-line-total .bx-soa-cart-d, .bx-soa-cart-total-line-total .product-ac .bx-soa-cart-d {
             font-size: 14px;
           }
         }


         .item-grid__name, .product-ac__name {
           font-size: 16px;
           color: #2f2f2f;
           font-weight: 300;
           margin-bottom: 5px;
           -webkit-transition: all ease .3s;
           -o-transition: all ease .3s;
           transition: all ease .3s;
           display: inline-block;
           white-space: nowrap;
           overflow: hidden;
           -o-text-overflow: ellipsis;
           text-overflow: ellipsis;
           width: 100%;
           padding-left: 5px;
         }

         @media only screen and (max-width: 480px) {
           .item-grid__name, .product-ac__name {
             font-size: 16px;
             margin-bottom: 3px;
           }
         }

         .item-grid__name:hover, .product-ac__name:hover {
           color: #d22262;
           text-decoration: underline;
         }


             i.icon-user:before {
               width: 21px;
                 content: " ";
                 background: url(/assets/img/user-profile.svg) no-repeat;
                 position: absolute;
                 left: 0px;
                 top: -2px;
                 height: 17px;
                 background-size: 100% 100%;
             }

         /*custom style*/
         body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > div.content > div > div > div > div.l-cabinet__aside {
           padding-top: 54px;
         }

         .content {
           padding: 0 40px;
         }

         .cabinet__text__menu {
           font-family: var(--mainFont);
           font-style: normal;
           font-weight: normal;
           font-size: 13px;
           line-height: 15px;
           /* identical to box height, or 118% */
           color: #4A484E;
         }

         .text-reg {
           font-family: var(--mainFont);
           font-style: normal;
           font-weight: normal;
           font-size: 26px;
           line-height: 26px;
           /* or 100% */

           text-align: center;

           color: black;
           margin-bottom: 20px
         }

         .cabinet__title {
           font-family: var(--mainFont);
           font-style: normal;
           font-weight: normal;
           font-size: 30px;
           line-height: 34px;
           /* identical to box height, or 113% */


           color: #153772;

         }

         .reg__title {
           font-family: var(--mainFont);
           font-style: normal;
           font-weight: normal;
           font-size: 25px;
           line-height: 35px;
           /* or 104% */

           display: flex;
           align-items: center;
           text-align: center;

           color: #4A484E;
           text-align: center;

         }

         .reg__text {
           font-family: var(--mainFont);
           font-style: normal;
           font-weight: normal;
           font-size: 25px;
           line-height: 18px;
           /* or 129% */



           color: #FFFFFF;
         }

         .sms-title {
           text-align: center;
           font-family: var(--mainFont);
           font-style: normal;
           font-weight: normal;
           font-size: 35px;
           line-height: 35px;
           color: black;
           margin-bottom: 20px;
         }

         .sms-border {
           margin: 0 auto;
           width: 25%;
           min-width: 360px;
           display: flex;
           flex-direction: column;
           justify-content: center;
           align-items: center;
         }

         .sms-border input {
           border: 1px solid #c2c2c2;
           border-radius: 6px;
           margin-bottom: 10px;
           height: 40px;
         }

         @media only screen and (max-width: 480px) {
          .password-input__forgot {
            position: static;
            }

          }

         #sms {
           padding-left: 35%;
           font-size: 22px;
           width: 200px;
           margin: 10px auto;
           font-family: var(--mainFont);
         }

         #sms-btn {
           margin: 40px auto 0 auto;


         }

         .sms-block {
           padding-top: 15%;
         }

         .reg__title__block {
           background: #EEEBED;
           border-radius: 6px;
           display: flex;
           justify-content: center;
           align-items: center;
           width: 100%;
           min-height: 154px;
           padding: 0 36px;
           margin-top: 67px;
           margin-bottom: 12px;
           min-width: 340px;
           max-width: 1000px;
         }

         .reg__btn {
           background: #48BE7A;
           border-radius: 6px;
           display: flex;
           justify-content: center;
           align-items: center;
           height: 70px;
           width: 200px;
           padding: 0 150px;
           margin-top: 60px;
         }

         .container-reg {
           flex-direction: column;
           justify-content: center;
           align-items: center;
           display: flex;
         }

         .l-content .input-row {
           min-width: 360px;
           max-width: 1000px;
           border-radius: 6px;
           margin-top: 40px;
           width: 50%;
         }

         .l-content .input-row__cell--border-left {
           border-radius: 6px;
         }

         .reg__input {
           z-index: 999;
           display: block;
           padding: 16px 14px;
           border: 1px solid #C2C2C2;
           border-radius: 6px;
           margin-top: 28px;
           min-width: 218px;
           width: 27%;
           font-family: var(--mainFont);
           font-style: normal;
           font-weight: normal;
           font-size: 18px;
           line-height: 16px;
           height: 40px;
           /* or 160% */

           display: flex;
           align-items: center;
           text-indent: 10px;

           color: #B8B8B8;
         }

         .reg__input:focus {
           color: black;
         }

         @media only screen and (max-width: 640px) {
           .content {
             padding: 0 10px;
           }
         }
         .register-tabs__pane {
             border-radius: 6px;
         }

         #title-search-input {
           display: none;
         }

         body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__btn.header__cart.dropdown {
           display: none;
         }

         body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__logo > a > div.header__logo-default {
           text-align: center;
           margin: 0 auto;
         }

         body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__logo > a > div.header__logo-default > div > div > div {
           padding: 0;

           margin: 0 auto;
         }

         body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__logo {
           display: block;
           text-align: center;
           width: 300px;
           margin: 0 auto;
         }

         body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__search.js-search {
           padding: 0;
         }

         body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__logo-mobile {
           display: none;
         }

         body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div {
           padding-right: 93px;
           border-bottom: 1px solid #DDDDDD;
         }

         body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__logo > a > div.header__logo-default > div > div {
           margin-bottom: 15px;
         }

         @media only screen and (max-width: 760px) {
           body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div {
             padding-right: 93px;
             border: none;
           }

           body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__logo > a > div.header__logo-default > div > div {
             margin-top: 10px;
           }
         }

         #login_tab > form > div:nth-child(3) > button {
           width: 122px;
           height: 29px;
           padding: 0 17px;
           font-family: var(--mainFont);
           font-style: normal;
           font-weight: normal;
           font-size: 14px;
           line-height: 18px;
           /* or 129% */

           display: flex;
           align-items: center;
           text-align: center;

           color: #FFFFFF;
           margin: 0 auto;
         }



         #login_tab > form > div:nth-child(2) > div > div.complex-input__input > input,
         #login_tab > form > div:nth-child(2) > div > label {
           font-family: var(--mainFont);
           font-style: normal;
           font-weight: normal;
           font-size: 15px;
           line-height: 16px;
           /* or 160% */

           display: flex;
           align-items: center;
           text-indent: 10px;

           color: #B8B8B8;
         }

         #login_tab > form > div:nth-child(2) > div > div.complex-input__input > input:focus {
           color: black;
           font-size: 15px;
         }

         body > div.l-main.js-main.slideout-panel.slideout-panel-left > header > div > div.header__wrapper.header__wrapper__border > div > div > div.header__btn.header__cabinet.dropdown > a {
           visibility: hidden;
         }

         #register_tab {
           border-radius: 6px;
         }

        .input-row__icon {
          color: black;
        }

        #register_tab > form > div.form-row.hidden-xs > div:nth-child(2) > div {
          border-radius: 6px;
        }
      </style>
