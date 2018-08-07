$(() => {

  // Uses Cat.all (index resource) to display all donations on total_user_donations route

  $(".js-all-donations").one('click', function() {
    $.get("/categories.json", (categories) => {

      categories.sort(function(a, b) {
          // if (a.first_aid > b.first_aid )
            // return -1

    // -1 = a goes first if larger
          // if (a.first_aid < b.first_aid )
            // return 1
            return b.first_aid - a.first_aid

        })

    //non-stack overflow answer that I came up with


    // categories.sort(function(a, b) {
    //    return a.first_aid - b.first_aid
    //  })

      categories.forEach(function (cat) {
            const newCategory = new Category(cat)
            const categoryHTML = newCategory.formatCategories()
            $("#totalDonationTable").find('tbody').append(categoryHTML);
            });
        });
    });

  function Category(category) {
        this.id = category.id
        this.toiletPaper = category.toilet_paper
        this.diapers = category.diapers
        this.dentalHygiene = category.dental_hygiene
        this.firstAid = category.first_aid
        this.generalHygiene = category.general_hygiene
        this.underwearSocks = category.underwear_socks
        this.blankets = category.blankets
        this.schoolSupplies = category.school_supplies
    }

  Category.prototype.formatCategories = function() {
         const html = 

           "<tr><td>" + this.id +
           "</td><td>" + "$" + this.toiletPaper +
           "</td><td>" + "$" + this.diapers +
           "</td><td>" + "$" + this.dentalHygiene +
           "</td><td>" + "$" + this.firstAid +
           "</td><td>" + "$" + this.generalHygiene +
           "</td><td>" + "$" + this.underwearSocks +
           "</td><td>" + "$" + this.blankets +
           "</td><td>" + "$" + this.schoolSupplies +
           "</td></tr>"

            return html
    }

     $(".js-first-aid-only").one('click', function() {
    $.get("/categories.json", (categories) => {
      console.log(categories);
         const cat = categories.filter(cat => cat.first_aid > 0 )
         cat.forEach(function(cat) {
            const newFirstAid = new Category(cat)
            const categoryHTML = newFirstAid.formatCategories()
            $("#firstAidOnly").find('tbody').append(categoryHTML);
      });
    });
  });
});





    
