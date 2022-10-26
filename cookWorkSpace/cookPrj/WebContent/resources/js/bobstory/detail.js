function delete_b(){
    
    Swal.fire({
        title: '삭제 하시겠습니까?',
        text: "삭제하면 돌이킬 수없습니다",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '삭제',
        cancelButtonText: '취소'
      }).then((result) => {
        if (result.isConfirmed) {
          Swal.fire(
            '삭제 완료 !',
            '게시글 삭제가 완료되었습니다.',
            'success'
          )
        }
      })
}
