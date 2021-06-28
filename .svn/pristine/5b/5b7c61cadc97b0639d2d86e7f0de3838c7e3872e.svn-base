
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<script type="text/javascript" src="${cPath }/resources/js/jquery.form.min.js"></script>    
<style>
	.card-body-Area {
		height: 418px;
		padding: 0 1.5rem  1.5rem 1.5rem;
		overflow-y: scroll;
		overflow-x: hidden;
	}
	::-webkit-scrollbar { width: 5.2px; } /* 스크롤 바 */
	::-webkit-scrollbar-thumb { background: #ddd; border-radius: 10px; } /* 실질적 스크롤 바 */
	.center {
		text-align: center;
	}
	.new-span {
		color : red;
		font-size : 10px;
		position: relative;
    	top: -3px;
	}
	.myImage{
		width: 40px;
	}
</style>    
<div class="card Area Area3 " index="6" id="B0006">
    <div class="card-header table-card">
        <span class="fontSet">재고 현황</span>
        <div class="card-header-right">
              <ul class="list-unstyled card-option" style="display : flex; width:30px;">
                  <li ><i class="fa fa fa-wrench open-card-option"></i></li>
                  <li ><i class="fa fa-window-maximize full-card"></i></li>
                  <li ><i class="fa fa-minus minimize-card"></i></li>
                  <li ><i class="fa fa-refresh reload-card"></i></li>
                  <li ><i class="fa fa-trash Min3"></i></li>
              </ul>
         </div>
    </div>
    <div class="card-content card-block pb-4 card-body-Area"  id="table1">
    	<table class="dataTable-table">
 			<thead>
 				<tr>
					<th data-sortable="" style="width: 5.8215%;" class="center">
						<a href="#" class="dataTable">이미지</a>
					</th>
					<th data-sortable="" style="width: 20.8215%;">
						<a href="#" class="dataTable">제품명</a>
					</th>
					<th data-sortable="" style="width: 10.737%;">
						<a href="#" class="dataTable">현재재고</a>
					</th>
 				</tr>
 			</thead>
 			<tbody id="invenListBody">
				
 			
 			</tbody>   	
    	</table>
		<div id="invenPagingArea" class="d-flex justify-content-center">
			${pagingVO.pagingHTMLBS }
			
		</div>
    </div>
</div>

<form id="invenSearchForm" action="${cPath }/fran/main/C0006">
	<input type="hidden" name="page" value="${pagingVO.currentPage }"/>
</form>

<script type="text/javascript">
$(function(){
	
	//페이지 버튼 클릭 이벤트
	let invenPagingArea = $("#invenPagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(page){
			invenSearchForm.find("[name='page']").val(page);
			invenSearchForm.submit();
		}
		return false;
	});
	
	let invenListBody = $("#invenListBody");
	
	//AJAX FORM
	let invenSearchForm = $("#invenSearchForm").ajaxForm({
		dataType:"json"
		, beforeSubmit:function(){
			invenSearchForm.find("[name='page']").val("");	
		}, success:function(resp){
			invenListBody.empty();
			invenPagingArea.empty();
			let trTags = [];
			if(resp.dataList){
				$(resp.dataList).each(function(idx, inven){
					let img = $("<td>").html("<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>").attr("id",inven.prod_code).addClass("prodcode center");
					if(inven.att_fileno != null){
						img = $("<td>").html("<img class='myImage' src='data:image/jpeg;base64,"+inven.attachfileList[0].file_img+"'>").attr("id",inven.prod_code).addClass("prodcode center");
					}
					let memo = $("<td>").html("").attr("id",inven.prod_code).addClass("prodcode")
					if(inven.fran_proinven > inven.fran_nowinven){
						memo = $("<td>").html("적정재고에 미달되었습니다.").attr("id",inven.prod_code).addClass("prodcode").css("color","red")
					}
					let tr = $("<tr>").append(
								img
								, $("<td>").html(inven.prod_nm).attr("id",inven.prod_code).addClass("prodcode")
								, $("<td>").html(inven.fran_nowinven).attr("id",inven.prod_code).addClass("prodcode")
							).data("inven", inven).css("cursor", "pointer");
					trTags.push(tr);
				});
			}else{
				trTags.push( 
					$("<tr>").html(
						$("<td>").attr("colspan", "8")		
					)
				);
			}
			invenListBody.html(trTags);
			invenPagingArea.html(resp.pagingHTMLBS);
			$("#checkAll").prop("checked", false);
		}, error:function(xhr, resp, error){
			console.log(xhr);
		}
	});
	invenSearchForm.submit();
	
	//상세보기 
	$("#invenListBody").on("click", ".prodcode", function() {
		location.href="${cPath}/fran/inven/detail?what="+$(this).attr("id");		
	});
	

})
</script>