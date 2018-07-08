$(document).ready(function () {

  $(".js-next-recipient").click(function() {
  	const recipientId = parseInt($(this).attr("data-id"));
    $.get("/recipients/" + recipientId + "/next", function(recipient) {
    	$("#firstName").text(recipient["first_name"]);
    	$("#lastName").text(recipient["last_name"]);
    	$("#location").text(recipient["location"]);
      $("#gender").text(recipient["gender"]);
      $("#personalNotes").text(recipient["personal_notes"]);
      $(".js-next-recipient").attr("data-id", recipient["id"]);
        });
    });
  

    $(".js-show-category").one('click', function() {
    const categoryId = parseInt($(this).attr("data-id"));
     $.get("/recipients/" + categoryId + ".json", function(rec) {
      const recipient = new RecipientCategory(rec)
      const recHTML =  recipient.formatRecipientsCategory()
      $("#recipientDonations").find('tbody').append(recHTML);
        });
    });

  function RecipientCategory(recipient) {
      this.id = recipient["category"]["id"]
      this.toilet_paper = recipient["category"]["toilet_paper"]
      this.diapers = recipient["category"]["diapers"]
      this.dental_hygiene = recipient["category"]["dental_hygiene"]
      this.first_aid = recipient["category"]["first_aid"]
      this.general_hygiene = recipient["category"]["general_hygiene"]
      this.underwear_socks = recipient["category"]["underwear_socks"]
      this.blankets = recipient["category"]["blankets"]
      this.school_supplies = recipient["category"]["school_supplies"]
    }



    RecipientCategory.prototype.formatRecipientsCategory = function () {
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


