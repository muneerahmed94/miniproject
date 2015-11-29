$(document).ready(function (){
	var validator = $("#login-form").bootstrapValidator({
		fields: {
			email: {
				message: "Enter a valid Email address",
				validators: {
					notEmpty: {
					
					},
					emailAddress: {
					
					}
				}
			},
			password: {
				validators: {
					notEmpty: {
					
					},
					stringLength: {
						min: 6,
						max: 14,
						message: "Password must be 6-14 characters long"
					}
				}
			}
		}
	});
});
	