document.addEventListener("turbolinks:load", function () {
    $(function () {
        $('#slide-flash').slideDown('slow'); 

        $('.fa-times').click(function () {
            $('#slide-flash').slideUp('slow');
        });

        $('.new-btn,.header-new-btn').click(function () {
            $('.signup-modal').fadeIn(); 
        });

        $('.login-btn,.header-login-btn').click(function () {
            $('.signin-modal').fadeIn();
        });

        $('.modal-remove').click(function () {
            $('.signup-modal,.signin-modal').fadeOut(); 
        });

        //レスポンシブ

        $('.menu-icon').click(function () {
            $('.menu-list').animate({ 'marginRight': '205px' }, 500);
        });

        $('.menu-title').click(function () {
            $('.menu-list').animate({ 'marginRight': '0px' }, 500);
        });
    });
})