$(function () {
    $('.unlike-btn').hover(
        function () {
            $(this).animate({
                'font-size':'20px'
            },300);
        },
        function () {
            $(this).animate({
                'font-size': '16px'
            }, 300);
        }
    );

    $('.like-btn').hover(
        function () {
            $(this).animate({
                'font-size':'20px'
            },300);
        },
        function () {
            $(this).animate({
                'font-size': '16px'
            }, 300);
        }
    );
});