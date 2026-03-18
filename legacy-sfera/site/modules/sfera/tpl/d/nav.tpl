      <div class="m-nav js-m-nav">
        <div class="m-nav__group">
          <a href="#login" class="m-nav__link m-nav__link--icon"> Авторизация </a>
        </div>
        <div class="m-nav__group">
          <a href="#" class="m-nav__link m-nav__location js-location-select-toggle"> <span>Город:</span> Москва </a>
        </div>
        <div class="m-nav__group">
				  ~~include file='market/tpl/m-nav__catalog.tpl'~
			  </div>
        <div class="m-nav__group">
          <a href="#" class="m-nav__link">Контакты</a>
        </div>



            <div class="modal remodal md-login" data-remodal-id="confirmation" class="phone">
              <button class="modal__close close-btn" data-remodal-action="close">
                Закрыть
              </button>
              <div class="login-tabs js-tabs">

                <div class="login-tabs__panes">
                  <div data-el="pane" id="login_tab" class="login-tabs__pane is-active register-tabs__pane">
                    <!--div class="md-login__social">
                      <a class="md-login__social-item md-login__social-item--vk" href="#"></a><a class="md-login__social-item md-login__social-item--fb" href="#"></a><a class="md-login__social-item md-login__social-item--tw" href="#"></a><a class="md-login__social-item md-login__social-item--gplus"
                      href="#"></a>
                    </div>
                    <div class="md-login__or">
                      или
                    </div-->
                    <form autocomplete="off" class="md-login__form">
                      <div class="form-row">

                      </div>
                      <div class="form-row">
                        <div class="complex-input complex-input--icon password-input js-complex-input">
                          <label class="complex-input__label">Введите код из смс</label>
                          <div class="complex-input__icon">

                          </div>
                          <div class="complex-input__input">
                            <input type="text" class="input js-toggle-password-phone">
                          </div>
                          <div class="password-input__block">
                            <div class="password-input__forgot">
                              <a href="#">Отправить заново</a>
                            </div>
                            <!--<a title="Скрыть пароль" href="#" class="toggle-password js-toggle-password-btn"><i></i></a>-->
                          </div>
                        </div>
                      </div>
                      <div class="form-row">
                        <button type="submit" class="btn btn--pink btn--lg ">Подтвердить</button>
                      </div>
                    </form>
                  </div>
                  <div data-el="pane" id="register_tab" class="login-tabs__pane">
                    <!--div class="md-login__social">
                      <a class="md-login__social-item md-login__social-item--vk" href="#"></a><a class="md-login__social-item md-login__social-item--fb" href="#"></a><a class="md-login__social-item md-login__social-item--tw" href="#"></a><a class="md-login__social-item md-login__social-item--gplus"
                      href="#"></a>
                    </div>
                    <div class="md-login__or">
                      или
                    </div-->
                    <form autocomplete="off" class="md-login__form js-example-form">

                      <div class="form-row">
                        <div class="input-row">
                          <div class="input-row__cell input-row__icon">
                            <i class="ticon ticon-mobile "></i>
                          </div>
                          <div class="input-row__cell input-row__cell--border text-center" style="width: 80px;">
                            <select class="select">

                              <option>+7</option>

                            </select>
                          </div>
                          <div class="input-row__cell">
                            <input type="text" class="input js-phone-mask" placeholder="(___) ___-__-__">
                          </div>
                        </div>
                        <label class="switcher ">
                          <div class="switcher__inn">
                            <div class="switcher__toggle">
                              <input  type="checkbox" class="js-switchery ">
                            </div>
                            <div class="switcher__label">
                              Получать сервисные SMS уведоммления
                            </div>
                          </div> </label>
                      </div>

                      <!--div class="form-row hidden-xs">
                        <div class="input-row password-row js-password-row">
                          <div class="input-row__cell input-row__icon">
                            <i class="ticon ticon-asterisk "></i>
                          </div>
                          <div class="input-row__cell input-row__cell--tiny">
                            <input class="input js-toggle-password" type="password">
                          </div>
                          <div class="input-row__cell input-row__cell--tiny">
                            <input class="input js-toggle-password" type="password">
                          </div>
                          <div class="input-row__cell input-row__cell--tiny">
                            <input class="input js-toggle-password" type="password">
                          </div>
                          <div class="input-row__cell input-row__cell--tiny">
                            <input class="input js-toggle-password" type="password">
                          </div>
                          <div class="input-row__cell input-row__cell--tiny">
                            <input class="input js-toggle-password" type="password">
                          </div>
                          <div class="input-row__cell input-row__cell--tiny">
                            <input class="input js-toggle-password" type="password">
                          </div>
                          <div class="input-row__cell input-row__cell--tiny">
                            <input class="input js-toggle-password" type="password">
                          </div>
                          <div class="input-row__cell input-row__cell--tiny">
                            <input class="input js-toggle-password" type="password">
                          </div>
                          <a title="Скрыть пароль" href="#" class="toggle-password js-toggle-password-btn input-row__cell"> <i></i> </a>
                        </div>
                      </div>
                      <div class="form-row xvisible-sm">
                        <div class="complex-input js-complex-input">
                          <label class="complex-input__label">Пароль</label>
                          <div class="complex-input__input">
                            <input type="password" class="input">
                          </div>
                        </div>
                      </div-->

                      <div class="form-row">
                        <button type="submit" class="btn btn--pink btn--lg">Зарегистрироваться</button>
                      </div>
                      <div class="form-row">
                        <!--div class="text">
                          Я соглашаюсь с условиями <a class="link link--ul" href="#">Публичной оферты</a>
                        </div-->
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>


      </div>
