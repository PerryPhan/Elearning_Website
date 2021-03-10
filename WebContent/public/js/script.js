$(function(){
  // Audio Control
  const audio = document.querySelector("audio");
  var start = undefined;
  var csId = undefined;
  
  audio.load();
  $("#play").click(function(){
    if (audio.src.trim() !== ""){
      if ($(this).attr("role") === "pausing"){
        $(this).attr("role","playing").text("Pause");
        audio.play();
      }
      else if ($(this).attr("role") === "playing"){
        $(this).attr("role","pausing").text("Play");
        audio.pause();
      }
    }
  });
  
  audio.onplaying = function(){
    start = setInterval(function(){
      let percent = (audio.currentTime / audio.duration) * 100;
      $("#current").css("width",`${percent}%`);
      let min = Math.floor(audio.currentTime / 60);
      let sec = Math.floor(audio.currentTime) % 60;
      if (sec < 10) $("#current-time").text(`${min}:0${sec}`);
      else $("#current-time").text(`${min}:${sec}`);
    },1000);
  }
  
  audio.onended = function(){
    $(this).attr("role","pausing").text("Play");
  }

  // Choose a song and play it
  $("div[role='choose']").click(function(){
    console.log($(this).attr("link"));
    $("#play").attr("role","playing").text("Pause");
    audio.setAttribute("src",`music_src/${$(this).attr("link")}`);
    audio.load();
    audio.play();
    audio.onloadedmetadata = () => {
      $("#duration").text(`${Math.floor(audio.duration/60)}:${Math.floor(audio.duration) % 60 < 10 ? "0"+Math.floor(audio.duration) % 60:Math.floor(audio.duration) % 60}`);
      $("#audioName").text($(this).attr("name"));
      $("#audioSinger").text($(this).attr("singer"));
    };
  });

  $(".line").click(function(e){
    if (audio.src.trim() !== ""){
      var currPercent = e.offsetX / $(this).width();
      audio.currentTime = audio.duration * currPercent;
    }
  })

  // Add song to love playlist
  $("div[role='love']").click(function(){
    const songId = $(this).siblings("div.title").attr("song-id");
    console.log(songId);
    $.ajax({
      type:"POST",
      url:"./addtolovepl.htm",
      data:{
        songId:songId
      },
      success: (d) => {
        console.log(d);
        var infor = $(this).siblings("div[role='choose']");
        if (d.trim() === "true"){ // add
          $(this).css("filter","invert(13%) sepia(92%) saturate(7237%) hue-rotate(360deg) brightness(103%) contrast(106%)");
          $("#lovePlaylist").append(
            `<li>
              <div name="${infor.attr("name") }" singer="${infor.attr("singer") }" role="choose" songId="${infor.attr("song-id")}" class="item" link="${infor.attr("link") }">
                <div class="play-icon">
                  <img src="./public/img/play.png"/>
                </div>
                <div class="infor">
                  <div class="name">${infor.attr("name") }</div>
                  <div class="singer">${infor.attr("singer") }</div>
                </div>
              </div>
            </li>`
          )
          $("div[role='choose']").click(function(){
            console.log($(this).attr("link"));
            $("#play").attr("role","playing").text("Pause");
            audio.setAttribute("src",`music_src/${$(this).attr("link")}`);
            audio.load();
            audio.play();
            audio.onloadedmetadata = () => {
              $("#duration").text(`${Math.floor(audio.duration/60)}:${Math.floor(audio.duration) % 60 < 10 ? "0"+Math.floor(audio.duration) % 60:Math.floor(audio.duration) % 60}`);
              $("#audioName").text($(this).attr("name"));
              $("#audioSinger").text($(this).attr("singer"));
            };
          });
        }
        else if(d.trim() === "false"){ // remove
          $(this).css("filter","invert(99%) sepia(57%) saturate(2%) hue-rotate(25deg) brightness(108%) contrast(100%)");
          $(`ul#lovePlaylist li div.item[songId='${$($(this).siblings('div.title')).attr("song-id")}']`).parent().remove();
        }
      }
    });
  });

  // Mouse over 
  let accNav = $("#acc-nav");
  if (accNav.length > 0){
    accNav.mouseenter(function(e){
      $(this).find(".ul-c-1").css("display","block");
    })
    .mouseleave(function(e){
      $(this).find(".ul-c-1").css("display","none");
    })
  }

  // Create new playlist
  $("#add-pl").click(function(){
    let plName = prompt("Nhập tên playlist: ").trim();
    let addBtn = $(this);
    if (plName.length != 0){
      $.ajax({
        type:"POST",
        url:"./newplaylist.htm",
        data:{
          plName: plName
        },
        success: d => {
          console.log(d);
          let dA = d.split(/;/g);
          $(
            `<tr pl-id="${dA[1]}">
              <td class="pl-name"><a href="./playlist.htm?plId=${dA[1]}">${dA[0]}</a></td>
              <td id="update-pl" class="bg-success">Sửa tên</td>
              <td id="del-pl" role="del-pl" class="bg-danger">Xóa</td>
            </tr>`
          ).insertBefore(document.getElementById("add-pl"));
          $("td#update-pl").click(function(){
            let newName = prompt("Nhập tên mới: ").trim();
            $.ajax({
              type:"POST",
              url:"./changeplaylistname.htm",
              data:{
                newName:newName,
                plId:$(this).parent().attr("pl-id")
              },
              success: (d) => {
                $(this).siblings("td.pl-name").children("a").text(d);
              }
            })
          });
          $("td#del-pl").click(function(){
            let plId = $(this).parent().attr("pl-id");
            $.ajax({
              type:"POST",
              url:"./delplaylist.htm",
              data:{
                plId: plId
              },
              success: d => {
                console.log(d);
                $(this).parent().remove();
              }
            })
          });
        }
      });
    }
  });

  // Update the name of selected playlist
  $("td#update-pl").click(function(){
    let newName = prompt("Nhập tên mới: ").trim();
    if (newName.length !== 0){
      $.ajax({
        type:"POST",
        url:"./changeplaylistname.htm",
        data:{
          newName:newName,
          plId:$(this).parent().attr("pl-id")
        },
        success: (d) => {
          $(this).siblings("td.pl-name").children("a").text(d);
        }
      })
    }
  });
  
  // Delete a exist playlist
  $("td#del-pl").click(function(){
    let plId = $(this).parent().attr("pl-id");
    $.ajax({
      type:"POST",
      url:"./delplaylist.htm",
      data:{
        plId: plId
      },
      success: d => {
        console.log(d);
        $(this).parent().remove();
      }
    })
  });

  // Open the playlist box to choose what playlist we will add the song in
  $("div#openPl").click(function(){
    console.log("open");
    $("#boxPl").css("display","block");
    $(".song-list").css("display","none");
    csId = $(this).siblings("div.title").attr("song-id");
    console.log(csId);
    $.ajax({
      type:"POST",
      url:"./openboxpl.htm",
      data:{
        songId:csId
      },
      success: function(d){
        $("div#boxPl select").html("");
        if (d.trim() !== ""){
          d = d.split(/;/g);
          for(let i = 0; i < d.length - 1; i++){
            let pl = d[i].split(":");
            $("div#boxPl select").append(
              `<option plId='${pl[0]}' value='${pl[0]}'>${pl[1]}</option>`
            )
            console.log(pl);
          }
        }
      }
    })
  })

  // Close that playlist box
  $("button#closePlBox").click(function(){
    $("#boxPl").css("display","none");
    $(".song-list").css("display","block");
  })

  // Add the song to selected playlist
  $("button#add2selectPl").click(function(){
    $("#boxPl").css("display","none");
    $(".song-list").css("display","block");
    console.log(csId);
    $.ajax({
      type:"POST",
      url:"./addtopl.htm",
      data:{
        songId: csId,
        plId: $("div#boxPl select").val()
      },
      success: function(d){
        if (d === "stop") alert("Không có playlist để add !");
        else console.log(d);
        $("div#boxPl select").html("");
      }
    })
  })

  // Remove the song from the selected playlist
  $("div[role='remove-s']").click(function(){
    const songId = $(this).siblings("div.title").attr("song-id");
    $.ajax({
      type:"POST",
      url:"./delsongfrompl.htm",
      data:{
        songId:songId,
        plId: $("div.song-list").attr("plId")
      },
      success: d => {
        console.log(d);
        $(this).parent().parent().remove();
      }
    })
  })

  

})