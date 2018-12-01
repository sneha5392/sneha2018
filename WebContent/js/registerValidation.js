function validateFormOnSubmit(theForm) {
var reason = "";

  reason += validateUsername(theForm.fname);
  reason += validateLastname(theForm.lname);
  reason += validateAddress(theForm.address);
  reason += validateState(theForm.checkState);
  reason += validatePhone(theForm.phone);
  reason += validateRole(theForm.checkRole);
  reason += validateBirthDate(theForm.birthdate);
  reason += validateMail(theForm.mail);
  reason += validatePassword(theForm.Password);
  reason += validateCheckPass(theForm.repass,theForm.pass);
  //alert("hello1");
  
  
  
 // reason += validateEmpty(theForm.from);
    // alert(reason); 
  if (reason != "") {
    //alert("Some fields need correction:\n" + reason);
    document.getElementById("errBox1").innerHTML=reason;
    return false;
  }else{
  //alert("All fields are filled correctly");
  return true;
  }
}
function validateEmpty(fld) {
    var error = "";
 
    if (fld.value.length == 0) {
        fld.style.background = 'Yellow'; 
        error = "The required field is Empty.\n";
    } else {
        fld.style.background = 'White';
    }
    return error;  
}
function validateBirthDate(fld) {
    var error = "";
 
    if (fld.value.length == 0) {
        fld.style.background = 'Yellow'; 
        error = "Enter birth date.<br />";
    }else if (fld.value == "") {
        fld.style.background = 'Yellow'; 
        error = "Enter birth date.<br />";
    }  else {
        fld.style.background = 'White';
    }
    return error;  
}
function validateUsername(fld) {
    var error = "";
    var illegalChars = /^[a-zA-Z]*$/; // allow letters
   
   //alert(illegalChars.test(fld.value));
    
    if (fld.value == "") {
        fld.style.background = 'Yellow'; 
        error = "Enter UserName.<br />";
    } else if ((fld.value.length < 2) || (fld.value.length > 15)) {
        fld.style.background = 'Yellow'; 
        error = "Length of Username is incorrect.<br />";
    } else if (!illegalChars.test(fld.value)) {
        fld.style.background = 'Yellow'; 
        error = "Username contains illegal characters.<br />";
    } else {
        fld.style.background = 'White';
    }
    return error;
}
function validateLastname(fld) {
    var error = "";
    var illegalChars = /^[a-zA-Z]*$/; // allow letters
 
    if (fld.value == "") {
        fld.style.background = 'Yellow'; 
        error = "Enter LastName.<br />";
    } else if ((fld.value.length < 2) || (fld.value.length > 15)) {
        fld.style.background = 'Yellow'; 
        error = "Length of Lastname is incorrect.<br />";
    } else if (!illegalChars.test(fld.value)) {
        fld.style.background = 'Yellow'; 
        error = "Lastname contains illegal characters.<br />";
    } else {
        fld.style.background = 'White';
    }
    return error;
}
function validateAddress(fld) {
    var error = "";
    var illegalChars = /^[a-zA-Z0-9-_  ]+$/; // allow letters, numbers, and underscores
 
    if (fld.value == "") {
        fld.style.background = 'Yellow'; 
        error = "Enter Address.<br />";
    } else if ((fld.value.length < 5) || (fld.value.length > 30)) {
        fld.style.background = 'Yellow'; 
        error = "Length of Address is incorrect.<br />";
    } else if (!illegalChars.test(fld.value)) {
        fld.style.background = 'Yellow'; 
        error = "Address contains illegal characters.<br />";
    } else {
        fld.style.background = 'White';
    }
    return error;
}
function validatePassword(fld) {
    var error = "";
    var illegalChars = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/; // at least one number, one lowercase and one uppercase letter
    // at least six characters

 
    if (fld.value == "") {
        fld.style.background = 'Yellow';
        error = "Enter Password.<br />";
    } /* else if ((fld.value.length < 7) || (fld.value.length > 15)) {
        error = "The password length should be more than 7. <br />";
        fld.style.background = 'Yellow';
    } */ else if (!illegalChars.test(fld.value)) {
        error = "Password should contain atleast one number, one lowercase, one uppercase and min length should be six characters<br />";
        fld.style.background = 'Yellow';
    } /* else if (!((fld.value.search(/(a-z)+/)) && (fld.value.search(/(0-9)+/)))) {
        error = "The password must contain at least one number.<br />";
        fld.style.background = 'Yellow';
    } */ else {
        fld.style.background = 'White';
    }
   return error;
}  
function trim(s)
{
  return s.replace(/^\s+|\s+$/, '');
}
function validateMail(fld) {
    var error="";
   // alert("hello");
    var tfld = trim(fld.value);                        // value of field with whitespace trimmed off
    //var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/ ;
   // var emailFilter=/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
   var emailFilter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/ ;
   
    if (fld.value == "") {
        fld.style.background = 'Yellow';
        error = "Enter email address.<br />";
    } else if (!emailFilter.test(tfld)) {              //test email for illegal characters
        fld.style.background = 'Yellow';
        error = "Please enter a valid email address.<br />";
    } else if (fld.value.match(illegalChars)) {
        fld.style.background = 'Yellow';
        error = "Email address contains illegal characters.<br />";
    } else {
        fld.style.background = 'White';
    }
    return error;
}
function validatePhone(fld) {
    var error = "";
    //var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');    
    var phoneFilter = /^[0-9]+$/ ;
   // alert(phoneFilter.test(fld.value));
   if (fld.value == "") {
        error = "Enter phone number.<br />";
        fld.style.background = 'Yellow';
    } 
   	else if (!phoneFilter.test(fld.value)) {              
       fld.style.background = 'Yellow';
       error = "Phone number should contain only digits.<br />";
   }/*else if (isNaN(parseInt(stripped))) {
        error = "The phone number contains illegal characters.<br />";
        fld.style.background = 'Yellow';
    }*/ else if (!(fld.value.length == 10)) {
        error = "Length of phone number should be 10.<br />";
        fld.style.background = 'Yellow';
    }
    else {
        fld.style.background = 'White';
    }
    return error;
}
function validateState(fld) {
	var error = "";
	var e = document.getElementById("checkState");
	var strUser = e.options[e.selectedIndex].value;

  //  var strUser1 = e.options[e.selectedIndex].text;
    if(strUser==-1)
    {
    	fld.style.background = 'Yellow';
    	error = "Select State<br />";
       // alert("Please select a user");    
    }
    else {
        fld.style.background = 'White';
    }
	return error;
}
function validateRole(fld) {
	var error = "";
	var e = document.getElementById("checkRole");
	var strUser = e.options[e.selectedIndex].value;

  //  var strUser1 = e.options[e.selectedIndex].text;
    if(strUser==-1)
    {
    	fld.style.background = 'Yellow';
    	error = "Select role<br />";
       // alert("Please select a user");    
    }
    else {
        fld.style.background = 'White';
    }
	return error;
}

function validateCheckPass(fld,fld1) {
	var error = "";
	
	if (fld.value == "") {
        error = "Enter re password.<br />";
        fld.style.background = 'Yellow';
    }
	else if(fld.value!=fld1.value)
    {
    	fld.style.background = 'Yellow';
    	error = "Password and Re Password does not match.<br />";
       // alert("Please select a user");    
    }
    else {
        fld.style.background = 'White';
    }
	return error;
}
