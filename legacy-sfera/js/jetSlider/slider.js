/*global jQuery*/
/**
 * Слайдер JetHelix
 * @author www.fresh-team.ru
 *
 * Структура параметров:
 * должны устанавливаться перед инициализацией:
 * - shuffle (bool),
 * - resizable (bool)
 * - auto (bool) set autosliding mode
 * - delay (number) delay  for autosliding in milliseconds
 * может уснанавливаться во время выполнения:
 * - transition_effect (standard, moon)
 *
 * DOM-элемент слайдера генерирует события:
 * - onSliderInit - после инициализации слайдера и прогрузки всех кадров,
 * - onRewindStart - при начале перемотки,
 * - onEnterFrame - при входе на новый кадр,
 * - onSliderResize - при изменении размера слайдера
 *
 * К jQuery-объекту элемента добавляются методы:
 * - back(n) - на n кадров назад
 * - forward(n) - на n кадров вперед
 * - params([newParams]) - получить/изменить параметры
 * - activeFrame() - получить активный кадр
 */
(function($) {
    'use strict';
    $.fn.jetSlider = function(params) {
        var sliderObject = new JetSlider(this, params);
        this.forward = sliderObject.forward;
        this.back = sliderObject.back;
        this.params = sliderObject.params;
        this.activeFrame = sliderObject.activeFrame;
    };

    function JetSlider(sliderDomObject, params) {
        params = params || {};

        //Публичные методы
        this.forward = forward;
        this.back = back;
        this.params = getSetParams;
        this.activeFrame = getActiveFrame;

        this.framesCount = getFramesCount;
        this.currentFrame = getCurrentFrame;

        //Переменные
        var jetSliderSelf = this;
        var tipWindowNode = null;
        var sliderWidth = 0;
        var sliderHeight = 0;
        var framesCount = 0;

        var oldOffset = 0;
        var framesOffset = 0;

        var lockRewind = false;
        var lockAdditionalAnimation = false;

        var framesCollection;
        var activeFrame;

        var rewindDuration = 500;

        var autoMode = (typeof params.auto !== "undefined" && params.auto === true);
        var minDelay = 2000 + rewindDuration;
        var maxDelay = 60000 + rewindDuration;
        var autoHandler = 0;
        var delay = 0;
        var _delay = 0;

        //Геттеры/сеттеры
        function getActiveFrame() {
            return activeFrame;
        }

        function getSetParams(newParams) {
            if (typeof newParams !== "undefined") {
                for (var key in newParams) {
                    if (newParams.hasOwnProperty(key)) {
                        params[key] = newParams[key];
                    }
                }
            }

            return params;
        }

        function getFramesCount() {
            return framesCount;
        }

        function getCurrentFrame() {
            return -framesOffset + 1;
        }

        //Работа
        initParams();
        initSlider();

        function initParams() {
            params.shuffle = params.shuffle || false;
            params.resizable = params.resizable || false;
            params.transition_effect = params.transition_effect || 'standard';
        }

        function initSlider() {
            framesCollection = $('.jet-slider-frames li', sliderDomObject);
            framesCount = framesCollection.length;

            if (params.shuffle) {
                shuffleFrames();
            }

            sliderWidth = sliderDomObject.width();
            sliderHeight = $('.jet-slider-frames', sliderDomObject).height();
            buildFrames();

            if (params.resizable) {
                $(window).resize(makeResize);
            }

            bindNavEvents();
            bindIndicatorEvents();
            buildTips();

            if (autoMode) {
                setAutoMode();
            }
            checkSliderReady();
        }

        function shuffleFrames() {
            var framesDomObjects = framesCollection.get();
            var shuffledDomObjects = [];
            for (var i = 0; i < framesCount; ++i) {
                var random = Math.floor(Math.random() * framesDomObjects.length);
                var randElem = $(framesDomObjects[random]).clone(true);
                framesDomObjects.splice(random, 1);
                shuffledDomObjects.push(randElem);
            }

            framesCollection.each(function(i) {
                $(this).replaceWith(shuffledDomObjects[i]);
            });

            framesCollection = $('.jet-slider-frames li', sliderDomObject);
        }

        function buildFrames() {
            setFramesLeft();
            activeFrame = $('.jet-slider-frames li:first', sliderDomObject);
            activeFrame.addClass('jet-slider-active-frame');
            sliderDomObject.trigger('onEnterFrame', [jetSliderSelf]);
        }

        function setFramesLeft() {
            framesCollection.each(function(i) {
                var left = sliderWidth * (i + framesOffset);
                left = left.toString() + 'px';
                $(this).css('left', left);
            });
        }

        function makeResize() {
            sliderWidth = sliderDomObject.width();
            sliderHeight = $('.jet-slider-frames', sliderDomObject).height();

            if (activeFrame.is(':animated')) {
                lockAdditionalAnimation = true;
                activeFrame.stop(true, true);
            }

            if (framesCollection.is(':animated')) {
                lockAdditionalAnimation = true;
                framesCollection.stop(true, true);
            }

            setFramesLeft();
            sliderDomObject.trigger('onSliderResize', [jetSliderSelf]);
        }

        function bindNavEvents() {
            var startTouchX;

            $('.jet-slider-button-forward', sliderDomObject).click(function() {
                forward();
                if (autoMode) {
                    updateAutoModeInterval();
                }
                return false;
            });

            $('.jet-slider-button-back', sliderDomObject).click(function() {
                back();
                if (autoMode) {
                    updateAutoModeInterval();
                }
                return false;
            });

            framesCollection.bind('touchstart', function(e) {
                e.preventDefault();
                var touchesList = e.originalEvent.changedTouches;
                if (touchesList && touchesList.length > 0) {
                    startTouchX = touchesList[0].pageX;
                } else {
                    startTouchX = 0;
                }
            });

            framesCollection.bind('touchend', function(e) {
                e.preventDefault();
                var touchesList = e.originalEvent.changedTouches;
                if (touchesList && touchesList.length) {
                    if (touchesList[0].pageX < startTouchX) {
                        back();
                    } else {
                        forward();
                    }
                }
                if (autoMode) {
                    updateAutoModeInterval();
                }
            });
        }

        function bindIndicatorEvents() {
            $('.jet-slider-indicator a', sliderDomObject).click(function() {
                var targetFrame = this.href.replace(/.+-(\d+)$/, '$1');
                targetFrame = parseInt(targetFrame);

                var deltaFrame = targetFrame + framesOffset;
                if (deltaFrame > 0) {
                    forward(deltaFrame);
                } else {
                    back(-deltaFrame);
                }
                if (autoMode) {
                    updateAutoModeInterval();
                }
                return false;
            });

            sliderDomObject.bind('onRewindStart', setIndicatorActive);
        }

        function setIndicatorActive() {
            var num = 1 - framesOffset;
            $('.jet-slider-indicator li', sliderDomObject).removeClass('jet-slider-indicator-selected');
            $('.jet-slider-indicator li:nth-child(' + num + ')', sliderDomObject).addClass('jet-slider-indicator-selected');
        }

        function buildTips() {
            tipWindowNode = $('.jet-slider-tip-window:first', sliderDomObject);
            fillTipText(false);
            sliderDomObject.bind('onRewindStart', fillTipText);
        }

        function fillTipText(useFade) {
            if (typeof useFade === "undefined") {
                useFade = true;
            }

            if (useFade) {
                tipWindowNode.hide();
            }

            var currentFrameNumber = 1 - framesOffset;
            var oCurrentFrameImage = $('.jet-slider-frames li:nth-child(' + currentFrameNumber + ') img', sliderDomObject);
            var text = oCurrentFrameImage.attr('data-text') || oCurrentFrameImage.attr('alt');

            if (text) {
                tipWindowNode.html(text);
                if (useFade) {
                    tipWindowNode.fadeIn();
                } else {
                    tipWindowNode.show();
                }
            }
            else {
                tipWindowNode.hide();
            }
        }

        function setAutoMode() {
            if (!('delay' in params) || params.delay > maxDelay || params.delay < minDelay) {
                delay = 5000 + rewindDuration;
            } else {
                delay = params.delay + rewindDuration;
            }

            _delay = delay;
            sliderDomObject.bind('onSliderInit', function(){
                updateAutoModeInterval();
            });
        }

        function updateAutoModeInterval() {
            updateDelay();
            clearInterval(autoHandler);
            autoHandler = setInterval(function() {
                forward();
            }, delay);

            sliderDomObject.bind('onEnterFrame', function(){
                var _cdel = delay;
                var _ndel = updateDelay();
                if (_cdel !== _ndel) {
                    updateAutoModeInterval();
                }
            });
        }

        function updateDelay() {
            var active = getActiveFrame();
            if (active.attr('data-delay')) {
                var loc_delay = parseInt(active.attr('data-delay'));
                if (!isNaN(loc_delay) && assertDelay(loc_delay)) {
                    delay = loc_delay;
                } else {
                    delay = _delay;
                }
            } else {
                delay = _delay;
            }

            function assertDelay(del) {
                return (del > 2000 && del < 20000);
            }

            return delay;
        }

        function checkSliderReady() {
            var imgCollection = $('img', sliderDomObject);
            if (imgCollection.length === 0) {
                sliderDomObject.trigger('onSliderInit', [jetSliderSelf]);
                return;
            }

            imgCollection.each(function() {
                var elem = $(this);
                elem.attr('data-src', elem.attr('src'));
                elem.attr('src', null);
            });

            var loaded = 0;
            imgCollection.load(function() {
                if (++loaded === imgCollection.length) {
                    sliderDomObject.trigger('onSliderInit', [jetSliderSelf]);
                }
            });

            imgCollection.each(function() {
                var elem = $(this);
                elem.attr('src', elem.attr('data-src'));
            });
        }

        function forward(n) {
            if (lockRewind) {
                return;
            }

            if (typeof n === "undefined") {
                n = 1;
            }

            oldOffset = framesOffset;
            framesOffset -= n;
            makeRewind();
        }

        function back(n) {
            if (lockRewind) {
                return;
            }

            if (typeof n === "undefined") {
                n = 1;
            }

            oldOffset = framesOffset;
            framesOffset += n;
            makeRewind();
        }

        function makeRewind() {
            lockRewind = true;

            if (params.transition_effect === 'moon') {
                moonRewind();
            } else {
                standardRewind();
            }
            sliderDomObject.trigger('onRewindStart', [jetSliderSelf]);
        }

        function moonRewind() {
            var shiftParams = makeFramesShiftParams();

            var preShiftValue = sliderWidth * 0.1;
            var leftPreShift;
            if (shiftParams.dlt_frames > 0) {
                leftPreShift = '+=' + preShiftValue + 'px';
            } else {
                leftPreShift = '-=' + preShiftValue + 'px';
            }
            var animParams = {
                'left': leftPreShift,
                'opacity': 0
            };
            activeFrame.animate(animParams, rewindDuration, onOldFrameShifted);

            function onOldFrameShifted() {
                framesCollection.hide();
                activeFrame.css('left', 0);
                activeFrame.css('opacity', 1);
                framesCollection.css('left', shiftParams.targ_left);
                changeActiveFrame();

                if (lockAdditionalAnimation) {
                    onComplete();
                } else {
                    showNewFrameAnimated();
                }
            }

            function showNewFrameAnimated() {
                var leftPreShift;
                if (shiftParams.dlt_frames > 0) {
                    leftPreShift = '-=' + preShiftValue + 'px';
                } else {
                    leftPreShift = '+=' + preShiftValue + 'px';
                }
                activeFrame.css('left', leftPreShift);
                activeFrame.css('opacity', 0);

                var animParams = {
                    'left': 0,
                    'opacity': 1
                };
                framesCollection.show();
                activeFrame.animate(animParams, rewindDuration, onComplete);
            }

            function onComplete() {
                framesCollection.show();
                lockAdditionalAnimation = false;
                lockRewind = false;
                sliderDomObject.trigger('onEnterFrame', [jetSliderSelf]);
            }
        }

        function makeFramesShiftParams() {
            var dltFrames = makeDltFrames();
            var targLeftValue = Math.abs(sliderWidth * dltFrames);

            var targLeft;
            if (dltFrames > 0) {
                targLeft = '+=' + targLeftValue + 'px';
            } else {
                targLeft = '-=' + targLeftValue + 'px';
            }
            return {'targ_left': targLeft, 'dlt_frames': dltFrames};
        }

        function makeDltFrames() {
            var curFrame = -framesOffset;
            var targFrame;
            var dltFrames;

            if (curFrame >= framesCount) {
                dltFrames = framesCount - 1;
                targFrame = 0;
            }
            else if (curFrame < 0) {
                dltFrames = 1 - framesCount;
                targFrame = framesCount - 1;
            }
            else {
                dltFrames = framesOffset - oldOffset;
                targFrame = curFrame;
            }

            framesOffset = -targFrame;
            return dltFrames;
        }

        function changeActiveFrame() {
            activeFrame.removeClass('jet-slider-active-frame');
            activeFrame = $(framesCollection[-framesOffset]);
            activeFrame.addClass('jet-slider-active-frame');
        }

        function standardRewind() {
            var targLeft = makeFramesShiftParams().targ_left;
            var params = {'left': targLeft};
            framesCollection.animate(params, 'slow', onComplete);

            function onComplete() {
                changeActiveFrame();
                lockAdditionalAnimation = false;
                lockRewind = false;
                sliderDomObject.trigger('onEnterFrame', [jetSliderSelf]);
            }
        }
    }
})(jQuery);
