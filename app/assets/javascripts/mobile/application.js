// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
///= require jquery.turbolinks
//= require turbolinks
///= require common/facebook_compatibility
//= require common/twitter_compatibility
//= require velocity
//= require jquery.slick
//= require_tree ../mobile

var ready;
ready = function () {
    var slider = $('#page_wrap'),
        line00 = $('header ol'),
        line01 = $('header ol li:nth-child(01)'),
        line02 = $('header ol li:nth-child(02)'),
        line03 = $('header ol li:nth-child(03)');

    function rotate(elem, z, y, degree) {
        elem.velocity({
            translateZ: z,
            translateY: y,
            rotateZ: degree
        }, {
            duration: 400,
            easing: [0.215, 0.610, 0.355, 1.000]
        });
    }

    function fade(elem, fadeType) {
        line02.velocity(
            fadeType, {
                duration: 400,
                easing: [0.215, 0.610, 0.355, 1.000]
            }
        );
    }

    function slide(elem, moveDistance) {
        elem.velocity({
                translateX: moveDistance
            }, {
                duration: 400,
                easing: [0.215, 0.610, 0.355, 1.000]
            }
        );
    }

    line00.click(function () {
        if ($(this).hasClass('defo')) {
            rotate(line01, 0, 6, '45deg');
            fade(line02, 'fadeOut');
            rotate(line03, 0, -6, '-45deg');
            slide(slider, "-260px");
            $(this).addClass('open').removeClass('defo');
        } else {
            rotate(line01, 0, 0, '0deg');
            fade(line02, 'fadeIn');
            rotate(line03, 0, 0, '0deg');
            slide(slider, "0");
            $(this).removeClass('open').addClass('defo');
        }
    });

    // slick
    $('#my-slider').slick({
        slidesToShow: 4,
        slidesToScroll: 4,
        variableWidth: true,
        arrows: false
    });
    $('#catch-container').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: true
    });
    var windowH = window.innerHeight,
        headerH = $('header').innerHeight(),
        categoryH = $('.categories').innerHeight(),
        mainH = $('#main').innerHeight(),
        footerH = $('footer').innerHeight(),
        html = $('html'),
        body = $('body')
    allHeihgt = headerH + categoryH + mainH + footerH;
    function heightAdjust(elem) {
        elem.css('min-height', windowH).height(allHeihgt);
    }

    heightAdjust(html);
    heightAdjust(body);
};
$(document).on('turbolinks:load', ready);
