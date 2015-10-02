function validateForm()
{
	first_name = myForm.first_name.value;
	if(first_name == "")
	{
		alert("Please enter the Applicant's first name");
		return false;
	}
	
	father_first_name = myForm.fghfname.value;
	if(father_first_name == "")
	{
		alert("Please enter the Father's first name");
		return false;
	}
		
	dob = myForm.date_of_birth.value;
	if(dob == "")
	{
		alert("Please enter the DOB");
		return false;
	}
	
	gender = myForm.gender.value;
	if(gender == "")
	{
		alert("Please Select Geder");
		return false;
	}
	
	mother_name = myForm.mother_name.value;
	if(mother_name == "")
	{
		alert("Please enter Mother's Name");
		return false;
	}
	
	door_no = myForm.door_no.value;
	if(door_no == "")
	{
		alert("Please enter Door No");
		return false;
	}
	
	
	street = myForm.street.value;
	if(street == "")
	{
		alert("Please enter street/locality");
		return false;
	}
	
	district = myForm.district.value;
	if(district == "")
	{
		alert("Please enter district");
		return false;
	}
	
	state = myForm.state.value;
	if(state == "" || state == "Select")
	{
		alert("Please select State");
		return false;
	}
	
	pincode = myForm.pincode.value;
	if(pincode == "")
	{
		alert("Please enter pincode");
		return false;
	}
	if(!myForm.tos.checked)
	{
		alert("Please accept the terms of service")
	}
	
}