function validateDelete()
{
	if(myForm.benificiary_account_number == null)
	{
		return false;
	}
	var benificiary_account_number = myForm.benificiary_account_number.value;
	if(benificiary_account_number == "")
	{
		alert("Select a benificiary to delete");
		return false;
	}
	var response = confirm("Are you sure you want to delete the selected benificiary? This action cannot be undone");
	if (response == true) 
	{
		return true;
	} 
	else 
	{
		return false;
	}
}