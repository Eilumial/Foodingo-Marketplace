//A function is run if it is:
//        1. The page is refreshed
//        2. The keyup is run (user types onto the input text box)
$(document).ready(function() { // Prepare the document to ready all the dom functions before running this code
     searchsuppliername();
     searchingredient();
});
$("#searchsupplierbyname").keyup(function() {
    searchsuppliername();
});
$("#searchingredient").keyup(function() {
   searchingredient();
});

function searchsuppliername(){
    //split the current value of searchInput
    var data = $("#searchsupplierbyname").val().split();
    //create a jquery object of the rows
    var rowData = $(".supplier");
    if ($("#searchsupplierbyname").val() == "") {
        rowData.hide();
        return;
    }
    //hide all the rows
    rowData.hide();

    //Recusively filter the jquery object to get results.
    rowData.filter(function(index) {
        var $filterText = $(this);
        for (var datum = 0; datum < data.length; ++datum) {
            if ($filterText.text().toLowerCase().indexOf(data[datum].toLowerCase()) > -1) {
                return true;
            }
        }
        return false;
    })
            //show the rows that match.
            .show();
}

function searchingredient(){
     //split the current value of searchInput
    var data = $("#searchingredient").val().split(" ");
    //create a jquery object of the rows
    var rowData = $(".ingredient");
    if ($("#searchingredient").val() == "") {
        rowData.hide();
        return;
    }
    //hide all the rows
    rowData.hide();

    //Recusively filter the jquery object to get results. 
    rowData.filter(function(index) {
//        Filter the text only based on the div content
        var $filterText = $(this).children("div.content-itemname");
        for (var datum = 0; datum < data.length; ++datum) {
            if ($filterText.text().toLowerCase().indexOf(data[datum].toLowerCase()) > -1) {
                return true;
            }
        }
        return false;
    })
            //show the rows that match.
            .show();
}
