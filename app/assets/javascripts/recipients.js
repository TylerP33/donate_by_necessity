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
});


