function validarRegistro() {
    let nombre = document.getElementById("TxtNombre").value;
    let claseNombre = document.getElementsByClassName("controls")

    let ok = true;

    if (nombre == "") {

        $("TxtNombre").addClass("is-valid")
        alert("anda")
        ok = false
        claseNombre.classList.add(" is-invalid");
        return  false;
    } else {

        return ok;
    }
} 