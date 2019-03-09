const showHideModal = (buttonId, dialogId) => {
    const button = document.querySelector(buttonId)
    const dialog = document.querySelector(dialogId)
    if(button && dialog){
        const close = dialog.querySelector(".dialog__close")
        button.addEventListener('click', ()=>{
            dialog.showModal()
            close.addEventListener("click", hideModal)
        })
    }

    const hideModal = () => {
        dialog.close()
        close.removeEventListener("click", hideModal)
    }
}

document.addEventListener("turbolinks:load", ()=>{
    showHideModal('#show-project-details', '#project-details-dialog')
    showHideModal('#show-add-hours', '#add-hours-dialog')
})