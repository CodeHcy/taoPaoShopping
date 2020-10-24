<%--
  Created by IntelliJ IDEA.
  User: 28612
  Date: 2020/10/12
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath =   request.getScheme()+
            "://"+
            request.getServerName()+
            ":"+
            request.getServerPort()+
            request.getContextPath()+
            "/";
    String userEmail = (String) request.getSession().getAttribute("userEmail");
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>购物车</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        html{
            background-color: snow;
        }
        body{
            width: 1340px;
            background-color: lavender;
            margin: 0 auto;
        }
        h1{
            text-align: center;
            color: purple;
        }
        .showCart{
            position: relative;
            width: 1110px;
            margin: 0 auto;
        }

        .tbody-cart{
            width: 1110px;

            padding-top: 10px;


        }
        .tbody-cart .cart-box{
            width: 1110px;
            height: 160px;
            background-color: pink;
            border-bottom: purple 2px dashed;
            font-size: 25px;
            color: rebeccapurple;
        }
        .tbody-cart .cart-box span{
            font-size: 30px;
            color: purple;
        }
        .tbody-cart table{
            width: 1110px;
            height: 120px;
        }
        .tbody-cart table img{
            width: 100px;
            height: 100px;
        }
        .tbody-cart table td{
            padding-left: 20px;
            width: 500px;
        }
        .time-notice{
            width: 1110px;
            margin-top: 50px;
            font-size: 30px;
            text-align: right;
            color: rebeccapurple;
        }
        .time-notice span{
            font-size: 20px;
        }
        .btn-ad{
            width:60px;
            height: 30px;
            background-color: plum;
            color: white;
            font-size: 25px;
            margin: 0 10px;
        }
        .btn-ad1{
            width:150px;
            height: 50px;
            background-color: plum;
            color: white;
            font-size: 15px;
            margin-bottom: 10px;
        }
        .check-box{
            width: 20px;
            height: 20px;
            border: deeppink 1px solid;
        }
    </style>
    <script type="text/javascript" src="<%=basePath%>/statics/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        $(function (){
            loadCart();
            $("#Back").click(function (){
                location.href = 'before';
            })
            function loadAllMoney(){
                var AllMoney = 0;
                $("#Cart-table .cart-box").each(function (i,n){
                    if ($(this).find(".check-box").prop("checked")==true){
                        AllMoney+=parseInt($(this).find(".spmoy").text());
                    }
                })
                $("#ZMoy").text(AllMoney);
            }
            function loadCartNum(cartId,sopnum){
                $.ajax({
                    url:'changeCartNum.do',
                    data:{'cartId':cartId,'sopnum':sopnum},
                    type:'post',
                    success:function (){

                    }
                })
            }
            $("#Cart-table").on('click','#addCount',function (){
                var sopnum = parseInt($(this).siblings(".spnum").text());
                var danJia = $(this).parent('td').prevAll().children('ul').children("li").eq(1).children('.Aprice').text();
                    sopnum++;
                $(this).siblings(".spnum").text(sopnum);
                $(this).siblings(".spmoy").text(danJia*sopnum);
                var cartId = $(this).parent("td").parent("tr").find(".delete").attr("name");

                loadCartNum(cartId,sopnum);
                loadAllMoney();

            })
            $("#Cart-table").on('click','#reduceCount',function (){
                var sopnum = parseInt($(this).siblings(".spnum").text());
                var danJia = $(this).parent('td').prevAll().children('ul').children("li").eq(1).children('.Aprice').text();

                if (sopnum>1){
                    sopnum--;
                    $(this).siblings(".spnum").text(sopnum);
                    $(this).siblings(".spmoy").text(danJia*sopnum);
                    var cartId = $(this).parent("td").parent("tr").find(".delete").attr("name");

                    loadCartNum(cartId,sopnum);
                    loadAllMoney();
                }
            })

            function loadCart(){

                $.ajax({
                    url:"loadCart.do",

                    type: 'post',
                    success:function (data){

                        $("#Cart-table").html('');
                        $.each(data,function (i,n){
                            $.ajax({
                                url: "AgoodsDetail.do",
                                data:{"id":n.goodstable_id},
                                type:'post',
                                success:function (dd){


                                    var li ='<li>\n' +
                                        '               <div class="cart-box" ">\n' +
                                        '                        <table >\n' +
                                        '                              <tr>\n' +
                                        '                                  <td colspan="5"><a href="goodsDetail.do?id='+n.goodstable_id+'"><img src="'+'<%=basePath%>'+'statics/images/'+dd.gpicture+'" alt="图片"></a></td>\n' +
                                        '                                  <td>\n' +
                                        '                                       <ul>\n' +
                                        '                                           <li>商品名:<span>'+dd.gname+'</span></li>\n' +
                                        '                                           <li>商品单价:<span class="Aprice">'+dd.grprice+'</span></li>\n' +
                                        '                                       </ul>\n' +
                                        '                                  </td>\n' +
                                        '                                  <td>\n' +
                                        '                                      购买数量:<input id="reduceCount" class="btn-ad"  type="button" value="-"><span class="spnum">'+n.shoppingnum+'</span><input id="addCount" class="btn-ad" type="button" value="+">\n' +
                                        '                                      <br>\n' +
                                        '                                      金额:￥&nbsp;<span class="spmoy">'+dd.grprice*n.shoppingnum+'</span>\n' +
                                        '                                  </td>\n' +
                                        '                                  <td align="right">\n' +
                                        '                                      <br>\n' +
                                        '                                      <br>\n' +
                                        '                                      <br>\n' +
                                        '                                      <input type="checkbox" value="check" class="check-box"><br>\n' +
                                        '                                      <br>\n' +
                                        '                                      <br>\n' +
                                        '                                 <a href="javascript:;" name="'+n.id+'" class="delete">删除</a>\n' +
                                        '                                  </td>\n' +
                                        '                               </tr>\n' +
                                        '                        </table>\n' +
                                        '                </div>\n' +
                                        '             </li>'
                                    $("#Cart-table").prepend(li);

                                }
                            })

                        })

                    }
                })

            }
            $(".showCart").on('click','.delete',function (){

                $(this).prop('name')
                if (confirm("移除购物车")){
                    $.ajax({
                        url:'deleteACart.do',
                        data: {'id':$(this).attr('name')},
                        type:'post',
                        success:function (){
                            location.href = 'GoCart.do';
                        }
                    })
                }

            })
            function Now() {
                var nowTime = new Date();
                var nowYear= nowTime.getFullYear() ;
                var nowMonth = nowTime.getMonth();
                var nowDate = nowTime.getDate();
                var nowH = nowTime.getHours() ;
                var nowM = nowTime.getMinutes();
                var nowS = nowTime.getSeconds() ;
                var Y =nowYear;
                var M = nowMonth<9 ? '0' + (nowMonth+1): (nowMonth);
                var D = nowDate<10 ? '0' + nowDate: nowDate;
                var H = nowH<10 ? '0' + nowH: nowH;
                var m = nowM<10? '0' + nowM:nowM;
                var s = nowS<10 ? '0' + nowS: nowS;
                var fomatTime = Y+'-'+M+'-'+D+' '+H+':'+ m+':'+ s;
                return fomatTime;
            }
            $(".showCart").on('click','.check-box',function (){
                var AllMoney = 0;
                $("#Cart-table .cart-box").each(function (i,n){
                    if ($(this).find(".check-box").prop("checked")==true){
                        AllMoney+=parseInt($(this).find(".spmoy").text());
                    }
                })

                $("#ZMoy").text(AllMoney);
            })

            $(".showCart").on('click','#GoPay',function (){
                var CheckCart = [];
                var j = 0;
                var AllMoney= parseInt($("#ZMoy").text());

                $("#Cart-table .cart-box").each(function (i,n){

                    if ($(this).find(".check-box").prop("checked")===true){
                        CheckCart [j++]= $(this).find(".delete").attr('name');
                    }
                })
              $.ajax({
                    url:'ByCartAddOrder.do',
                    type:'post',
                    traditional:true,
                    data:{'IdCartArray':CheckCart,'amount':AllMoney,'Date':Now()},
                    success:function (data){
                        location.href = 'paydone.do?id='+data["orderId"]+'';
                    }
                })
            })
        })
    </script>
</head>
<body>
<h1>购物车</h1>
    <div class="showCart">

        <div  class="tbody-cart">
         <ul id="Cart-table">

         </ul>
        </div>
        <div class="time-notice" >
            总计:￥&nbsp;<span id="ZMoy">0</span>
            <input class="btn-ad1" id="GoPay" type="button" value="去支付">
            <input class="btn-ad1" id="Back" type="button" value="返回">
        </div>
    </div>

</body>
</html>
