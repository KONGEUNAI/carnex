$(function() {
    $('ul.tab li').click(function() {
        var activeTab = $(this).attr('data-tab');
        $('ul.tab li').removeClass('on');
        $('.tab-content').removeClass('on');
        $(this).addClass('on');
        $('#' + activeTab).addClass('on');
    })
});