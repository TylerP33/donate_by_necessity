$(document).ready(function () {

$(function () {
    $("form").submit(function(catRec) {
      //prevent form from submitting the default way
    
      const values = $(this).serialize();

      const form = $.post('/categories', values);

      form.done(function(data) {
        console.log(data);
        $("#hello").text("suck it")
      })
    });
  });






// "NEXT" recipient formatting

  $(".js-next-recipient").click(function() {
  	const recipientId = parseInt($(this).attr("data-id"));
    $.get("/recipients/" + recipientId + "/next", function(rec) {
      const recipient = new Recipient(rec)
    	const recHTML = recipient.formatRecipients()
        });
    });

  function Recipient(recipient) {
      this.id = recipient.id
      this.first_name = recipient.first_name
      this.last_name = recipient.last_name
      this.location = recipient.location
      this.gender = recipient.gender
      this.personal_notes = recipient.personal_notes
    }

    Recipient.prototype.formatRecipients = function () {
      $("#firstName").text(this.first_name);
      $("#lastName").text(this.last_name);
      $("#location").text(this.location);
      $("#gender").text(this.gender);
      $("#personalNotes").text(this.personal_notes);
      $(".js-next-recipient").attr("data-id", this.id);
    }

// "has_many" relationship - shows a Recipients category!

    $(".js-show-category").one('click', function() {
    const categoryId = parseInt($(this).attr("data-id"));
     $.get("/recipients/" + categoryId + ".json", function(cat) {
      const category = new RecipientCategory(cat)
      const catHTML =  category.formatRecipientsCategory()
      $("#recipientDonations").find('tbody').append(catHTML);
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

