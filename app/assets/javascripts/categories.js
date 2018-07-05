$(document).ready(function () {

  $(".js-more").one('click', function() {
    $.get("/categories.json", function(category) {
        category.forEach(function (cat) {
           const html = "<tr><td>"+cat.id+"</td><td>"+"$"+cat.toilet_paper+"</td><td>"+"$"+cat.diapers+"</td><td>"+"$"+cat.dental_hygiene+"</td><td>"+"$"+cat.first_aid+"</td><td>"+"$"+cat.general_hygiene+"</td><td>"+"$"+cat.underwear_socks+"</td><td>"+"$"+cat.blankets+"</td><td>"+"$"+cat.school_supplies+"</td></tr>"
           $("#totalDonationTable").find('tbody').append(html);
            });
        });
    });
});

    // assigned to id <tds> but above, although uglier, was the first solution
    // I came up with, with regards to a dynamic table
            //$("#id").append(cat.id);
            //$("#toiletPaper").append(cat.toilet_paper);
            //$("#diapers").append(cat.diapers);
            //$("#firstAid").append(cat.first_aid);
            //$("#generalHygiene").append(cat.general_hygiene);
            //$("#underwearSocks").append(cat.underwear_socks);
            //$("#dentalHygiene").append(cat.dental_hygiene);
            //$("#blankets").append(cat.blankets);
            //$("#schoolSupplies").append(cat.school_supplies);

    
