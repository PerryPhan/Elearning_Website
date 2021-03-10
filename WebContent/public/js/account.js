$(function(){
  $("button#sendCode").click(function(e){
    e.preventDefault();
    var username = $("input#username").val().trim();
    $.ajax({
      type:"POST",
      url:"./gencode.htm",
      data:{
        username: username
      },
      success: (d) => {
        alert(d);
      }
    })
  });
})