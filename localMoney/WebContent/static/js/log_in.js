/* 변수 선언*/

var id = document.querySelector('#id');
var pw = document.querySelector('#pw');
var btn = document.querySelector('#btn');

$(btn).on("click", function () {
  if ($(id).val() == "") {
    $(id).next("label").addClass("warning");
      setTimeout(function () {
        $("label").removeClass("warning");
      }, 1500);
  } else if ($(pw).val() == "") {
    $(pw).next("label").addClass("warning");
      setTimeout(function () {
        $("label").removeClass("warning");
      }, 1500);
  }
});