$(document).ready(function () {

  $(".js-next-recipient").click(function() {
  	const recipientId = parseInt($(this).attr("data-id"));
  	console.log(recipientId);
    $.get("/recipients/"+recipientId+"/next", function(recipient) {
    	$("#firstName").text(recipient["first_name"]);
    	$("#lastName").text(recipient["last_name"]);
    	$("#location").text(recipient["location"]);
        $("#gender").text(recipient["gender"]);
        $("#personalNotes").text(recipient["personal_notes"]);
        $(".js-next-recipient").attr("data-id", recipient["id"]);
        });
    });


  $(".js-show-category").one('click', function() {
    const categoryId = parseInt($(this).attr("data-id"))
    console.log(categoryId);
     $.get("/recipients/"+categoryId+".json", function(recipient) {
           const html = "<tr><td>"+recipient["category"]["id"]+"</td><td>"+"$"+recipient["category"]["toilet_paper"]+"</td><td>"+"$"+recipient["category"]["diapers"]+"</td><td>"+"$"+recipient["category"]["dental_hygiene"]+"</td><td>"+"$"+recipient["category"]["first_aid"]+"</td><td>"+"$"+recipient["category"]["general_hygiene"]+"</td><td>"+"$"+recipient["category"]["underwear_socks"]+"</td><td>"+"$"+recipient["category"]["blankets"]+"</td><td>"+"$"+recipient["category"]["school_supplies"]+"</td></tr>"
           $("#recipientDonations").find('tbody').append(html);
            });
        });
    });


