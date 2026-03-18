import device from 'current-device';

let sSelectbox = '';
const sSelect = 'select';
const sOption = 'option';
const cActive = 'selectbox_active';
const sContainer = '.selectbox__container';
const sCont = '.selectbox__cont';
const sCustomOption = '.selectbox__option';
const cCustomOptionActive = 'selectbox__option_active';
const cOptionPlaceholder = 'selectbox__option-placeholder';
const cInited = 'selectbox_inited';
const sBtn = '.selectbox__btn';

function setValue($parent, value) {
    if ($parent.length && value) {
        const $selectOption = $parent.find(sOption).filter(`[value="${value}"]`);
        const $select = $parent.find(sSelect).first();

        if ($select.length) {
            $parent.find(sCustomOption).removeClass(cCustomOptionActive).filter(`[data-value="${value}"]`).addClass(cCustomOptionActive);
            $select.val(value);
            $parent.removeClass(cActive).find(sContainer).removeAttr('style');
            $parent.find(`.${cOptionPlaceholder}`).remove();

            if ($selectOption.length) {
                const attrHref = $selectOption.attr('data-href');

                if (attrHref?.length) {
                    document.location = attrHref;
                }
            }

            $parent.trigger('changed.selectbox.eksmo', [value]);
        }
    }
}

function removeListeners($selectbox) {
    $selectbox.each(function () {
        const $this = $(this);

        if (!$this.hasClass(cInited)) {
            $this.find(sBtn).off('click.selectbox.eksmo');
            $this.off('click.selectbox.eksmo');
            $this.find(sSelect).off('change.selectbox.eksmo');
            $this.off('setValue.selectbox.eksmo');
        }
    });

    $(document).off('click.selectbox.eksmo');
}

export const oSelectbox = {
    init(selector = false) {
        sSelectbox = selector;

        if (sSelectbox) {
            const $selectbox = $(sSelectbox);

            removeListeners($selectbox);

            $selectbox.each(function () {
                const $this = $(this);
                const $select = $this.find(sSelect).first();

                if ($select.length && !$this.hasClass(cInited)) {
                    const $option = $select.find(sOption);

                    $this.addClass(cInited);

                    if ($option.length) {
                        let htmlOptions = '';
                        const $optionPlaceholder = $option.filter(`.${cOptionPlaceholder}`);

                        if ($optionPlaceholder.length && !$optionPlaceholder[0].selected) {
                            $this.find(`.${cOptionPlaceholder}`).remove();
                        }

                        $option.each(function () {
                            const $thisOption = $(this);
                            let additionClass = '';
                            const value = $thisOption.attr('value');

                            if ($thisOption[0].selected) {
                                additionClass = ` ${cCustomOptionActive}`;
                            } else if ($thisOption.hasClass(cOptionPlaceholder)) {
                                return;
                            }

                            if (value) {
                                const attrHref = $thisOption.attr('data-href');

                                if ($thisOption.hasClass(cOptionPlaceholder)) {
                                    additionClass += ` ${cOptionPlaceholder}`;
                                }

                                htmlOptions += `
                                    <div
                                        class="selectbox__option${additionClass}"
                                        data-value="${value}"${attrHref?.length ? ` data-href="${attrHref}"` : ``}
                                    >${$thisOption.text()}</div>`;
                            }
                        });

                        $this.append(`
                            <div class="selectbox__btn"></div>
                            <div class="selectbox__custom">
                                <div class="selectbox__container">
                                    <div class="selectbox__cont">${htmlOptions}</div>
                                </div>
                            </div>
                        `);

                        $select.find(`.${cOptionPlaceholder}`).remove();
                    }

                    $this.find(sBtn).on('click.selectbox.eksmo', function (e) {
                        const $parent = $(this).closest(sSelectbox);
                        const $container = $parent.find(sContainer);
                        const $cont = $parent.find(sCont);
                        const $curSelect = $parent.find(sSelect);

                        e.preventDefault();

                        if ($container.length && $cont.length && !$curSelect.prop('disabled')) {
                            if (!$parent.hasClass(cActive)) {
                                $(sSelectbox).removeClass(cActive).find(sContainer).removeAttr('style');
                                $parent.addClass(cActive);
                                $container.height($cont.outerHeight(true));
                            } else {
                                $(sSelectbox).removeClass(cActive).find(sContainer).removeAttr('style');
                            }
                        }
                    });

                    $this.on('click.selectbox.eksmo', `${sCustomOption}:not(.${cCustomOptionActive}):not(.${cOptionPlaceholder})`, function (e) {
                        const $thisOption = $(this);
                        const $parent = $thisOption.closest(sSelectbox);
                        const value = $thisOption.attr('data-value');

                        e.preventDefault();
                        setValue($parent, value);
                    });

                    $this.find(sSelect).on('change.selectbox.eksmo', function () {
                        if (device.ios() || device.android()) {
                            const $thisSelect = $(this);
                            const $parent = $thisSelect.closest(sSelectbox);
                            const value = $thisSelect.val();

                            setValue($parent, value);
                        }
                    });

                    $this.on('setValue.selectbox.eksmo', function (e, value) {
                        setValue($(this), value);
                    });
                }
            });

            $(document).on('click.selectbox.eksmo', (e) => {
                if (!device.ios() && !device.android()) {
                    if ($(e.target).closest(sSelectbox).length || $(e.target).is(sSelectbox)) {
                        return;
                    }

                    $(sSelectbox).removeClass(cActive);
                    $(sContainer).removeAttr('style');
                    e.stopPropagation();
                }
            });
        }
    },

    destroy(selector = false) {
        sSelectbox = selector;

        if (sSelectbox) {
            const $selectbox = $(sSelectbox);

            $selectbox.find(sBtn).remove();
            $selectbox.find('.selectbox__custom').remove();
            $selectbox.removeClass(cInited);
            removeListeners($selectbox);
        }
    },
};