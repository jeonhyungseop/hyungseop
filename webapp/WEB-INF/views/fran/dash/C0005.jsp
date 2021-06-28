 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="${cPath }/resources/js/jquery.form.min.js"></script>
<style>
.card-table-notice {
	height: 440px;
	overflow-x: hidden;
	overflow-y :scroll; 
}
</style>
 <div class="col-12 col-xl-6 Area Area2 " index="5" id="C0005">
      <div class="card table-card">
          <div class="card-header">
              <span class="fontSet">공지사항</span>
              <div class="card-header-right">
              <ul class="list-unstyled card-option" style="display : flex; width:30px;">
                  <li ><i class="fa fa fa-wrench open-card-option"></i></li>
                  <li ><i class="fa fa-window-maximize full-card"></i></li>
                  <li ><i class="fa fa-minus minimize-card"></i></li>
                  <li ><i class="fa fa-refresh reload-card"></i></li>
                  <li ><i class="fa fa-trash Min2"></i></li>
              </ul>
        	 </div>
          </div>
          <div class="card-body card-block card-table-notice">
            	<table class="table table-hover dataTable-table" id="table1">
								
					<thead>
						<tr>
							<th data-sortable="" style="width: 20%;">
								<a href="#" class="dataTable">글번호</a>
							</th>
							<th data-sortable="" style="width: 20%;">
								<a href="#" class="dataTable">제목</a>
							</th>
							<th data-sortable="" style="width: 20%;">
								<a href="#" class="dataTable">작성자</a>
							</th>
							<th data-sortable="" style="width: 20%;">
								<a href="#" class="dataTable">작성날짜</a>
							</th>
							<th data-sortable="" style="width: 20%;">
								<a href="#" class="dataTable">조회수</a>
							</th>
						</tr>
					</thead>
					
					<tbody id="listNoticeBody">
						<c:choose>
								<c:when test="${not empty pagingVO.dataList }">
									<c:forEach items="${pagingVO.dataList }" var="board">
										<tr>
											<td class="seq">${board.board_seq}</td>
											<td>${board.board_title }</td>
											<td>${board.board_writer }</td>
											<td>${board.board_time }</td>
											<td>${board.board_hit }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">조건에 맞는 게시글이 없음.</td>
									</tr>
								</c:otherwise>
							</c:choose>
					</tbody>
					
				</table>
				<div id="pagingNoticeArea" class="d-flex justify-content-center">
					${pagingVO.pagingHTMLBS }
				</div>
          </div>
      </div>
  </div>
  
	
<script type="text/javascript">
	
</script>