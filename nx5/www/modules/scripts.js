function switchMenu(menuId) {
  document.getElementById("ss0").style.display = "none";
  document.getElementById("ss1").style.display = "none";
  document.getElementById("ss2").style.display = "none";
  document.getElementById("ss3").style.display = "none";
  document.getElementById("sbody").style.display = "none";
  document.getElementById(menuId).style.display = "block";	
}