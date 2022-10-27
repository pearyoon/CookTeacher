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

$('#bobImg').change(function(){
    if(this.file && this.files[0]){
        var reader = new FileReader;
        reader.onload = function(data){
            $('.select_img img').attr("src", data.target.result).width(500);
        }
        reader.readAsDataURL(this.files[0]);
    }
});
