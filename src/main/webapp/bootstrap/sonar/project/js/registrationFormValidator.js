$(document).ready(function (){
	var validator = $("#registration-form").bootstrapValidator({
		fields: {
			fullname: {
				validators: {
					notEmpty: {
						message: "Enter a name"
					}	
				}
			},
			email: {
				message: "Enter a valid Email address",
				validators: {
					notEmpty: {
						
					},
					emailAddress: {
						
					}
				}
			},
			username: {
				validators: {
					notEmpty: {
					
					},
					stringLength: {
						min: 6,
						max: 14,
						message: "Username must be 6-14 characters long"
					}
				}
			},
			password: {
				validators: {
					notEmpty: {
						
					},
					different: {
						field: "email",
						message: "Email and Password must be different"
					},
					stringLength: {
						min: 6,
						max: 14,
						message: "Password must be 6-14 characters long"
					}
				}
			},
			confirmpassword: {
				validators: {
					notEmpty: {
						
					},
					identical: {
						field: "password",
						message: "Confirm Password and Password must be same"
					}
				}
			}
		}
	});
});
	