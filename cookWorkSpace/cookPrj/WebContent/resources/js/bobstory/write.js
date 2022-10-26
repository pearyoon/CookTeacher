function up_ok(){
    if(confirm("게시글을 작성하시겠습니까?"))
    {
     location.href="/cookTeacher/bobstory/list";
    }
    else
    {
    alert('게시글 작성을 취소합니다.');
    }

    

}


