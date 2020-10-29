<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http:

<style>
img {
  max-width: 100%;
}
</style>

<input type="hidden" name="stmTypeCd" id="stmTypeCd" value="${param.stmTypeCd}" /> 
<input type="hidden" name="stmDsTypeCd" id="stmDsTypeCd" value='${param.stmDsTypeCd}'/>
<input type="hidden" name="stmNm" id="stmNm" value='${param.stmNm}'/>
<input type="hidden" name="paramRow" id="paramRow" value='${param.paramRow }' />
<input type="hidden" id="stmRootYn" name="stmRootYn" value='${param.stmRootYn}'/>
<input type="hidden" id="badHitYn" name="badHitYn" value='${param.badHitYn}'/>

<div class="kt-section__content kt-section__content--border">
	<div class="card">
		<div class="card-header kt-font-bolder">
			<!-- 제목 -->
			<div class="kt-padding-t-10 kt-padding-b-15" name="badTitleDiv" id="badTitleDiv" style="font-size:1.5em; border-bottom: 1px solid #dedede;"></div>
			<!-- 작성자, 작성일, 조회수 -->
			<div class="osl-portlet__head-label kt-margin-t-10">
				<div class="kt-padding-5 osl-padding-b-6__5" name="writerDiv" id="writerDiv"  data-badUsrId=''></div>
				<div class="kt-padding-5" name="writeDateDiv" id="writeDateDiv"></div>
				<!-- <div class="kt-padding-t-10 kt-padding-b-10" name="hitDiv" id="hitDiv"></div>	 -->
			</div>	
		</div>
		<div class="osl-bad__card-body">
			<!-- 수정, 삭제, 복원 -->
			<div class="osl-portlet__sub-toolbar">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" name="updateBtn" id="updateBtn" title="게시글 수정" data-title-lang-cd="bad1001.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" name="deleteBtn" id="deleteBtn" title="게시글 삭제" data-title-lang-cd="bad1001.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
					<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air kt-hide" name="restoreBtn" id="restoreBtn" title="게시글 복원" data-title-lang-cd="bad1001.actionBtn.restoreTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
					<i class="la la-rotate-left"></i><span data-lang-cd="bad1001.button.restore">복구</span>
				</button>
			</div>
			<!-- 내용 -->
			<div class="bard-text kt-padding-30 kt-padding-t-20 kt-padding-b-20" style="min-height: 150px;" name="badContentDiv" id="badContentDiv"></div>
			<!-- 첨부파일 목록 -->
			<div class="form-group kt-margin-20 kt-hide" name="badFileOption" id="badFileOption">
				<hr class="kt-margin-t-20 kt-margin-b-20">
				<div class="kt-font-bolder kt-padding-l-5">
					<i class="fa fa-file-upload kt-margin-r-5"></i><span data-lang-cd="bad1001.label.attchFile">파일 첨부</span>
				</div>
				<div class="kt-margin-t-10 kt-uppy fileReadonly" name="fileListDiv" id="fileListDiv">
					<div class="kt-uppy__dashboard"></div>
					<div class="kt-uppy__progress"></div>
				</div>
			</div>
			<!-- 태그 리스트 -->
			<div class="form-group kt-margin-20 kt-hide" name="badTagOption" id="badTagOption">
				<div class="kt-font-bolder kt-padding-l-5">
					<i class="fa fa-hashtag kt-margin-r-5"></i><span data-lang-cd="bad1001.label.tag">태그</span>
				</div>
				<div class="kt-margin-t-10" name="tagListDiv" id="tagListDiv">
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 리스트 -->
	<div class="card kt-margin-t-10"  name="badCmtDiv" id="badCmtDiv">
		<div class="card-header kt-font-bolder" style="line-height: 32px">
			<i class="fa flaticon-chat-1 kt-margin-r-5"></i><span data-lang-cd="bad1001.label.comment">댓글</span>
			<div class="kt-portlet__head-toolbar" style="float:right; align-items:''; ">
				<!-- 댓글 조회/삭제 -->
				<div class="kt-widget__wrapper" name="badCmtBtnDiv" id="badCmtBtnDiv">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1001CmtTable" data-datatable-action="select" title="댓글 조회" data-title-lang-cd="bad1001.actionBtn.selectComment" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
						<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1001CmtTable" data-datatable-action="delete" title="댓글 삭제" data-title-lang-cd="bad1001.actionBtn.deleteComment" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="2">
						<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
					</button>
				</div>
			</div>
		</div>
		<div class="osl-bad__card-body">
			<!-- 댓글 검색 -->
			<div class="row kt-padding-20 kt-padding-l-30">
				<div class="osl-datatable-search col-lg-5 col-md-6 col-sm-6 col-12" data-datatable-id="bad1001CmtTable"></div>
			</div>
			<!-- 댓글 입력창 -->
			<div class="input-group kt-margin-t-10 kt-margin-b-10 kt-padding-l-30 kt-padding-r-10 kt-hide" style="width:95%" name="badCmtInput" id="badCmtInput">
				<div class="input-group-prepend kt-padding-r-15" name="loginUsr" id="loginUsr">
				</div>
				<input type="text" class="form-control" name="cmtWriter" id="cmtWriter" maxlength="370" />
				<div class="form-group-append">
					<button class="btn btn-brand" type="button" name="cmtSaveBtn" id="cmtSaveBtn"><span data-lang-cd="bad1001.button.submit">등록</span></button>
				</div>
			</div>
			
			<!-- 댓글 목록 창 -->
			<div class="kt-margin-t-10" name="badCmtList" id="badCmtList">
				<div class="kt_datatable" id="bad1001CmtTable"></div>
			</div>
		</div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";

var OSLBad1001Popup = function () {
	
	var okManager;
	var okWriter;
	
	
	var fileUploadObj;
	
	
	var tag = [];

	
	var paramRowData;
	
	
   	var dataTableId = "bad1001CmtTable";
	
    var documentSetting = function () {
    	
    	paramRowData = JSON.parse($("#paramRow").val());

    	
    	$("#paramRow").val('');
    	
    	
		checkUser();
    	
		
	   	fileUploadObj = $.osl.file.uploadSet("fileListDiv",{
	   		meta: {"atchFileId": paramRowData.atchFileId, "fileSn": 0},
	   		maxFileSize: Number(paramRowData.fileStrg)/(1024*1024),
	   		maxNumberOfFiles: Number(paramRowData.fileCnt),
	   		height: 370,
	   		isDraggingOver: false,
    		fileDownload: true,
    		fileReadonly: true
	   	});

	   	fileUploadObj.reset();
	   	
	   	
	   	if($("#badHitYn").val() != null || $("#badHitYn").val() != ""){
	   		selectBadInfo(false);
	   	}else{
	   		selectBadInfo(true);
	   	}

	   	
    	$.osl.datatable.setting(dataTableId, {
			 data: {
				 source: {
					 read: {
						url: "/bad/bad1000/bad1100/selectBad1100CmtListAjax.do",
						params : {
							menuId: paramRowData.menuId,
							badId : paramRowData.badId
						}
					 }
				 },
			 },
			 columns: [
				 {field: 'checkbox', title: '#', textAlign: 'center', width: 30, selector: {class: "kt-checkbox--solid"}, sortable: false, autoHide: false},
				 {field: 'badCmtUsrId', title: $.osl.lang("bad1001.field.comment.writer"), textAlign: 'left', width: 180,
						template: function (row) {
							var usrData = {
									html: row.badCmtUsrNm + " (" + row.badCmtUsrId + ")",
									imgSize: "sm",
									class:{
										cardBtn: "osl-width__fit-content"
									}
							};
							return $.osl.user.usrImgSet(row.badCmtUsrImgId, usrData);
						},
						onclick: function(rowData){
							$.osl.user.usrInfoPopup(rowData.badCmtUsrId);
						}
						, search:true},
				 {field: 'badCmtContent', title:$.osl.lang("bad1001.field.comment.content"), textAlign: 'left', width:740, autoHide: false, search:true,
					template:function(row){
						var returnStr = "<span class='cmtTxt' style='word-break: break-word;'>"+$.osl.escapeHtml(row.badCmtContent)+"</span>";
						return returnStr;
					}			
				 },
				 {field: 'badCmtDtm', title: $.osl.lang("bad1001.field.comment.writeDate"), textAlign: 'center', width: 100, search:true, searchType:"daterange",
					 template: function(row){
						var paramDatetime = new Date(row.badCmtDtm);
						var agoTime = new Date() - paramDatetime;
						if(agoTime < 0){
							
							return "0초 전";
						}else if(agoTime < 1000 * 60){
							return $.osl.datetimeAgo(paramDatetime, {returnTime: "s"}).agoString;
						}else if(agoTime < 1000 * 60 * 60){
							return $.osl.datetimeAgo(paramDatetime, {returnTime: "m"}).agoString;
						}else if(agoTime < 1000 * 60 * 60 * 24){
							return $.osl.datetimeAgo(paramDatetime, {returnTime: "h"}).agoString;
						}else{
							return paramDatetime.format("yy.MM.dd");
						}
					},	
				 }
			 ],
			 layout:{ "header" : false },
			 actionBtn:{
				 "title": $.osl.lang("bad1001.actionBtn.title"),
				 "update": false,
				 "delete": true,
				 "click": true,
			 },
			 actionTooltip:{
				"delete": $.osl.lang("bad1001.actionBtn.deleteComment"),
			},
			 actionFn:{
				 "delete":function(rowDatas){
					 
					 if(paramRowData.delCd =='02'){
						
						var selfCheck = "Y";
						$.each(rowDatas, function(idx, value){
							if(value.badCmtUsrId != $.osl.user.userInfo.usrId){
								selfCheck = "N";
							}
						});
						
						if(okManager == true || (okWriter == true && selfCheck == "Y")){
							var data = {
		 							menuId : paramRowData.menuId,
		 							badId : paramRowData.badId,
		 							deleteDataList : JSON.stringify(rowDatas),
							};
							
							var ajaxObj = new $.osl.ajaxRequestAction(
			    			{"url":"<c:url value='/bad/bad1000/bad1000/deleteBad1100CmtInfoAjax.do'/>"}
			    			, data);
							
					    	ajaxObj.setFnSuccess(function(data){
					    		if(data.errorYn == "Y"){
									$.osl.alert(data.message,{type: 'error'});
									
									$.osl.layerPopupClose();
								}else{
									selectCmtList();
								}
							});
					    	
							ajaxObj.send();	
					 	}else{
					 		$.osl.alert($.osl.lang("bad1001.notCmtWriter.deleteMessage"), {"type":"warning"});
					 	}
					 }
				 },
				 "click": function(row, datatableId, type, rowNum, elem){
					
					
					var targetElem = $(elem).closest("tr").find("label.kt-checkbox").children("input[type=checkbox]");
					if(targetElem.is(":checked")==true){
						targetElem.prop("checked", false);
						$.osl.datatable.list[datatableId].targetDt.setInactive(targetElem);
						
						$(elem).closest("tr").removeClass("osl-datatable__row--selected");
						$(elem).closest("tr").addClass("kt-datatable__row--even");
					}else{
						targetElem.prop("checked", true);
						$.osl.datatable.list[datatableId].targetDt.setActive(targetElem);
					}
				}
			 },
			 theme:{
				 actionBtn:{
					 
					 click: " kt-hide"
				 }
			 }
    	});
	   	
    	$("#"+dataTableId).on("kt-datatable--on-layout-updated", function(){
    		 
    		 $(".cmtTxt").parent("span").addClass("osl-bad__width__100");
    	});
	   	
    	
		$("#cmtWriter").keydown(function(e){
			if(e.keyCode=='13'){
				e.preventDefault();
				$("#cmtSaveBtn").click();
				return;
			}
		});
    	
    	
    	$("#cmtSaveBtn").click(function(){
    		var cmtWriter = $("#cmtWriter").val().trim();
    		
    		if( cmtWriter == null || cmtWriter == "" ){
    			return;
    		}else{
	    		insertCmtInfo();
    		}
    	});
    	
    	
    	$("#updateBtn").click(function(){
    		var data = {
    				paramRow : JSON.stringify(paramRowData),
    				stmRootYn : $("#stmRootYn").val(),
				};
			var options = {
					idKey: "bad1003_" + paramRowData.badId, 
					modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+paramRowData.badNum,
					closeConfirm: true,
					autoHeight: false,
					modalSize: "xl",
				};
			
			
			if(okManager == true || $("#writerDiv").data("badUsrId") == $.osl.user.userInfo.usrId){
				
   				$.osl.layerPopupClose();
				$.osl.layerPopupOpen('/bad/bad1000/bad1000/updateBad1003View.do',data,options);
			}else{
				$.osl.alert($.osl.lang("bad1001.notAuthority.updateMessage"), {"type":"warning"});
			}
    	});
    	
    	
		$("#deleteBtn").click(function(){
			var data = {
					stmTypeCd : $("#stmTypeCd").val(),
					menuRootYn : 'N',
					deleteDataList : JSON.stringify(paramRowData),
			};
			;
			var options = {
					idKey: "del_"+paramRowData.badId, 
					modalTitle: $.osl.lang("bad1001.title.boardCheck.oneStep", paramRowData.badNum) + " " +$.osl.lang("bad1001.title.deleteReason"),
					closeConfirm: false,
					autoHeight: false,
					modalSize: "xl"
				};
			
			
			if(okManager == true || $("#writerDiv").data("badUsrId") == $.osl.user.userInfo.usrId){
				
				$.osl.layerPopupOpen('/bad/bad1000/bad1000/deleteBad1000View.do', data, options);
			}else{
				$.osl.alert($.osl.lang("bad1001.notAuthority.deleteMessage"), {"type":"warning"});
			}
    	});
    	
		
    	$("#restoreBtn").click(function(){
    		
			if(okManager == true){
	    		var data = {
	    				prjGrpId: paramRowData.prjGrpId,
	    				prjId : paramRowData.prjId,
						menuId : paramRowData.menuId,
						badId : paramRowData.badId,
						atchFileId : paramRowData.atchFileId,
					};
				
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction(
		    			{"url":"<c:url value='/bad/bad1000/bad1000/updateBad1001BadRestoreAjax.do'/>"}
						, data);
	    		
		    	ajaxObj.setFnSuccess(function(data){
		    		if(data.errorYn == "Y"){
						$.osl.alert(data.message,{type: 'error'});
						
						$.osl.layerPopupClose();
					}else{
						
						fileUploadObj.reset();
						
						
						selectBadInfo(false);
						
						selectCmtList();
					}	
				});
		    	
				ajaxObj.send();
			}else{
				$.osl.alert($.osl.lang("bad1001.notAuthority.restoreMessage"), {"type":"warning"});
			}
    	});
    };
    
    
    
    var selectBadInfo = function(badHitYn){
    	
		var data={
				menuId : paramRowData.menuId,
				badId : paramRowData.badId,
				badNum : paramRowData.badNum,
    	}
    	
    	
    	if(paramRowData.delCd=='02' && badHitYn == true){
    		data.badHit = true;
    	}else{
    		data.badHit = false;
    	}
    	
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/bad/bad1000/bad1000/selectBad1001InfoAjax.do'/>"}
				, data);
    	
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var setBad = data.bad1001Info;
				var tagList = data.bad1001Tag;
				var fileList = data.bad1001FileList;
				var fileCnt = data.bad1001FileListCnt;
				
				
				
				
				$("#badTitleDiv").empty();
				var titleStr = "";
				var title = $.osl.escapeHtml(setBad.badTitle);
				
				
				if(setBad.badNtcCheck=='01' && paramRowData.stmNtcYnCd=='01'){
					
					titleStr += "<span class='kt-badge kt-badge--danger kt-badge--inline kt-badge--pill kt-margin-5'>"+$.osl.lang("bad1000.label.noticeBadge")+"</span>";
					titleStr += title;
				}else{
					titleStr += title;
				}
				
				if(setBad.badPw == '01'){
					titleStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
				}
				
				if(setBad.delCd=='01' && $("#stmRootYn").val()=='Y'){
					titleStr = "<span class='kt-badge kt-badge--dark kt-badge--inline kt-badge--pill kt-margin-5'>"+$.osl.lang("bad1000.label.deleteBadge")+"</span>" + titleStr;
					
					$("#updateBtn").addClass("kt-hide");
					$("#deleteBtn").addClass("kt-hide");
					
					$("#badDelCd").val("01");
					
					$("#restoreBtn").removeClass("kt-hide");
				}else{
					
					$("#updateBtn").removeClass("kt-hide");
					$("#deleteBtn").removeClass("kt-hide");
					
					$("#badDelCd").val("02");
					
					$("#restoreBtn").addClass("kt-hide");
				}
				$("#badTitleDiv").append(titleStr);
				
				
				var usrData = {
						html: setBad.badUsrNm + " (" +setBad.badUsrId + ")",
						imgSize: "sm",
						class:{
							cardBtn: "osl-width__fit-content"
						}
				};
				$("#writerDiv").html($.osl.user.usrImgSet(setBad.badUsrImgId, usrData));
				$("#writerDiv").data("badUsrId", setBad.badUsrId);
				
				
				$("#writerDiv>.kt-user-card-v2.btn.osl-width__fit-content").children("div").click(function(){
					$.osl.user.usrInfoPopup(setBad.badUsrId);
				});
				
				
				$("#writeDateDiv").text($.osl.lang("bad1001.label.writeDate")+ " : " + setBad.badWtdtm);
				
				
				$("#badContentDiv").html(setBad.badContent);
				
				
				if(paramRowData.stmFileCnt != '0' && fileList != null && fileList != ""){
					$("#badFileOption").removeClass("kt-hide");
					
					
			    	fileUploadObj.setMeta({fileSn: parseInt(fileCnt)+1});
			    	
			    	
			    	$.osl.file.fileListSetting(fileList, fileUploadObj);
				}else{
					$("#badFileOption").addClass("kt-hide");
				}
				
				
				if(paramRowData.stmTagYnCd == '01' && tagList != null && tagList[0] != null)
				{
					$("#badTagOption").removeClass("kt-hide");
					$.each(tagList, function(idx, value){
						
						var innerHtml = "";
	                	innerHtml += "<tag title='"+$.osl.escapeHtml(value)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-padding-5' style='display: inline-flex; margin: 3px;' role='tag' value='"+$.osl.escapeHtml(value)+"'>";
	                	innerHtml += "<div><div class='tagify__tag-text kt-margin-l-5 kt-margin-r-5'>#"+$.osl.escapeHtml(value)+"</div></div></tag>";
	                	
	                	$("#tagListDiv").append(innerHtml);
	                	tag.push(value);
					});
					
					
					$("tag").click(function(){
						var data = {
							searchTargetId : "tagNm",
							searchTargetData : $(this).attr("value"),
						}
						
						$.osl.datatable.list["bad1000BadTable"].targetDt.setDataSourceParam("searchTargetId", "tagNm");
						$.osl.datatable.list["bad1000BadTable"].targetDt.setDataSourceParam("searchTargetData", $(this).attr("value"));
						
						
						$.osl.layerPopupClose();
						
						$("button[data-datatable-id=bad1000BadTable][data-datatable-action=select]").click();
					});
				}else{
					$("#badTagOption").addClass("kt-hide");
				}
				
				
				
				if(paramRowData.stmCmtYnCd == "01"){
					
					if(setBad.badCmtYn == "01"){
						$("#badCmtDiv").removeClass("kt-hide");
						$("#badCmtInput").removeClass("kt-hide");
						
						$("#loginUsr").empty();
						var usrData = {
								html: $.osl.user.userInfo.usrNm + " (" + $.osl.user.userInfo.usrId + ")",
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
						};
						$("#loginUsr").append($.osl.user.usrImgSet($.osl.user.userInfo.usrImgId, usrData));
						$("#loginUsr").click(function(){
							$.osl.user.usrInfoPopup($.osl.user.userInfo.usrId);
						});
					}else{
						
						$("#badCmtInput").addClass("kt-hide");
					}

					
			    	$("#cmtWriter").on("keypress", function(e){
			    		if(e.key == "Enter"){
			    			$("#cmtSaveBtn").click();		
			    		}
			    	});
				}else{
					
					$("#badCmtDiv").addClass("kt-hide");
				}

				
				
				OSLBad1000Popup.reload();
			}
    	});
    	
    	
		ajaxObj.send();
	};

	
	
    var selectCmtList = function(){
		$("button[data-datatable-id=bad1001CmtTable][data-datatable-action=select]").click();
	};
	
	
    
    var insertCmtInfo = function(){
    	
		var data={
    			menuId : paramRowData.menuId,
    			badId : paramRowData.badId,
    			badCmtContent: $.osl.escapeHtml($("#cmtWriter").val()),
   			};
    	
    	
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/bad/bad1000/bad1100/insertBad1100CmtInfoAjax.do'/>"}
				, data);
    	
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				$("#cmtWriter").val('');
				
				
   				OSLBad1000Popup.reload();
				selectCmtList();
			}
		});
		
		
		ajaxObj.send();
	};
	
	 
	 var checkUser = function(){
		 var data = {
				 authGrpId : $.osl.selAuthGrpId,
				 prjGrpId :$.osl.selPrjGrpId,
	   			 prjId : $.osl.selPrjId,
				 menuId : $("#menuId").val(),
				 dsTypeCd : $("#stmDsTypeCd").val(),
		 };
		
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2100UserCheckAjax.do'/>", "async": false}
				, data);
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var result = data.result;
				if(result.resultManager == "Y"){
					okManager = true;	
				}else{
					
					if($("#stmRootYn").val()=='Y'){
						okManager = true;
					}else{
						
						okManager = false;
					}
				}
				
				
				if(result.resultWriter == "Y" || result.resultWriter == "B"){
					okWriter = true;	
				}else{
					okWriter = false;
				}
			}
		});
		
    	
		ajaxObj.send();
	 };
    
    return {
        init: function() {
        	documentSetting();
        },
        reDraw: function(badId) {
        	
        	selectBadInfo(true);
        }
    };
}();

$.osl.ready(function(){
	OSLBad1001Popup.init();
});
</script>