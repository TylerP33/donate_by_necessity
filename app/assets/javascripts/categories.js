$(document).ready(function () {

  $(".js-all-donations").one('click', function() {
    $.get("/categories.json", function(category) {
        category.forEach(function (cat) {
           const html = 

           "<tr><td>" + cat.id+
           "</td><td>" + "$"+cat.toilet_paper+
           "</td><td>" + "$"+cat.diapers+
           "</td><td>" + "$"+cat.dental_hygiene+
           "</td><td>" + "$"+cat.first_aid+
           "</td><td>" + "$"+cat.general_hygiene+
           "</td><td>" + "$"+cat.underwear_socks+
           "</td><td>" + "$"+cat.blankets+
           "</td><td>" + "$"+cat.school_supplies+
           "</td></tr>"

           $("#totalDonationTable").find('tbody').append(html);
            });
        });
    });
});



    
