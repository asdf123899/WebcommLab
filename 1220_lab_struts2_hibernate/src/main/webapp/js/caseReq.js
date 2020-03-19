
var caseReqModel = {};

caseReqModel.init = () => {
	caseReqModel.sep = '_';
	caseReqModel.name = 'caseReq';
	caseReqModel.searchPage = caseReqModel.name + caseReqModel.sep + 'Search' + caseReqModel.sep + 'Page';
	caseReqModel.searchForm = caseReqModel.name + caseReqModel.sep + 'Search' + caseReqModel.sep + 'Form';
	caseReqModel.createPage = caseReqModel.name + caseReqModel.sep + 'Create' + caseReqModel.sep + 'Page';
	caseReqModel.createForm = caseReqModel.name + caseReqModel.sep + 'Create' + caseReqModel.sep + 'Form';
	caseReqModel.updatePage = caseReqModel.name + caseReqModel.sep + 'Update' + caseReqModel.sep + 'Page';
	caseReqModel.updateForm = caseReqModel.name + caseReqModel.sep + 'Update' + caseReqModel.sep + 'Form';
	caseReqModel.currentPage = caseReqModel.searchPage;
	caseReqModel.btns = {
			'searchPage_search': caseReqModel.name + caseReqModel.sep + 'search' + caseReqModel.sep + 'btn'
			, 'searchPage_create': caseReqModel.name + caseReqModel.sep + 'create' + caseReqModel.sep + 'btn'
			, 'searchPage_print': caseReqModel.name + caseReqModel.sep + 'print' + caseReqModel.sep + 'btn'
			, 'searchPage_delete': caseReqModel.name + caseReqModel.sep + 'delete' + caseReqModel.sep + 'btn'
			, 'createPage_save': caseReqModel.name + caseReqModel.sep + 'save' + caseReqModel.sep + 'btn'
			, 'createPage_cancel': caseReqModel.name + caseReqModel.sep + 'cancel' + caseReqModel.sep + 'btn'
			, 'updatePage_save': caseReqModel.name + caseReqModel.sep + 'save' + caseReqModel.sep + 'btn'
			, 'updatePage_cancel': caseReqModel.name + caseReqModel.sep + 'cancel' + caseReqModel.sep + 'btn'
	}
	
	if ($('#' + caseReqModel.searchPage + ' #' + caseReqModel.btns.searchPage_search)) {
		$('#' + caseReqModel.searchPage + ' #' + caseReqModel.btns.searchPage_search).click(() => {
			$('#searchBean_currentPage').val(1);
			caseReqModel.search();
		});
	}
	if ($('#' + caseReqModel.searchPage + ' #' + caseReqModel.btns.searchPage_print)) {
		$('#' + caseReqModel.searchPage + ' #' + caseReqModel.btns.searchPage_print).click(caseReqModel.print);
	}
	if ($('#' + caseReqModel.searchPage + ' #' + caseReqModel.btns.searchPage_create)) {
		$('#' + caseReqModel.searchPage + ' #' + caseReqModel.btns.searchPage_create).click(caseReqModel.preCreate);
	}
	if ($('#' + caseReqModel.searchPage + ' #' + caseReqModel.btns.searchPage_delete)) {
		$('#' + caseReqModel.searchPage + ' #' + caseReqModel.btns.searchPage_delete).click(caseReqModel.delete);
	}
	
	if ($('#' + caseReqModel.btns.createPage_save)) {
		$('#' + caseReqModel.btns.createPage_save).click(caseReqModel.create);
	}

	if ($('#' + caseReqModel.btns.createPage_cancel)) {
		$('#' + caseReqModel.btns.createPage_cancel).click(caseReqModel.cancel);
	}

	if ($('#' + caseReqModel.btns.updatePage_save)) {
		$('#' + caseReqModel.btns.updatePage_save).click(caseReqModel.update);
	}

	if ($('#' + caseReqModel.btns.updatePage_cancel)) {
		$('#' + caseReqModel.btns.updatePage_cancel).click(caseReqModel.cancel);
	}

	if ($('#check_all')) {
		$('#check_all').click(() => {
			if($("#check_all").prop("checked")) {
				$("input[id='check']").each(function() {
			         $(this).prop("checked", true);
			     });
			} else {
				$("input[id='check']").each(function() {
			         $(this).prop("checked", false);
			     });           
			}
		});
	}
	
}

caseReqModel.search = () => {
	$('#' + caseReqModel.searchForm).attr('action', 'doSearch.action').attr('target', '_self').submit();
}
caseReqModel.print = () => {
	$('#' + caseReqModel.searchForm).attr('action', 'doPrint.action').attr('target', '_blank').submit();
}
caseReqModel.preCreate = () => {
	location.href = 'create.action';
}

caseReqModel.create = () => {
	$('#' + caseReqModel.createForm).submit();
}

caseReqModel.preUpdate = (key) => {
	location.href = 'update.action?key=' + key;
}

caseReqModel.update = () => {
	$('#' + caseReqModel.updateForm).submit();
}

caseReqModel.delete = () => {
	var ans =confirm("確認刪除嗎?");
	if (ans) {
		const targets = $("input[id='check']:checked").toArray().map(v => 'keys=' + v.value).join('&');
		location.href = 'doDelete.action?' + targets;
	}
}

caseReqModel.cancel = () => {
	location.href = "doSearch.action";
}

$(()=>{
	caseReqModel.init();
});