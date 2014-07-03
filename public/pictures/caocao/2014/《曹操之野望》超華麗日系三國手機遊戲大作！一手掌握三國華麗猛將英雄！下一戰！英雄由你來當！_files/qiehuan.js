// JavaScript Document
$(document).ready(function(){
//视频背景二张大图轮播			
		setInterval("changelunbo1()",4500);
//图片banner轮播	
setInterval("changeFocus()",3000);			
	setInterval("changeimg()",3000);
	$(".title>span").mouseover(function(){
	 $(this).siblings().removeClass("hover");
	  $(this).addClass("hover");
	  var index=$(".title>span").index(this);
	  	$(".content_qie>ul>li:visible").hide();
	 $(".content_qie>ul>li").eq(index).show();	
	});
//箭头左右滚动		
	$(".main5_left>a").click(function(){
		var index=$(".main5_middle>ul:visible").index();
		var total=$(".main5_middle>ul").size();
		var prev=(index==0)?total-1:index-1;
		$(".main5_middle>ul:eq("+index+")").hide();   
		$(".main5_middle>ul:eq("+prev+")").fadeIn("slow");
		});
	$(".main5_right>a").click(function(){
		var index=$(".main5_middle>ul:visible").index();
		var total=$(".main5_middle>ul").size();
		var next=(index==total-1)?'0':index+1;
		$(".main5_middle>ul:eq("+index+")").hide();
		$(".main5_middle>ul:eq("+next+")").fadeIn("slow");
		});
//视频左右滚动
var n=0;
var  oMove = $("ul#topa_inbox");
var seep =oMove.find("li").width(); 
var size =  oMove.find("li").size();
oMove.css({width:seep*size});
function movieFun(n){
	var s;
		s =Math.floor(n/4)*4;
		$("ul#topa_inbox").stop(false).animate({
			left:-seep*s
		},100);	
}
	
	$(".main_left>a").click(function(){
		n--;
		if(n<0){n=size-1}
		movieFun(n);
		
		
		var index=$(".main_middle>ul:visible").index();
		var total=$(".main_middle>ul").size();
		var next=(index==0)?total-1:index-1;
		$(".main_middle>ul:eq("+index+")").hide();
		$(".main_middle>ul:eq("+next+")").fadeIn();
		$("#topa_inbox>li>img").css("border","solid 1px #fff");
		$("#topa_inbox>li:eq("+next+")").children("img").css("border","red 1px solid");
		
		
		});
	$(".main_right>a").click(function(){
		n++;
		if(n>size-1){n=0}
		movieFun(n);
		
		
		
       var index=$(".main_middle>ul:visible").index();
		var total=$(".main_middle>ul").size();
		var next=(index==total-1)?'0':index+1;
		$(".main_middle>ul:eq("+index+")").hide();
		$(".main_middle>ul:eq("+next+")").fadeIn();
		$("#topa_inbox>li>img").css("border","solid 1px #fff");
		$("#topa_inbox>li:eq("+next+")").children("img").css("border","red 1px solid");
		
		
		});
	$("#topa_inbox>li").click(function(){
		var index=$(this).index();
		$(this).siblings("li").children("img").css("border","solid 1px #fff");
		$(this).children("img").css("border","red 1px solid");
		$(".main_middle>ul:visible").hide();
		$(".main_middle>ul:eq("+index+")").fadeIn();
		n = index;
		
		
		});	
		
//敬请期待		
	jQuery(".alert").click(function(){
		alert("即將開放，敬請期待！");	
	});	
	jQuery(".alert1").click(function(){
		alert("即將開放，敬請期待！\n吳克羣為《曹操之野望》量身訂作，並親自作詞作曲演唱的遊戲曲！");	
	});
	//视频弹出			

	jQuery(".flash").click(function(){
		var num=jQuery("body").css("height");
		jQuery(".touming").css("height",num);
		jQuery(".touming").show();
		jQuery("#guanbi").show();
		});
	jQuery(".tc_guanbi").click(function(){
		jQuery(".touming").hide();
		jQuery("#guanbi").hide();
		});
		
	jQuery(".alert0").click(function(){
		var num=jQuery("body").css("height");
		jQuery(".touming").css("height",num);
		jQuery(".touming").show();
		jQuery("#guanbi1").show();
		});
	jQuery(".tc_guanbi").click(function(){
		jQuery(".touming").hide();
		jQuery("#guanbi1").hide();
		});	
});
function changelunbo1(){
	var cur=$(".lunbo_ad>ul>li:visible").index();
	var next;
	if(cur<1){next=cur+1;}
	else{next='0';}
	$(".lunbo_ad>ul>li:visible").hide();
	$(".lunbo_ad>ul>li").eq(next).fadeIn();
}
function changeimg(){
	var cur=$(".content_qie>ul>li:visible").index();
	var next;
	if(cur<3){next=cur+1;}
	else{next='0';}
	$(".content_qie>ul>li:visible").hide();
	$(".content_qie>ul>li").eq(next).show();
	$(".hover").removeClass("hover")
	$(".title>span").eq(next).addClass("hover")
}


function changeFocus(){
		var index=$(".main5_middle>ul:visible").index();
		var total=$(".main5_middle>ul").size();
		var next=(index==total-1)?'0':index+1;
		$(".main5_middle>ul:eq("+index+")").hide();
		$(".main5_middle>ul:eq("+next+")").fadeIn("slow");
		
	}

