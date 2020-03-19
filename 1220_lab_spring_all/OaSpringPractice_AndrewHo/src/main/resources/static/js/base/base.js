
var baseModel = {
		"sep": "_"
		, "name": "base"
		, init() {
			this.searchPage = this.name + this.sep + 'Search' + this.sep + 'Page';
			this.searchResult = this.name + this.sep + 'Search' + this.sep + 'Result';
			this.searchForm = this.name + this.sep + 'Search' + this.sep + 'Form';
			this.createPage = this.name + this.sep + 'Create' + this.sep + 'Page';
			this.createForm = this.name + this.sep + 'Create' + this.sep + 'Form';
			this.updatePage = this.name + this.sep + 'Update' + this.sep + 'Page';
			this.updateForm = this.name + this.sep + 'Update' + this.sep + 'Form';
			this.currentPage = this.searchPage;
			this.btns = {
					'searchPage_search': this.name + this.sep + 'search' + this.sep + 'btn'
					, 'searchPage_create': this.name + this.sep + 'create' + this.sep + 'btn'
					, 'searchPage_print': this.name + this.sep + 'print' + this.sep + 'btn'
					, 'searchPage_delete': this.name + this.sep + 'delete' + this.sep + 'btn'
					, 'createPage_save': this.name + this.sep + 'save' + this.sep + 'btn'
					, 'createPage_cancel': this.name + this.sep + 'cancel' + this.sep + 'btn'
					, 'updatePage_save': this.name + this.sep + 'save' + this.sep + 'btn'
					, 'updatePage_cancel': this.name + this.sep + 'cancel' + this.sep + 'btn'
			}
			
			if ($('#' + this.searchPage + ' #' + this.btns.searchPage_search)) {
				$('#' + this.searchPage + ' #' + this.btns.searchPage_search).click(()=>{this.search()});
			}
			if ($('#' + this.searchPage + ' #' + this.btns.searchPage_create)) {
				$('#' + this.searchPage + ' #' + this.btns.searchPage_create).click(()=>{this.preCreate()});
			}
			
			if ($('#' + this.searchPage + ' #' + this.btns.searchPage_print)) {
				$('#' + this.searchPage + ' #' + this.btns.searchPage_print).click(()=>{this.print()});
			}
			
			var self = this;
			$('#' + this.searchPage).on("click", '#' + this.btns.searchPage_delete, function() {
				self.delete();
			});
			$('#' + this.searchPage).on("click", "#check_all", function() {
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
			
			$('#' + this.searchPage).on("click", 'a.page-link', function(e) {
				e.preventDefault();
				var href = $(this).attr('href');
				var pageNum = href.substring(href.lastIndexOf('=') + 1);
				$('#' + self.searchForm + ' input[name="page"]').val(pageNum);
				self.search();
			});
			$('#' + this.searchPage).on("click", 'a.sorted', function(e) {
				e.preventDefault();
				var href = $(this).attr('href');
				var sort = href.substring(href.lastIndexOf('=') + 1);
				$('#' + self.searchForm + ' input[name="sort"]').val(sort);
				self.search();
			});
			
		}
		, search() {
			$.ajax({
				  url: "doSearch",
				  method: 'post',
				  data: $('#' + this.searchForm).serialize() ,
				  success: (result) => {
					  if (result.indexOf('error:') > -1) {
						  this.handleError(result);
					  } else {
						  if ($('#' + this.searchPage + ' #' + this.searchResult)) {
								$('#' + this.searchPage + ' #' + this.searchResult).html(result);
							}
					  }
				  }
				});
		}
		, print() {
			$('#' + this.searchForm).attr('action', 'doPrint').attr('target', '_blank').submit();
//			$.ajax({
//				  url: "doPrint",
//				  method: 'post',
//				  data: $('#' + this.searchForm).serialize() ,
//				  success: (result) => {
//					  if (result.indexOf('error:') > -1) {
//						  this.handleError(result);
//					  } else {
//						  var a = document.createElement('a');
//				            var url = window.URL.createObjectURL(result);
//				            a.href = url;
//				            a.download = 'myfile.pdf';
//				            a.click();
//				            window.URL.revokeObjectURL(url);
//						  var blob=new Blob([result]);
//						    var link=document.createElement('a');
//						    link.href=window.URL.createObjectURL(blob);
//						    link.download="test.pdf";
//						    link.click();
//					  }
//				  }
//				});
		}
		, preCreate() {
			$.get('create', (result) => {
				this.changePage(this.createPage, this.searchPage);
				$('#' + this.createPage).html(result);
				if ($('#' + this.createPage + ' #' + this.btns.createPage_save)) {
					$('#' + this.createPage + ' #' + this.btns.createPage_save).click(()=> {this.create()});
				}
				
				if ($('#' + this.createPage + ' #' + this.btns.createPage_cancel)) {
					$('#' + this.createPage + ' #' + this.btns.createPage_cancel).click(() => {this.cancel()});
				}
			});
		}
		, create() {
			$.ajax({
				  url: "doCreate",
				  method: 'post',
				  data: $('#' + this.createForm).serialize() ,
				  success: (result) => {
					  if (result.indexOf('error:') > -1) {
						  this.handleError(result);
					  } else {
						  this.cancel();
					  }
					  
				  }
				});
		}, preUpdate(key) {
			$.get('update', {'key': key}, (result) => {
				this.changePage(this.updatePage, this.searchPage);
				$('#' + this.updatePage).html(result);
				if ($('#' + this.updatePage + ' #' + this.btns.updatePage_save)) {
					$('#' + this.updatePage + ' #' + this.btns.updatePage_save).click(()=> {this.update()});
				}
				
				if ($('#' + this.updatePage + ' #' + this.btns.updatePage_cancel)) {
					$('#' + this.updatePage + ' #' + this.btns.updatePage_cancel).click(()=> {this.cancel()});
				}
			});
		}, update() {
			$.ajax({
				  url: "doUpdate",
				  method: 'post',
				  data: $('#' + this.updateForm).serialize() ,
				  success: (result) => {
					  if (result.indexOf('error:') > -1) {
						  this.handleError(result);
					  } else {
						  this.cancel();
					  }
					  
				  }
				});
		}, delete() {
			const targets = $("input[id='check']:checked").toArray().map(v => 'keys=' + v.value).join('&');
			$.ajax({
				  url: "doDelete",
				  method: 'post',
				  data: targets ,
				  success: (result) => {
					  if (result.indexOf('error:') > -1) {
						  this.handleError(result);
					  } else {
						  this.search();
					  }
				  }
				});
		}, changePage(openPage) {
			$('#' + this.currentPage).hide();
			$('#' + openPage).show();
			this.currentPage = openPage;
		}, cancel() {
			this.changePage(this.searchPage);
			this.search();
		}, handleError(msg) {
			alert(msg);
		}
};

