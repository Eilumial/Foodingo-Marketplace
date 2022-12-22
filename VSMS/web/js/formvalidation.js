console.log("Form validation js is here");
// When the browser is ready...
$(function() {
    //Add on date rule
    $.validator.addMethod("dateFuture",
            function(value, element) {
                // Assuming value is the date string.
                var date = new Date(value);
                // Create a new date, stripping the time away.
                var today = new Date(new Date().toDateString());
                // Subtracting one date from another gives you the number
                if (date - today > 0 && value.match(/^(0?[1-9]|[12][0-9]|3[0-2])[.,/ -](0?[1-9]|1[0-2])[.,/ -](19|20)?\d{2}$/)) {
                    return true;
                } else {
                    return false;
                }
            },
            "* Please enter a valid date (dd/mm/yyyy)"
            );
    // Setup form validation for adding the dish
    $("#approveOrder").validate({
//        Specify the error and valid styling (red color if error, green color if valid)
        errorClass: "my-error-class",
        validClass: "my-valid-class",
        // Specify the validation rules
        rules: {
            expected_delivery: {
                required: true,
                date: true,
                dateFuture: true
            }
        },
        // Specify the validation error messages
        messages: {
            expected_delivery: "Please enter a proper date",
            lastname: "Please enter your dish description",
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
    // Setup form validation for adding the dish
    $("#addDish").validate({
//        Specify the error and valid styling (red color if error, green color if valid)
        errorClass: "my-error-class",
        validClass: "my-valid-class",
        // Specify the validation rules
        rules: {
            dish_name: "required",
            dish_description: "required",
        },
        // Specify the validation error messages
        messages: {
            dish_name: "Please enter your dish name",
            dish_description: "Please enter your dish description",
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
// Setup form validation for adding the ingredient
    $("#addIngredient").validate({
//        Specify the error and valid styling (red color if error, green color if valid)
        errorClass: "my-error-class",
        validClass: "my-valid-class",
        // Specify the validation rules
        rules: {
            name: "required",
            subcategory: "required",
            quantity: {
                required: true,
                number: true
            },
            supplyUnit: "required",
            description: "required",
            offeredPrice: {
                required: true,
                number: true
            },
        },
        // Specify the validation error messages
        messages: {
            name: "Please enter a valid ingredient name",
            subcategory: "Please enter a valid sub category",
            quantity: "Please enter the correct quantity, number is required",
            supplyUnit: "Please enter the correct unit",
            description: "Please enter the correct description",
            offeredPrice: "Please enter a valid price, number is required",
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
    // Setup form validation for adding the ingredient
    $("#addOrder").validate({
//        Specify the error and valid styling (red color if error, green color if valid)
        errorClass: "my-error-class",
        validClass: "my-valid-class",
        // Specify the validation rules
        rules: {
            name: "required",
            subcategory: "required",
            quantity: {
                required: true,
                number: true
            },
            supplyUnit: "required",
            description: "required",
            offeredPrice: {
                required: true,
                number: true
            },
        },
        // Specify the validation error messages
        messages: {
            name: "Please enter a valid ingredient name",
            subcategory: "Please enter a valid sub category",
            quantity: "Please enter the correct quantity, number is required",
            supplyUnit: "Please enter the correct unit",
            description: "Please enter the correct description",
            offeredPrice: "Please enter a valid price, number is required",
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

    // Setup form validation for logging in
    $("#login").validate({
//        Specify the error and valid styling (red color if error, green color if valid)
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        onsubmit: true,
        errorPlacement: function(error, element) {
            alert(error.text());
        },
        errorClass: "my-error-class",
        validClass: "my-valid-class",
        // Specify the validation rules
        rules: {
            username: "required",
            password: "required",
        },
        // Specify the validation error messages
        messages: {
            username: "Please enter a valid username",
            password: "Please enter a valid password",
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

// Setup form validation for editing profile
    $("#editProfile").validate({
//        Specify the error and valid styling (red color if error, green color if valid)
        errorClass: "my-error-class",
        validClass: "my-valid-class",
        // Specify the validation rules
        rules: {
            email: {
                required: true,
                email: true
            },
            address: "required",
            area_code: {
                required: true,
                number: true
            },
            telephone_number: {
                required: true,
                number: true,
                maxlength: 9,
                minlength: 8
            },
            vendor_description: "required",
        },
        // Specify the validation error messages
        messages: {
            email: "Please enter a valid email address",
            address: "Please enter a valid address",
            area_code: "Please enter a valid area code (numbers only)",
            telephone_number: "Please enter a valid phone number (numbers only/max 9 digits)",
            vendor_description: "Please enter a description",
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
    // Setup form validation for editing profile
    $("#editPassword").validate({
//        Specify the error and valid styling (red color if error, green color if valid)
        errorClass: "my-error-class",
        validClass: "my-valid-class",
        // Specify the validation rules
        rules: {
            old_password: "required",
            new_password: "required",
            new2_password: {
                equalTo: "#new_password"
            }
        },
        // Specify the validation error messages
        messages: {
            old_password: "Please enter your old password properly",
            new_password: "Please enter your new password",
            new2_password: "Please enter the same password as your New Password",
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
});