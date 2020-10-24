$(document).ready(function() {
    $("#news-slider").owlCarousel({
        items:2,
        itemsDesktop:[1199,2],
        itemsDesktopSmall:[980,2],
        itemsMobile:[600,1],
        pagination:false,
        navigationText:false,
        autoPlay:true
    });

    var $subblock = $(".subpage"), $head=$subblock.find('h2'), $ul = $("#proinfo"), $lis = $ul.find("li"), inter=false;

    $head.click(function(e){
        e.stopPropagation();
        if(!inter){
            $ul.show();
        }else{
            $ul.hide();
        }
        inter=!inter;
    });

    $ul.click(function(event){
        event.stopPropagation();
    });

    $(document).click(function(){
        $ul.hide();
        inter=!inter;
    });

    $lis.hover(function(){
        if(!$(this).hasClass('nochild')){
            $(this).addClass("prosahover");
            $(this).find(".prosmore").removeClass('hide');
        }
    },function(){
        if(!$(this).hasClass('nochild')){
            if($(this).hasClass("prosahover")){
                $(this).removeClass("prosahover");
            }
            $(this).find(".prosmore").addClass('hide');
        }
    });


    var page =1;
    $("#pageTxT").text(page);
    var pageSize = 10;
    var goodstype_id = 6;
    var pageMax;
    $("#last").click(function (){
        if (page>1){
            page --;
            $("#pageTxT").text(page);
            loadTheGoods();

        }
    })

    $("#next").click(function (){

        if (page < pageMax){
            page ++;
            $("#pageTxT").text(page);
            loadTheGoods();

        }
    })
    loadType();
    loadNotices();
    loadTheGoods();
    loadCount();
    function loadCount() {
        $.ajax({
            url:"index/getCount.do",
            data:{'goodstype_id':goodstype_id},
            type:"post",
            success:function (data){
                $(".countAll span").text(data);
                pageMax = Math.ceil(data/pageSize);
            }
        })
    }

    function loadTheGoods(){
        $.ajax({
            url:"index/showGoods.do",
            data:{"goodstype_id":goodstype_id,"pageNum":page,"pageSize":pageSize},
            type:"post",
            success:function (data){
                for (var i = 0;i < 10;i++){
                    $("#row .pic-1").eq(i).attr('src',"");
                    $("#row .title").eq(i).children('a').text('暂时没有商品');
                    $("#row .price").eq(i).html('￥ '+'0.00'+'  <span>"￥ "'+'0.00'+'</span>');
                    $("#row .product-image").eq(i).children('a').attr('href','javascript:;');
                    $("#row .social").eq(i).children("li").children("a").attr('href','javascript:;');
                }
                $.each(data,function (i,n){
                    var imPath = n.gpicture;
                    $("#row .product-image").eq(i).children('a').attr('href','goodsDetail.do?id='+n.id);
                    $("#row .pic-1").eq(i).attr('src',basePath+"/statics/images/"+imPath);
                    $("#row .title").eq(i).children('a').text(n.gname);
                    $("#row .price").eq(i).html('￥ '+n.grprice+'  <span>"￥ "'+n.goprice+'</span>');
                    $("#row .social").eq(i).children("li").children("a").attr('href','goodsDetail.do?id='+n.id);

                })
            }
        })
    }
    //获取basePath
    var local =window.location;
    var contextPath = local.pathname.split('/')[1];
    var basePath = local.protocol+"//"+local.host+"/"+contextPath;
    console.log(basePath);
    function loadNotices(){
        $.ajax({
            url:"index/getNotices.do",
            type:"post",
            success:function (data){
                $.each(data,function (i,n){
                    $("#notices table").append("<tr class='notice-txt'>" +
                        "<td><a href='index/showNotice.do?title="+n.ntitle+"'>" +
                        "<span class='notice-news'>*news</span>&nbsp;&nbsp;"+
                        "<span class='nTitle'>"+n.ntitle+"</span></a></td>" +
                        "</tr>")
                })
            }
        })
    }

    function loadType(){

        $.ajax({
            url:"index/getType.do",
            dataType:"json",
            type:"post",
            success:function (data){
                $.each(data,function (i,n){
                    $(".navbar").append("<a href='javascript:;' class='navl'>"+n.typename+"</a>");
                })
            }
        })
    }
    $(".navbar").on("click",".navl",function (){
        $(this).click(function (){
            $.ajax({
                url:"index/changeType.do",
                data:{"typename":$(this).text()},
                dataType:"json",
                type:"post",
                success:function (data){
                    goodstype_id = data;
                    page = 1;
                    $("#pageTxT").text(page);
                    loadTheGoods();
                    loadCount();
                }
            })
        })
    })
    $(".navbar").on('click','a',function (){
        $(this).siblings('a').removeClass('current');
        $(this).addClass('current');
    })
    function pdLogin(){
        var userEmail = null;
        $.ajax({
            url:"index/textLg.do",
            success:function (data){
                userEmail = data["userEmail"];
                $(".navbar .navbt1").remove();
                $(".navbar .navbt2").remove();
                $(".navbar .navbt3").remove();
                $(".navbar .navbt4").remove();
                if(userEmail!=null){
                    $(".navbar .navbt").remove();
                    var userspan = '<span class="navbt1">用户:'+userEmail+'</span>';
                    var back = '<a class="navbt2" href="backLogin.do">退出登录</a>';
                    var Icenter = '<a class="navbt3" target="_blank" href="userCenter.do">个人中心</a>';
                    var cartY = '<a class="navbt4"  href="GoCart.do">购物车</a>';
                    $(".navbar").prepend(userspan);
                    $(".navbar").prepend(Icenter);
                    $(".navbar").append(back);
                    $(".navbar").prepend(cartY);
                }else{
                    $(".navbar .navbt1").remove();
                    var userspan = '<a class="navbt" href="index/login"><span>登录/注册</span></a>';
                    $(".navbar").prepend(userspan);
                }
            }
        })
    }
    pdLogin();
});