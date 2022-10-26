function up_ok(){
    if(confirm("게시글을 작성하시겠습니까?"))
    {
     location.href="/cookTeacher/bobstory/list";
    }
    else
    {
    alert('게시글 작성을 취소합니다.');
    }
    $.ajax({
        url : "/cookTeacher/bobstory/write",
        method : "get",
        //data : "",
        success : function(){
            Swal.fire({
                icon : 'success',
                text : '게시글 작성 성공 !!!'
            });
        },
        error : function(){
            Swal.fire({
                icon : 'error',
                text : '게시글 작성 실패 !!!'
            });
        }
    });

    

}


