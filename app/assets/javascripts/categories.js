$(document).ready(function () {

// Uses Cat.all (index resource) to display all donations on total_user_donations route

  $(".js-all-donations").one('click', function() {
    $.get("/categories.json", function(category) {
        category.forEach(function (cat) {
            const allCategories = new Category(cat)
            const categoryHTML = allCategories.formatCategories()
            $("#totalDonationTable").find('tbody').append(categoryHTML);
            });
        });
    });

  function Category(category) {
        this.id = category.id
        this.toilet_paper = category.toilet_paper
        this.diapers = category.diapers
        this.dental_hygiene = category.dental_hygiene
        this.first_aid = category.first_aid
        this.general_hygiene = category.general_hygiene
        this.underwear_socks = category.underwear_socks
        this.blankets = category.blankets
        this.school_supplies = category.school_supplies
    }

  Category.prototype.formatCategories = function() {
         const html = 

           "<tr><td>" + this.id +
           "</td><td>" + "$" + this.toilet_paper +
           "</td><td>" + "$" + this.diapers +
           "</td><td>" + "$" + this.dental_hygiene +
           "</td><td>" + "$" + this.first_aid +
           "</td><td>" + "$" + this.general_hygiene +
           "</td><td>" + "$" + this.underwear_socks +
           "</td><td>" + "$" + this.blankets +
           "</td><td>" + "$" + this.school_supplies +
           "</td></tr>"

            return html
    }



});





    
