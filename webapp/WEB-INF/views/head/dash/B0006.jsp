
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
    
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
</style>    
<div class="card Area Area3 " index="6" id="C0006">
    <div class="card-header table-card">
        <span class="fontSet">가맹점 리스트</span>
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
    <div class="card-content card-block pb-4 card-body-Area">
    	<table class="dataTable-table">
 			<thead>
 				<tr>
	 				<th class="center">가맹점</th>
	 				<th class="center">가입일</th>
 				</tr>
 			</thead>
 			<tbody id="table-list">
			 <c:if test="${not empty franlist }">
			 	<c:forEach items="${franlist }" var="list" varStatus="idx">
			 		<c:choose>
			 			<c:when test="${idx.index == 0 }">
			 			<tr>
				 			<td >${list.fran_comnm } <span class="new-span">new</span></td>
				 			<td class="center fran_srbde">${list.fran_srbde  }</td>
			 			</tr>	
			 			</c:when>
			 			<c:otherwise>
			 				<tr>
					 			<td >${list.fran_comnm }</td>
					 			<td class="center fran_srbde">${list.fran_srbde  }</td>
					 		</tr>
			 			</c:otherwise>
			 		</c:choose>
			 			
			 	</c:forEach>
			 </c:if>
 			
 			</tbody>   	
    	</table>

    </div>
</div>

<script type="text/javascript">
$(function(){
	$("#table-list tr").each(function(index, item){
		
		let srbde = $(this).find("td").eq(1).text();
		srbde = srbde.substring(0,4) + "년" + srbde.substring(4,6) + "월" + srbde.substring(6,8) + "일";
		$(this).find("td").eq(1).text(srbde);
		
	})
	
})
</script>