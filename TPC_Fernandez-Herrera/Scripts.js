function Validar() {
    var nombre = document.getElementById("TxtNombre").value;

    if (nombre === "") {
        alert("colocar Nombre")
        return false;
    }
    return true;
} 