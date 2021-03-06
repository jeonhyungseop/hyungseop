<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.06.10.  진유리          최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">
<link rel="stylesheet"
	href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<style>
.main { margin-bottom: 1%;}
.main .card-header { padding: 1.5rem 1.5rem 0.5rem 1.5rem; }
.main .card-body { padding: 0.5rem 1.5rem; }
.dataTable-table th { text-align: center; }
.royallist .card-header { padding-bottom: 0; }
.dataArea { height: 300px; overflow-y: scroll; }
.number { width: 30%; display: inline-block; }
</style>
<div id="app">
	<div id="sidebar" class="active"></div>

	<!-- 발주 목록 -->
	<div class="row main">
		<div class="col-12">
			<div class="card orderCard">
				<!-- card-header 영역 -->
				<div class="card-header">
					<div class="row">
						<div class="rowLeft">
							<h4>가맹비관리</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/fran/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">가맹비관리</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				<!-- card-header 끝 -->

				<div class="card-content">
					<div class="card-body" style="padding-top: 0px;">
						<!-- 조회 영역 -->
						<div class="btnArea">
							<a href="#" id="register" class="btn btn-primary float-end pribtn" data-bs-toggle="modal"
								data-bs-target="#registerModal">변경</a>
						</div>
						<div class="row column">
							<div class="col-12 col-xl-12">
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-12" style="position: relative;">
												<div id="chart"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 가맹비 내역 -->
	<div class="row royallist">
		<section class="section">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title" style="display: inline-block;">가맹비 변동 상세내역</h4>
				</div>
				<div class="card-body">
					<form id="Form">
						<div class="btnArea">
							<button type="submit"
								class="btn btn-primary float-end pribtn searchSubmit">검색</button>
							<button type="reset"
								class="resetBtn icon dripicons-clockwise float-end"></button>
						</div>
						<table class="table table-borderd">
							<tbody class="talbeSearchArea">
								<tr>
									<th class="searchTh" style="width: 10%;">가맹비 가격</th>
									<td style="width: 30%;">
										<input class="form-control number" placeholder="0" type="text" id="minPrice" name="minPrice" min="0"
										value="${pagingVO.searchMap.minPrice}" onchange="fn_search(this)" maxlength="15" onkeyup="ParsePrice(this)" /> 
										- 
										<input class="form-control number" placeholder="30,000" type="text" id="maxPrice" name="maxPrice" min="0"
										value="${pagingVO.searchMap.maxPrice}" onchange="fn_search(this)" maxlength="15" onkeyup="ParsePrice(this)" />
									</td>
									<th class="searchTh" style="width: 10%;">적용 날짜</th>
									<td style="width: 30%;">
										<input type="date" id="startDate" name="startDate" class="form-control date"
										value="${pagingVO.searchMap.startDate}" onchange="fn_search(this)" /> 
										- 
										<input type="date" id="endDate" name="endDate" class="form-control date"
										value="${pagingVO.searchMap.endDate}" onchange="fn_search(this)" />
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<div class="dataTable-container">
						<div class="btnArea">
							<div class="dataTable-dropdown float-end">
								<select id="selector" class="dataTable-selector form-select">
									<option value="5">5개씩 보기</option>
									<option value="10" selected>10개씩 보기</option>
									<option value="15">15개씩 보기</option>
									<option value="20">20개씩 보기</option>
									<option value="25">25개씩 보기</option>
								</select>
							</div>
						</div>
						<div class="dataArea">
							<table class="table table-hover dataTable-table" id="table1">
								<thead>
									<tr>
										<th data-sortable="" style="width: 10%;">
											<a href="#" class="dataTable">번호</a>
										</th>
										<th data-sortable="" style="width: 10%;">
											<a href="#" class="dataTable">가맹비 가격</a>
										</th>
										<th data-sortable="" style="width: 20%;">
											<a href="#" class="dataTable">적용 날짜</a>
										</th>
										<th data-sortable="" style="width: 20%;">
											<a href="#" class="dataTable">적용 마지막 날짜</a>
										</th>
										<th data-sortable="" style="width: 20%;">
											<a href="#" class="dataTable">적용 일수</a>
										</th>
										<th data-sortable="" style="width: 20%;">
											<a href="#" class="dataTable">적용 여부</a>
										</th>
									</tr>
								</thead>
								<tbody id="listBody">
									<c:choose>
										<c:when test="${not empty pagingVO.dataList }">
											<c:forEach items="${pagingVO.dataList }" var="roayl">
												<tr>
													<td class="center">${roayl.rnum }</td>
													<td class="right">${roayl.royalty }</td>
													<td class="center">${roayl.royalty_apli_start_de }</td>
													<c:if test="${roayl.last_day eq null}">
														<td class="center">-</td>
													</c:if>
													<c:if test="${roayl.last_day ne null}">
														<td class="center">${roayl.last_day}</td>
													</c:if>
													<td class="center">${roayl.use_day}</td>
													<td class="center">${roayl.royalty_use_at}</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6">조건에 맞는 게시글이 없음.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
					<div class="dataTable-bottom">
						<div class="dataTable-info">
							Showing 1 to <span id="totalPage"></span> of <span id="currentPage"></span> entries
						</div>
					</div>
					<div id="pagingArea" class="d-flex justify-content-center">
						${pagingVO.pagingHTMLBS }</div>
				</div>
			</div>
		</section>
	</div>
</div>
<form id="searchForm" action="${cPath}/head/royal">
	<input type="hidden" name="page" /> 
	<input type="hidden" name="selector" value="" />
	<input type="hidden" name="startDate" value="${pagingVO.searchMap.startDate}" /> 
	<input type="hidden" name="endDate" value="${pagingVO.searchMap.endDate}" />
	<input type="hidden" name="minPrice" value="${pagingVO.searchMap.minPrice}" />
	<input type="hidden" name="maxPrice" value="${pagingVO.searchMap.maxPrice}" />
</form>

<!--login form Modal -->
<div class="modal fade text-left" id="registerModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel33">가맹비 등록 폼</h4>
			</div>
			<form id="registerFrom">
				<div class="modal-body">
					<label>가격 </label>
					<div class="form-group">
						<input type="text" class="form-control" id="price" maxlength="15"
							onkeyup="ParsePrice(this)" />
					</div>
					<label>적용일자 </label>
					<div class="form-group">
						<input type="date" class="form-control" id="startDay" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> 
						<span class="d-none d-sm-block">닫기</span>
					</button>
					<button type="button" class="btn btn-primary ml-1 registerBtn">
						<i class="bx bx-check d-block d-sm-none"></i> 
						<span class="d-none d-sm-block">저장</span>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="${cPath }/resources/charts/apexcharts.js"></script>
<%-- <script type="text/javascript" src="${cPath}/resources/slick/jquery-1.11.0.min.js"></script> --%>
<script type="text/javascript" src="${cPath}/resources/slick/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/slick/slick.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/moment.js"></script>
<script type="text/javascript">
	var price = [];
	var change_date = [];
	var myChart = $.ajax({
		url : "${cPath}/head/royal/royalchart",
		method : "get",
		data : {
			"code" : '${code}'
		},
		dataType : "json",
		success : function(resp) {
			if (resp) {
				var num = resp.length;
				var remain = 6-num;
				var day = 7*remain;
				
				if(num < 6){
					for(var i=0; i < remain; i++){
						price.push(0);
						var de = new Date(resp[0].royalty_apli_start_de);
						// 일주일 전 구하기
						de = new Date(de.getFullYear(), de.getMonth(), de.getDate() - day).toLocaleDateString();
						change_date.push(de);
						day = day-7;
					}
				}
				
				$(resp).each(function(idx, royal) {
					price.push(royal.royalty);
					change_date.push(royal.royalty_apli_start_de);
				});
			}
		},
		error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
		}
	});
	var options = {
		series : [ {
			name : 'price',
			data : price
		} ],
		chart : {
			height : 350,
			type : 'area'
		},
		dataLabels : {
			enabled : false
		},
		stroke : {
			curve : 'smooth'
		},
		title : {
			text : '가맹비 변동률',
			align : 'left',
			style : {
				fontSize : '18px',
				fontWeight : 'bold',
				fontFamily : 'Nutino',
				color : '#876767'
			},
		},
		xaxis : {
			type : 'datetime',
			categories : change_date,
			tickAmount : 6,
			labels : {
				rotate : -10,
				rotateAlways : true,
				formatter : function(val, timestamp) {
					return moment(new Date(timestamp)).format("YYYY-MM-DD")
				}
			}
		},
		yaxis : {
			opposite : true
		},
		tooltip : {
			x : {
				format : 'yyyy-MM-dd'
			},
		},
		colors : [ "#F2913D" ]
	};

	var chart = new ApexCharts(document.querySelector("#chart"), options);
	chart.render();

	function fn_search(obj) {
		let name = obj.getAttribute('name');
		if (name == 'minPrice' || name == 'maxPrice') {
			searchForm.find("input[name=" + name + "]").val(
					obj.value.replace(/,/g, ""));
		} else {
			searchForm.find("input[name=" + name + "]").val(obj.value);
		}
	};

	//리셋 폼
	$.fn.clearForm = function() {
		return this.each(function() {
			var type = this.type, tag = this.tagName.toLowerCase();
			if (tag === 'form') {
				return $(':input', this).clearForm();
			}
			if (type === 'text' || type === 'password' || type === 'hidden'
					|| tag === 'textarea') {
				this.value = '';
			} else if (type === 'checkbox' || type === 'radio') {
				this.checked = false;
			} else if (tag === 'select') {
				this.selectedIndex = -1;
			}
		});
	};

	let pagingArea = $('#pagingArea').on('click', "a", function(event) {
		event.preventDefault();
		let page = $(this).data("page");
		if (page) {
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});

	$(".searchSubmit").on("click", function(event) {
		event.preventDefault();
		searchForm.submit();
	});

	let listBody = $('#listBody')
	let currentPage = $("#currentPage");
	let totalPage = $("#totalPage");
	let selector = $("#selector").val();
	let searchForm = $("#searchForm").ajaxForm({
						dataType : "json",
						beforeSubmit : function() {
							searchForm.find("[name='page']").val("");
						},
						success : function(resp) {
							listBody.empty();
							pagingArea.empty();
							currentPage.empty();
							let trTags = [];
							if (resp.dataList) {
								$(resp.dataList).each(function(idx, royal) {
											let locale = navigator.language;
											let royalty = Number(royal.royalty).toLocaleString(locale);
											let last_day = "-";
											if (royal.last_day != null) {
												last_day = royal.last_day;
											}
											let use_day = royal.use_day+ "일";
											if (royal.use_day <= 0) {
												use_day = Math.abs(royal.use_day)+ "일 남음";
											}
											let use_at = "미적용";
											if(royal.royalty_use_at == "Y"){
												use_at = "적용";
											}
											let tr = $("<tr>").append(
															$('<td>').attr("class", "center").html(royal.rnum),
															$('<td>').attr("class", "right").html(royalty),
															$('<td>').attr("class", "center").html(royal.royalty_apli_start_de),
															$('<td>').attr("class", "center").html(last_day),
															$('<td>').attr("class", "center").html(use_day),
															$('<td>').attr("class", "center").html(use_at)
														)
													.data("royal", royal).css("cursor", "pointer");
											trTags.push(tr);
										});
							} else {
								trTags.push($("<tr>").html(
										$("<td>").attr("colspan", "8")));
							}
							listBody.html(trTags);
							pagingArea.html(resp.pagingHTMLBS);
							currentPage.html(resp.currentPage);
							if (resp.totalPage == 0) {
								totalPage.html(1);
							} else {
								totalPage.html(resp.totalPage);
							}
						},
						error : function(xhr, resp, error) {
							console.log(xhr);
						}
					});

	searchForm.submit();

	$('#pagingArea').on('click', "a", function(event) {
		event.preventDefault();
		let page = $(this).data("page");
		if (page) {
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});

	/* 검색 */
	$("#selector").on("change", function() {
		$("#searchForm input[name='selector']").val($(this).val());
		searchForm.submit();
	});

	$(".resetBtn").on("click", function() {
		searchForm.clearForm();
		searchForm.submit();
	})

	$("#price").on("change", function() {
		checkPrice();
	});
	$("#startDay").on("change", function() {
		checkDate();
	});

	$(".registerBtn").on("click", function() {
		if (checkUnrealInput()) {
			$.ajax({
				type : "POST",
				url : "${cPath}/head/royal/register",
				data : {
					code : '${code}',
					price : $("#price").val().replace(/,/g, ""),
					startday : $("#startDay").val().replace(/-/g, "")
				},
				success : function(data) {
					var result = data.result;

					if (result == "OK") {
						alert("등록에 성공했습니다.");
						setTimeout(function() {
							location.reload();
						}, 1000);
					} else {
						alert("등록에 실패했습니다.");
					}
				}
			});
			$("#registerModal").modal('hide.bs.modal');
		} else {
			if (!checkUnrealInput()) {
				alert("빠진 정보가 있거나 잘못된 정보를 입력했는지 확인하세요.");
			};
		}
	});

	function checkPrice() {
		var price = $("#price").val();
		var oInput = $("#price");

		hideMsg(oInput);

		if (price != "") {
			showSuccessMsg(oInput);
			return true;
		} else if (price == "") {
			showErrorMsg(oInput);
			return false;
		}

		return true;
	};
	function checkDate() {
		var startdate = $("#startDay").val();
		var oInput = $("#startDay");

		hideMsg(oInput);

		let today = moment();
		let now = today.format('YYYY-MM-DD');
		if (startdate != '' && startdate > now) {
			showSuccessMsg(oInput);
			return true;
		} else if (startdate != '' && startdate < now) {
			showErrorMsg(oInput);
			return false;
		} else if (startdate == '') {
			showErrorMsg(oInput);
			return false;
		}

		return true;
	};
	function checkUnrealInput() {
		if (checkPrice() & checkDate()) {
			return true;
		} else {
			return false;
		}
	}
	function ParsePrice(obj) {
		$(obj).on("keyup", function(event) {

			// 1.
			var selection = window.getSelection().toString();
			if (selection !== '') {
				return;
			}

			// 2.
			if ($.inArray(event.keyCode, [ 38, 40, 37, 39 ]) !== -1) {
				return;
			}

			// 3
			var $this = $(this);
			var input = $this.val();

			// 4
			var input = input.replace(/[\D\s\._\-]+/g, "");

			// 5
			input = input ? parseInt(input, 10) : 0;

			// 6
			$this.val(function() {
				return (input === 0) ? "" : input.toLocaleString("en-US");
			});

		});
	}

	function setFocusToInputObject(obj) {
		obj.focus();
	}
	function hideMsg(obj) {
		obj.attr("class", "form-control");
		obj.show();
	}
	function showErrorMsg(obj) {
		obj.attr("class", "form-control is-invalid");
		obj.show();
	}
	function showSuccessMsg(obj) {
		obj.attr("class", "form-control is-valid");
		obj.show();
	}
</script>