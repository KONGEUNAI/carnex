(function($) {
    
    var LiteAccordion = function(elem, options) {
        
        var defaults = { // 기본값 지정
            containerWidth : 1300, // 부모박스의 너비값을 지정(어코디언 내용+어코디언 버튼들 : 1150 + 150 = 1300)
            containerHeight : 480, // 부모박스의 높이값을 지정
            headerWidth : 50, // 어코디언 버튼의 너비값을 지정
            responsive : true, // 반응형 지원 여부를 지정
            autoScaleImages : true, // 단일 이미지가 슬라이드에 배치되면 자동크기 조정 지정
            minContainerWidth:350, // 어코디언 크기를 조정할 최소 너비
            maxContainerWidth:1300, // 어코디언 크기를 조정할 최대 너비

            activateOn :'click', // 슬라이드 버튼에 대한 이벤트 효과 선택 지정(click, mouseover)
            firstSlide : 1, // 처음 보여줄 슬라이드 이미지 지정
            slideSpeed : 800, // 슬라이드 애니메이션 속도
            onTriggerSlide : function( ) { },
            onSlideAnimComplete : function( ) { },
            
            autoPlay : true, // 슬라이드 애니메이션 자동 재생 여부를 지정
            pauseOnHover : true, // 슬라이드 이미지에 마우스 오버시 애니메이션 재생 여부를 지정
            cycleSpeed : 4000, // 슬라이드 애니메이션과 슬라이드 애니메이션 사이의 시간 지정
            easing : 'swing', // 이징 효과를 지정
                                                    
            theme : 'basic', // 테마를 지정(dark, light, stitch)
            rounded : false,
            enumerateSlides : false,
            linkable : false
        },
            
            settings = $.extend({}, defaults, options),            
            slides = elem.children('ol').children('li'),
            header = slides.children(':first-child'),
            slideLen = slides.length,
            slideWidth = settings.containerWidth - slideLen * settings.headerWidth,

            // public methods    
            methods = {                
                
                play : function(index) {
                    var next = core.nextSlide(index && index);

                    if (core.playing) return;
                    
                    core.playing = setInterval(function( ) {
                        header.eq(next()).trigger('click.liteAccordion');
                    }, settings.cycleSpeed);
                },
            
                stop : function() {
                    clearInterval(core.playing);
                    core.playing = 0;
                },

                next : function() {
                    methods.stop();
                    header.eq(core.currentSlide === slideLen - 1 ? 0 : core.currentSlide + 1).trigger('click.liteAccordion');
                },

                prev : function() {
                    methods.stop();
                    header.eq(core.currentSlide - 1).trigger('click.liteAccordion');  
                },
                
                destroy : function( ) {                    
                    // stop autoplay
                    methods.stop();

                    // remove hashchange event bound to window
                    $(window).off('.liteAccordion');

                    // remove generated styles, classes, data, events
                    elem
                        .attr('style', '')
                        .removeClass('liteAccordion basic dark light stitch')
                        .removeData('liteAccordion')
                        .off('.liteAccordion')
                        .find('li > :first-child')
                        .off('.liteAccordion')
                        .filter('.selected')
                        .removeClass('selected')
                        .end()
                        .find('b')
                        .remove();
                        
                    slides
                        .removeClass('slide')
                        .children()
                        .attr('style', '');
                },
                
                debug : function( ) {
                    return {
                        elem : elem,
                        defaults : defaults,
                        settings : settings,
                        methods : methods,
                        core : core
                    };
                }       
            },

            core = {
        
                setStyles : function( ) {
                    elem
                        .width(settings.containerWidth)
                        .height(settings.containerHeight)
                        .addClass('liteAccordion')
                        .addClass(settings.rounded && 'rounded')                  
                        .addClass(settings.theme);
                        
                    slides
                        .addClass('slide')
                        .children(':first-child')
                        .height(settings.headerWidth);

                    core.setSlidePositions( );

                    if (settings.responsive) {
                        core.responsive( );
                    } else {                        
                        if (settings.autoScaleImages) core.autoScaleImages();
                    }
                },

                setSlidePositions : function( ) {
                    var selected = header.filter('.selected');

                    if (!selected.length) header.eq(settings.firstSlide - 1).addClass('selected');

                    header.each(function(index) {
                        var $this = $(this),
                            left = index * settings.headerWidth,
                            margin = header.first( ).next( ),
                            offset = parseInt(margin.css('marginLeft'), 10) || parseInt(margin.css('marginRight'), 10) || 0;
                        
                        if (selected.length) {
                            if (index > header.index(selected)) left += slideWidth;
                        } else {
                            if (index >= settings.firstSlide) left += slideWidth;
                        }

                        $this
                            .css('left', left)
                            .width(settings.containerHeight)
                            .next( )
                                .width(slideWidth - offset)
                                .css({ left : left, paddingLeft : settings.headerWidth }); 
                    });
                },

                responsive : function( ) {
                    var parentWidth = elem.parent( ).width( )-20;

                    // set new container width
                    if (parentWidth > settings.minContainerWidth) {
                        settings.containerWidth = parentWidth < settings.maxContainerWidth ? parentWidth : settings.maxContainerWidth;
                    } else if (parentWidth < settings.maxContainerWidth) {
                        settings.containerWidth = parentWidth > settings.minContainerWidth ? parentWidth : settings.minContainerWidth;
                    }

                    // set new container height : 감싸는 부모요소의 높이값을 지정
                    settings.containerHeight = settings.containerWidth / 2.2 | 0;

                    // resize slides
                    slideWidth = settings.containerWidth - slideLen * settings.headerWidth;

                    // resize container
                    elem
                        .width(settings.containerWidth)
                        .height(settings.containerHeight);

                    // resize slides
                    slides
                        .children(':first-child')
                        .width(settings.containerHeight);

                    // set slide positions
                    core.setSlidePositions();                                       
                },

                // scale images contained within a slide to fit the slide height and width
                autoScaleImages : function() {
                    slides.children('div').each(function() {
                        var $this = $(this), 
                            $imgs = $this.find('img');

                        if ($imgs.length) {
                            $imgs.each(function(index, item) {
                                $(item).width($this.width() + 1); // fix the anti-aliasing bug in chrome
                                $(item).height($this.height());                                
                            });
                        }
                    });
                },

                // bind click and mouseover events
                bindEvents : function() {
                    var resizeTimer = 0;

                    if (settings.activateOn === 'click') {
                        header.on('click.liteAccordion', core.triggerSlide);
                    } else if (settings.activateOn === 'mouseover') {
                        header.on('click.liteAccordion mouseover.liteAccordion', core.triggerSlide);
                    }
                    
                    // pause on hover (can't use custom events with $.hover())      
                    if (settings.pauseOnHover && settings.autoPlay) {
                        elem
                            .on('mouseover.liteAccordion', function() {
                                core.playing && methods.stop();
                            })
                            .on('mouseout.liteAccordion', function() {
                                !core.playing && methods.play(core.currentSlide);
                            });
                    }

                    // resize and orientationchange
                    if (settings.responsive) {
                        $(window)
                            .on('load.liteAccordion', function() {
                                if (settings.autoScaleImages) core.autoScaleImages();  
                            })
                            .on('resize.liteAccordion orientationchange.liteAccordion', function() {
                                // approximates 'onresizeend'
                                clearTimeout(resizeTimer);
                                resizeTimer = setTimeout(function() {
                                    core.responsive();
                                    if (settings.autoScaleImages) core.autoScaleImages();
                                }, 100);
                            });
                    }
                },
                
                linkable : function() {
                    var cacheSlideNames = (function() {
                        var slideNames = [];

                        slides.each(function() {
                            if ($(this).attr('data-slide-name')) slideNames.push(($(this).attr('data-slide-name')).toLowerCase());
                        });

                        // memoize
                        return cacheSlideNames = slideNames;                        
                    })();
                    
                    var triggerHash = function(e) {
                        var index;
                        
                        if (e.type === 'load' && !window.location.hash) return;
                        if (e.type === 'hashchange' && core.playing) return;
                        
                        index = $.inArray((window.location.hash.slice(1)).toLowerCase(), cacheSlideNames);
                        if (index > -1 && index < cacheSlideNames.length) header.eq(index).trigger('click.liteAccordion');
                    };

                    $(window).on('hashchange.liteAccordion load.liteAccordion', triggerHash);
                },
                
                // counter for autoPlay (zero index firstSlide on init)
                currentSlide : settings.firstSlide - 1,             

                // next slide index
                nextSlide : function(index) {
                    var next = index + 1 || core.currentSlide + 1;

                    // closure
                    return function() {
                        return next++ % slideLen;
                    };
                },  
    
                // holds interval counter
                playing : 0,
                
                slideAnimCompleteFlag : false,
                
                // trigger slide animation
                triggerSlide : function(e) {
                    var $this = $(this),
                        tab = {
                            elem : $this, 
                            index : header.index($this),
                            next : $this.next(),
                            prev : $this.parent().prev().children('h4')
                        };

                    // update core.currentSlide
                    core.currentSlide = tab.index;
                    
                    // reset onSlideAnimComplete callback flag
                    core.slideAnimCompleteFlag = false;            
                            
                    // set location.hash
                    if (settings.linkable && !core.playing) window.location.hash = $this.parent().attr('data-slide-name');

                    // trigger callback in context of sibling div (jQuery wrapped)
                    settings.onTriggerSlide.call(tab.next);

                    // animate
                    if ($this.hasClass('selected') && $this.position().left < slideWidth / 2) {
                        // animate single selected tab
                        core.animSlide.call(tab);                       
                    } else {
                        // animate groups
                        core.animSlideGroup(tab);                       
                    }

                    // stop autoplay, reset current slide index in core.nextSlide closure
                    if (e.originalEvent && settings.autoPlay) {
                        methods.stop();
                        methods.play(header.index(header.filter('.selected')));
                    }  
                },

                animSlide : function(triggerTab) {
                    var _this = this;

                    // set pos for single selected tab
                    if (typeof this.pos === 'undefined') this.pos = slideWidth;

                    // remove, then add selected class
                    header.removeClass('selected').filter(this.elem).addClass('selected');

                    // if slide index not zero
                    if (!!this.index) {
                        this.elem
                            .add(this.next)
                            .stop(true)
                            .animate({
                                left : this.pos + this.index * settings.headerWidth
                            }, 
                                settings.slideSpeed, 
                                settings.easing,
                                function() { 
                                    // flag ensures that fn is only called one time per triggerSlide
                                    if (!core.slideAnimCompleteFlag) {
                                        // trigger onSlideAnimComplete callback in context of sibling div (jQuery wrapped)
                                        settings.onSlideAnimComplete.call(triggerTab ? triggerTab.next : _this.prev.next());
                                        core.slideAnimCompleteFlag = true;
                                    }                                      
                                });                          

                            // remove, then add selected class
                            header.removeClass('selected').filter(this.prev).addClass('selected');                              

                    }
                },
                
                // animates left and right groups of slides
                animSlideGroup : function(triggerTab) {
                    var group = ['left', 'right'];

                    $.each(group, function(index, side) {
                        var filterExpr, left;

                        if (side === 'left')  {
                            filterExpr = ':lt(' + (triggerTab.index + 1) + ')';
                            left = 0;
                        } else {
                            filterExpr = ':gt(' + triggerTab.index + ')';
                            left = slideWidth;
                        }

                        slides
                            .filter(filterExpr) 
                            .children('h4')                           
                            .each(function() {
                                var $this = $(this),
                                    tab = {
                                        elem : $this, 
                                        index : header.index($this),
                                        next : $this.next(),
                                        prev : $this.parent().prev().children('h4'),
                                        pos : left
                                    };                               

                                // trigger item anim, pass original trigger context for callback fn
                                core.animSlide.call(tab, triggerTab);
                            });

                    });

                    // remove, then add selected class
                    header.removeClass('selected').filter(triggerTab.elem).addClass('selected');
                },

                ieClass : function(version) {
                    if (version < 7) methods.destroy();
                    if (version === 7 || version === 8) {
                        slides.each(function(index) {
                            $(this).addClass('slide-' + index);
                        });
                    }

                    elem.addClass('ie ie' + version);
                },
                
                init : function() {
                    var ua = navigator.userAgent,
                        index = ua.indexOf('MSIE');

                    // test for ie
                    if (index !== -1) {                        
                        ua = ua.slice(index + 5, index + 6);
                        core.ieClass(+ua);
                    }

                    // init styles and events
                    core.setStyles();
                    core.bindEvents();

                    // check slide speed is not faster than cycle speed
                    if (settings.cycleSpeed < settings.slideSpeed) settings.cycleSpeed = settings.slideSpeed;

                    // init hash links
                    if (settings.linkable && 'onhashchange' in window) core.linkable();

                    // init autoplay
                    settings.autoPlay && methods.play();
                }
            };

        // init plugin
        core.init();

        // expose methods
        return methods;
       
    };

    $.fn.liteAccordion = function(method) {
        var elem = this,
            instance = elem.data('liteAccordion');

        // if creating a new instance
        if (typeof method === 'object' || !method) {
            return elem.each(function() {
                var liteAccordion;
    
                // if plugin already instantiated, return
                if (instance) return;

                // otherwise create a new instance
                liteAccordion = new LiteAccordion(elem, method);
                elem.data('liteAccordion', liteAccordion);
            });

        // otherwise, call method on current instance
        } else if (typeof method === 'string' && instance[method]) {
            // debug method isn't chainable b/c we need the debug object to be returned
            if (method === 'debug') {
                return instance[method].call(elem);
            } else { // the rest of the methods are chainable though
                instance[method].call(elem);
                return elem;                
            }
        }
    };

})(jQuery);