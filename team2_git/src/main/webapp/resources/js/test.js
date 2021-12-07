window.showExample = (u_id,t_id) => {
Swal.fire({
  title: '리뷰',
  html: `
  
  <input type="text" id="login" class="swal2-input" placeholder="Username" value="u_id">
  <input type="password" id="password" class="swal2-input" placeholder="Password">
              <input type="hidden" name="re_point" id="re_point" value="3"/>
            <input type="hidden" name="u_id" value="'+u_id+'" id="u_id" class="swal2-input">
			 <input type="hidden" name="t_id" value="'+t_id+'" id="t_id" class="swal2-input">
             
               <textarea rows="10" name="re_coment" class="review_textarea" id="re_coment"></textarea>
          
  `,
  confirmButtonText: '등록',
  focusConfirm: false,
  preConfirm: () => {
    const login = Swal.getPopup().querySelector('#login').value
    const password = Swal.getPopup().querySelector('#password').value
    
    const re_point = Swal.getPopup().querySelector('#re_point').value
    const u_id = Swal.getPopup().querySelector('#u_id').value
    const t_id = Swal.getPopup().querySelector('#t_id').value
    const re_coment = Swal.getPopup().querySelector('#re_coment').value
    if (!login || !password) {
      Swal.showValidationMessage(`Please enter login and password`)
    }
    return { u_id: u_id, t_id: t_id }
  }
}).then((result) => {
  Swal.fire(`
    Login: ${result.value.u_id}
    Password: ${result.value.t_id}
  `.trim())
})
}