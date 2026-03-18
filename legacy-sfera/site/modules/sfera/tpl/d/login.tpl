      <div class="modal remodal md-login" data-remodal-id="login">
        <button class="modal__close close-btn" data-remodal-action="close">
          Закрыть
        </button>
        <div class="login-tabs js-tabs">
          <ul class="login-tabs__menu">
            <li class="login-tabs__item is-active">
              <a data-el="tab" href="#login_tab" class="login-tabs__link"><span>Я уже тут</span></a>
            </li>
            <li class="login-tabs__item">
              <a data-el="tab" href="#register_tab" class="login-tabs__link"><span>Хочу к вам</span></a>
            </li>
          </ul>
          <div class="login-tabs__panes">
            <div data-el="pane" id="login_tab" class="login-tabs__pane is-active">
              <div class="md-login__social">
                <a class="md-login__social-item md-login__social-item--vk" href="#"></a><a class="md-login__social-item md-login__social-item--fb" href="#"></a><a class="md-login__social-item md-login__social-item--tw" href="#"></a><a class="md-login__social-item md-login__social-item--gplus"
                href="#"></a>
              </div>
              <div class="md-login__or">
                или
              </div>
              <form autocomplete="off" class="md-login__form">
                <div class="form-row">
                  <div class="complex-input complex-input--icon js-complex-input">
                    <label class="complex-input__label">E-mail</label>
                    <div class="complex-input__icon">
                      <i class="ticon ticon-user-1 "></i>
                    </div>
                    <div class="complex-input__input">
                      <input type="email" class="input">
                    </div>
                  </div>
                </div>
                <div class="form-row">
                  <div class="complex-input complex-input--icon password-input js-complex-input">
                    <label class="complex-input__label">Пароль</label>
                    <div class="complex-input__icon">
                      <i class="ticon ticon-lock "></i>
                    </div>
                    <div class="complex-input__input">
                      <input type="password" class="input js-toggle-password">
                    </div>
                    <div class="password-input__block">
                      <div class="password-input__forgot">
                        <a href="#">Забыли пароль?</a>
                      </div>
                      <a title="Скрыть пароль" href="#" class="toggle-password js-toggle-password-btn"><i></i></a>
                    </div>
                  </div>
                </div>
                <div class="form-row">
                  <button type="submit" class="btn btn--pink btn--lg">
                    <i style="font-size: 19px;" class="ticon ticon-key "></i>
                    Войти
                  </button>
                </div>
              </form>
            </div>
            <div data-el="pane" id="register_tab" class="login-tabs__pane">
              <div class="md-login__social">
                <a class="md-login__social-item md-login__social-item--vk" href="#"></a><a class="md-login__social-item md-login__social-item--fb" href="#"></a><a class="md-login__social-item md-login__social-item--tw" href="#"></a><a class="md-login__social-item md-login__social-item--gplus"
                href="#"></a>
              </div>
              <div class="md-login__or">
                или
              </div>
              <form autocomplete="off" class="md-login__form js-example-form">
                <div class="form-row">
                  <div class="form-help">
                    <a href="#" class="form-help__close close-btn js-parent-remove"></a>
                    <p>
                      При регистрации Личного Кабинета, просим Вас указывать реальные данные.
                    </p>
                    <p>
                      Корректное ФИО необходимо для осуществления возврата денежных средств после оплаты.
                    </p>
                    <p>
                      Адрес электронной почты необходим, чтобы Вы всегда были в курсе всех акций и статусов Ваших заказов.
                    </p>
                    <p>
                      Номер телефона необходим, чтобы в день доставки с Вами мог связаться наш курьер. Так же, по Вашему желанию, Вам могут приходить смс уведомления о текущих акциях и специальных предложениях.
                    </p>
                  </div>
                  <div class="complex-input complex-input--icon is-valid js-complex-input">
                    <label class="complex-input__label">E-mail</label>
                    <div class="complex-input__icon">
                      <i class="ticon ticon-user-1 "></i>
                    </div>
                    <div class="complex-input__input">
                      <input type="email" class="input">
                    </div>
                  </div>
                  <label class="switcher ">
                    <div class="switcher__inn">
                      <div class="switcher__toggle">
                        <input  type="checkbox" class="js-switchery ">
                      </div>
                      <div class="switcher__label">
                        Подписаться на новости
                      </div>
                    </div> </label>
                </div>
                <div class="form-row">
                  <div class="complex-input js-complex-input">
                    <label class="complex-input__label">Фамилия</label>
                    <div class="complex-input__input">
                      <input data-error="Введите фамилию на русском языке" type="text" class="input" name="second_name">
                    </div>
                  </div>
                </div>
                <div class="form-row">
                  <div class="complex-input js-complex-input">
                    <label class="complex-input__label">Имя</label>
                    <div class="complex-input__input">
                      <input type="text" class="input">
                    </div>
                  </div>
                </div>
                <div class="form-row">
                  <div class="gender-select">
                    <div class="gender-select__inn">
                      <div class="gender-select__label">
                        Пол:
                      </div>
                      <div class="gender-select__item">
                        <label class="gender-select__checkbox">
                          <input type="radio" name="gender" value="man">
                          <span class="gender-select__checkbox-item"> <i  class="ticon ticon-man "></i> </span> </label>
                      </div>
                      <div class="gender-select__item">
                        <label class="gender-select__checkbox">
                          <input type="radio" name="gender" value="woman">
                          <span class="gender-select__checkbox-item"> <i  class="ticon ticon-woman "></i> </span> </label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-row">
                  <div class="row">
                    <div class="col-sm-3">
                      <select data-placeholder="День" class="select">
                        <option></option>

                        <option>1</option>

                      </select>
                    </div>
                    <div class="col-sm-5">
                      <select data-placeholder="Месяц" class="select">
                        <option></option>

                        <option>Январь</option>

                      </select>
                    </div>
                    <div class="col-sm-4">
                      <select data-placeholder="Год" class="select">
                        <option></option>

                        <option>1900</option>

                      </select>
                    </div>
                  </div>
                </div>
                <div class="form-row hidden-xs">
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
                </div>
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
                        Получать SMS об акциях и спецпредложениях
                      </div>
                    </div> </label>
                </div>
                <div class="form-row">
                  <button type="submit" class="btn btn--pink btn--lg">
                    <i style="font-size: 27px;" class="ticon ticon-door "></i>
                    Зарегистрироваться
                  </button>
                </div>
                <div class="form-row">
                  <div class="text">
                    Я соглашаюсь с условиями <a class="link link--ul" href="#">Публичной оферты</a>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
