function validateForm()
{
first_name = myForm.first_name.value;
if(first_name == null || first_name == "")
{
	alert("Please enter the Applicant's first name");
	return false;
}

mobile_number = myForm.mobile_number.value;
if(mobile_number == null || mobile_number == "")
{
	alert("Please enter Mobile Number");
	return false;
}

mobile_number2 = myForm.mobile_number2.value;
if(mobile_number2 == null || mobile_number2 == "")
{
	alert("Please enter Mobile Number");
	return false;
}

if(mobile_number != mobile_number2)
{
	alert("please enter same Mobile Number twice");
	return false;
}

email = myForm.email.value;
if(email == null || email == "")
{
	alert("Please enter Email");
	return false;
}

email2 = myForm.email2.value;
if(email2 == null || email2 == "")
{
	alert("Please enter Confirm Email");
	return false;
}

if(email != email2)
{
	alert("Please enter same Email twice");
	return false;
}

account_number = myForm.account_number.value;
if(account_number == null || account_number == "")
{
	alert("Please enter Account Number");
	return false;
}

account_number2 = myForm.account_number2.value;
if(account_number2 == null || account_number2 == "")
{
	alert("Please enter Confirm Account Number");
	return false;
}

if(account_number != account_number2)
{
	alert("Please enter same Account Number twice");
	return false;
}

if(!myForm.tos.checked)
{
	alert("Please accept the terms of service")
}


}