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
//= require pc/jquery.hc-sticky.min.js
//= require_tree ../pc

var ready;
ready = function () {
    jQuery(document).ready(function ($) {
        $('aside').hcSticky({
            top: 16,
            bottom: 16
        });
        $('.article_share').hcSticky({
            top: 16,
            bottom: 16
        });
        $('.wrapper-sticky').css({
            'margin': '0',
            'right': '0'
        });
    });
};

$(document).ready(ready);
$(document).on('turbolinks:load', ready);
