$(function () {
    
  $(".js-more").on("click", function() {
    $.get("/categories.json"), function(data) {
        $(".id").text(data["id"]);
        $(".toiletPaper").text(data["toilet_paper"]);
        $(".diapers").text(data["diapers"]);
        $(".firstAid").text(data["first_aid"]);
        $(".generalHygiene").text(data["general_hygiene"]);
        $(".underwearSocks").text(data["underwear_socks"]);
        $(".dentalHygiene").text(data["dental_hygiene"]);
        $(".blankets").text(data["blnakets"]);
        $(".schoolSupplies").text(data["school_supplies"]);
    }
});