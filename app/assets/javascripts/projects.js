const showHideModal = () => {
    const button = document.getElementById('show-project-details')
    const dialog = document.getElementById('project-details-dialog')
    button.addEventListener('click', ()=>{
        dialog.showModal()
    })
}

document.addEventListener("DOMContentLoaded", ()=>{
    showHideModal()
})