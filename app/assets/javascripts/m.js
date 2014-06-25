/**
 * Created by beta on 24.06.14.

$(document).ready(function(){
    $(".prev").click(function(){
        $.ajax({
            url:'/images/prevPicture',
            type :'GET',
            data :{},
            success:function(){
                location.reload();
            }

        });

    })
    $( ".next" ).click(function() {
        $.ajax({
            url:'/images/nextPicture',
            type :'GET',
            data :{},
            success:function(){

                location.reload();
            }
        });
    });
    $(".showImages").click(function(){
        var color1 = document.getElementById('color1').color;
        var color2 = document.getElementById('color2').color;
        var min = document.getElementById("checkbox").checked? 0 : -1;
        var max = document.getElementById("checkbox").checked? 0 : 1;
        $.ajax({
            url:'/images',
            type :'GET',
            data :{h1 :color1.hsv[0]*60,
                s1 :color1.hsv[1]*100,v1 :color1.hsv[2]*100,
                h2 :color2.hsv[0]*60,s2 :color2.hsv[1]*100,
                v2 :color2.hsv[2]*100,min :min,max :max},
            success:function(){
                location.assign('/images/');
               // alert(document.getElementById("checkbox").checked)

            }

        });
    })
});
 */