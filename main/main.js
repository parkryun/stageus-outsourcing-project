function calendarUpdate() {
    var textarea = document.getElementById("textarea")
    textarea.className = 'schedule_content'

    document.getElementById('schedule_content_box').appendChild(textarea)

}

function calendarRemove() {
    if(!confirm("삭제하시겠습니까?")) {
        location.href="../main/main.jsp"
    }
    else {
        alert("일정 삭제")
        location.href="../calendar/calendar_remove.jsp"
    }
}

function animation() {
    $(".left_sub_menu").hide();
    $(".has_sub").click(function () {
        $(".left_sub_menu").fadeToggle(300);
    });
    // 왼쪽메뉴 드롭다운
    $(".sub_menu ul.small_menu").hide();
    $(".sub_menu ul.big_menu").click(function () {
        $("ul", this).slideToggle(300);
    });
    // 외부 클릭 시 좌측 사이드 메뉴 숨기기
    $('.overlay').on('click', function () {
        $('.left_sub_menu').fadeOut();
        $('.hide_sidemenu').fadeIn();
    });
};