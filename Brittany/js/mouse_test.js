$(document).ready(function () {
    console.log("mouse_test.js is running!");

    // Create the smiley face element if it doesn’t exist
    if ($('.smiley').length === 0) {
        console.log("Creating smiley element...");
        $('body').append('<div class="smiley">🙂</div>');
        $('.smiley').css({
            fontSize: '30px', // Increase emoji size
            position: 'absolute',
            pointerEvents: 'none', // Prevents blocking clicks
            userSelect: 'none' // Prevents text selection
        });
    }

    var $smiley = $('.smiley');

    function moveSmiley(e) {
        console.log("Mouse move detected at:", e.pageX, e.pageY);

        gsap.to($smiley, { 
            duration: 0.3, 
            left: e.pageX, 
            top: e.pageY
        });
    }

    $(window).on('mousemove', moveSmiley);
});
