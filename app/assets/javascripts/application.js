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
//= require turbolinks
//= require_tree .

  $(function () {
       $window = $(window);
       
       $('.home-image-block').each(function () {
           var $scroll = $(this);
           
           if( !$scroll.hasClass('phonebooth'))
           {
                $(window).scroll(function () {                       
                    var yPos = -200-($window.scrollTop() / 10); 
                    var coords = '50% ' + yPos + 'px';
                    //$scroll.css({ backgroundPosition: coords });
                }); // end window scroll
           }
           else
           {
               //$scroll.css({ backgroundPosition: 'center top' });
           }
          
       });  // end section function
       
   });