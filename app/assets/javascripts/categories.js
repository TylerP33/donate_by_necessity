$(document).ready(function () {

  $(".js-more").click(function() {
    $.get("/categories.json", function(category) {
        category.forEach(function (obj) {
        $("#id").append(obj.id);
        $("#toiletPaper").append(obj.toilet_paper);
        $("#diapers").text(obj.diapers);
        $("#firstAid").text(obj.first_aid);
        $("#generalHygiene").text(obj.general_hygiene);
        $("#underwearSocks").text(obj.underwear_socks);
        $("#dentalHygiene").text(obj.dental_hygiene);
        $("#blankets").text(obj.blankets);
        $("#schoolSupplies").text(obj.school_supplies);
      });
    });
  });
});