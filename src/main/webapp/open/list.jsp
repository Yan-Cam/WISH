<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, viewport-fit=cover">
    <title>Document</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
  
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        .ui-loader-default {
            display: none
        }

        .ui-mobile-viewport {
            border: none
        }

        .ui-page {
            padding: 0;
            margin: 0;
            outline: 0
        }

        body {
            padding: 1.5rem;
        }

        .news_item {
            border-radius: 1rem;
            width: 100%;
            height: 9rem;
            margin-bottom:1.5rem;
            background-color: #f6f6f6;
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            z-index: -2;
        }
        .delete {
            height: inherit;
            width: 0;
            border-radius: 0 1rem 1rem 0;
            background-color: #CAE0FF;
            position: absolute;
            right: 1.5rem;
        }

        .delete_container {
            opacity: 0;
            display: flex;
            height: inherit;
            align-items: center;
            justify-content: center;
        }

        .top {
            z-index: 1;
            height: 3rem;
            background: white;
            display: flex;
            width: 100%;
            align-items: center;
            justify-content: center;
            position: fixed;
            top: 0;
            left: 0;
        }
    </style>
</head>

<body>
    <div class="top">
        <p style="font-size: 1.4rem; color: #585858;">阅读清单</p>
    </div>
    <div class="list" style="margin-top: 1.5rem;">
        <div class="news_item">
    
</div>
    </div>
    <script>
    let startX = 0
    let moveX = 0
    let isMove = false
    $(document).on({
    	touchstart: function(e) {
        	startX = e.originalEvent.changedTouches[0].clientX
    	},
    	touchmove: function(e) {
        	moveX = e.originalEvent.changedTouches[0].clientX - startX
        	isMove = true
    	},
    	touchend: function(e) {
        	console.log(moveX)
        	if(isMove && Math.abs(moveX) >= 50) {
        		if (moveX < 0) {
        			$(this).animate({
                        'width': '90%',
                        'borderTopLeftRadius': '1rem',
                        'borderTopRightRadius': '0',
                        'borderBottomLeftRadius': '1rem',
                        'borderBottomRightRadius': '0'
                    }, 200, 'linear')
                    $(this).find('.delete').animate({ width: '10%' }, 200, 'linear')
                    $(this).find('.delete_container').animate({ opacity: '1' }, 200, 'linear')
                    // $(".list").trigger("create"); 
        		} else {
        			$(this).animate({
                        'width': '100%',
                        'borderTopLeftRadius': '1rem',
                        'borderTopRightRadius': '1rem',
                        'borderBottomLeftRadius': '1rem',
                        'borderBottomRightRadius': '1rem'
                    }, 300, 'linear')
                    $(this).find('.delete').animate({ width: '0' }, 200, 'linear')
                    $(this).find('.delete_container').animate({ opacity: '0' }, 200, 'linear')
        		}
            }
    	}
    }, ".news_item" );
        	startX = 0
        	moveX = 0
        	isMove = false  
            $(document).ready(()=>{
                $.ajax({
                    url:"http://localhost:8080/WISH/listServlet",
                    type:"GET",
                    dataType:"json",
                    success:function (rs) {
                        let d = "";
                        rs.forEach((item, index) => {
                        d += '<div class="news_item" data-id="'+item.essayId+'" name = "'+item.essayUrl+'">'
                        d += '<div style="margin: 0 1rem;">'
                        d += '<img src="'+item.essayPic+'" alt="" style="width: 6rem; height: 6rem;border-radius:0.5rem;object-fit:cover;">'
                        d += '</div>'
                        d += '<div style="margin-right: 0.5rem;">'
                        d += '<div style="color: #585858; font-size: 1rem;">'+item.essayTitle+'</div>'
                        d += '<div style="color: #9a9a9a;font-size:0.6rem">'+item.essayDesc.substring(0,40)+'</div>'
                        d += '<p style="color: #9a9a9a; font-size: 0.5rem; margin-top: 0.5rem;">2022年5月7日</p>'
                        d += '</div>'
                        d += '<div style="position: absolute; top: -2.5rem; right: 0.5rem; z-index: 0;">'
                        d += '<img '
                       	d += 'src="./image/Iconly_Bulk_Bookmark_small.svg" alt="">'
                        d += '</div>'
                        d += '<div class="delete" style="z-index: 0;">'
                        d += '<div class="delete_container">'
                        d += '<img src="./image/Iconly_Bulk_Delete.svg" alt="">'
                        d += '</div>'
                        d += '</div>'
                        d += '</div>'        
                        });
                        $(".list").html(d);
                        $(".list").trigger("create"); 
                        // getMes();
                        /*document.querySelectorAll(".delete").forEach((item, index) => {
                        	console.log(item);
                        	item.addEventListener("click", function(){
                        		console.log(index);
                        	})
                        })
                        
                        $(".list .delete").each(function(index, item){
                        	console.log(item, index);
                        	item.addEventListener("click", function(){
                        		console.log(index);
                        	})
                        })*/
                        
                    }
                })
            	})
        $(document).on("click", ".delete",(e)=>{	
        	$(e.currentTarget).parent().slideUp()
        	let essayId = $(e.currentTarget).parent().attr("data-id")
        	console.log(essayId)
			$.ajax({
                        url:"http://localhost:8080/WISH/deleteServlet?essayId="+essayId+"",
                        type:"GET",
                        dataType:"json",
                        success:function (rs) {
                        }
                    })
            e.stopPropagation()
	})
	          	$(document).on("click", ".news_item",(e)=>{	
               		localStorage.setItem("essayUrl", $(e.currentTarget)[0].getAttribute("name"))
               		localStorage.setItem("essayId", $(e.currentTarget)[0].getAttribute("data-id"))
               		console.log($(e.currentTarget)[0].getAttribute("name"))
          			window.location.href = "./essayDetails.jsp"
          	})

    </script>
</body>
</html>