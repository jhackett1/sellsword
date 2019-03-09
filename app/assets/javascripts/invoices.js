
const appendRow = () => {
}

const addChargeRows = () => {
    const button = document.querySelector("#append-charge-row")
    const container = document.querySelector("#charges-table-body")
    button.addEventListener("click", (e) => {
        e.preventDefault()

        const template = document.createElement('tr')
        template.innerHTML = `
                <td><input class="form-input" type="text" name="invoice[charges_attributes][${i}][description]" id="invoice_charges_attributes_${i}_description"></td>
                <td><textarea class="form-input" name="invoice[charges_attributes][${i}][notes]" id="invoice_charges_attributes_${i}_notes"></textarea></td>
                <td><input class="form-input" type="number" name="invoice[charges_attributes][${i}][hours]" id="invoice_charges_attributes_${i}_hours"></td>
                <td><input class="form-input" type="number" name="invoice[charges_attributes][${i}][rate]" id="invoice_charges_attributes_${i}_rate"></td>
            `
        container.append(template)

    })
}

let i = 1

document.addEventListener("turbolinks:load", ()=>{
    addChargeRows()
})