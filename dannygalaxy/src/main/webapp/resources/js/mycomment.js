/**
 * mycomment.js : 댓글/답글 데이터 처리용 Ajax Closure Module*/
 
 //alert("댓글처리 클로저 모듈");
 
var myCommentClsr = ( function() {
	
	function getCmtList(param, callback, error) {
		var bno = param.bno ;
		
		$.ajax({
			type: "get",
			url: "/dannygalaxy/replies/" + bno ,
			dataType: "json",
			contentType:"application/json; charset=utf-8",
			success: function(replyList, status, xhr){
				if(callback) {
					callback(replyList) ;
				}
			} ,
			error: function(xhr, status, er) {
				if(error){
					error(er) ;
				}
			}
		
		}); //ajax-end
	} //getCmtList-end
	
	function registerCmt(comment, callback, error){
		var bno = comment.bno ;	
		$.ajax({
			type: "post" ,
			url: "/dannygalaxy/replies/" + bno + "/new" ,
			data: JSON.stringify(comment) ,
			contentType: "application/json; charset=utf-8" ,
			success: function(result, status, xhr){
				if(callback){
					callback(result) ;
				}
			},
			
			error: function(xhr, status, err){
				if(error){
					error(err) ;
				}
			}
		}); //ajax-end
	
	}//registerCmt-end
	
	
	function registerReply(reply, callback, error){
		var bno = reply.bno ;
		var prno = reply.prno ;
		
		$.ajax({
			type: "post" ,
			url: "/dannygalaxy/replies/" + bno + "/" + prno + "/new" ,
			data: JSON.stringify(reply) ,
			contentType: "application/json; charset=utf-8" ,
			success: function(result, status, xhr){
				if(callback){
					callback(result) ;
				}
			},
			
			error: function(xhr, status, err){
				if(error){
					error(err) ;
				}
			}
		}); //ajax-end
	
	}//registerReply-end
	
	function getCmtReply (bnoAndRno, callback, error) {
		var bno = bnoAndRno.bno ;
		var rno = bnoAndRno.rno ;
		
		$.ajax({
			type: "get" ,
			url: "/dannygalaxy/replies/" + bno + "/" + rno ,
			dataType: "json" ,
			success: function(data, status, xhr){  
				if(callback){
					callback(data) ;
				}
			},
			
			error: function(xhr, status, err){
				if(error){
					error(err) ;
				}
			}
		
		});//ajax-end
		
	}
	
	function modifyCmtReply(cmtReply, callback, error) {
	
		var bno = cmtReply.bno ;
		var rno = cmtReply.rno ;
		
		$.ajax({
			type: "put" ,
			url: "/dannygalaxy/replies/" + bno + "/" + rno ,
			data: JSON.stringify(cmtReply) ,
			contentType: "application/json; charset=utf-8" ,
			dataType: "text" ,
			success: function(result, status, xhr){  
				if(callback){
					callback(result) ;
				}
			},
			
			error: function(xhr, status, err){
				if(error){
					error(err) ;
				}
			}

		}); //ajax-end
	
	
	}//modifyCmtReply-end
	
	
	function removeCmtReply(cmtReply, callback, error) {
		var bno = cmtReply.bno ;
		var rno = cmtReply.rno ;
		
		$.ajax({
			type: "delete" ,
			url: "/dannygalaxy/replies/" + bno + "/" + rno ,
			dataType: "text" ,
			success: function(result, status, xhr){  
				if(callback){
					callback(result) ;
				}
			},
			
			error: function(xhr, status, err){
				if(error){
					error(err) ;
				}
			}
			
		
		
		}); //ajax-end
		
		
		
		
	}  //removeCmtReply-end
	

	return {
		getCmtList: getCmtList ,
		registerCmt: registerCmt ,
		registerReply: registerReply ,
		getCmtReply: getCmtReply ,
		modifyCmtReply: modifyCmtReply ,
		removeCmtReply: removeCmtReply
	}

})(); 