(function () {
    window.addEventListener('load', function () {
        var forms = document.getElementsByClassName('needs-validation');

        Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();
$(document).ready(function () {
    $('#table_id').DataTable();
});

// const url = 'https://famososartistas.herokuapp.com/api/artistas'

// fetch(url, {
//     method: "GET",
//     headers: {
//         "Content-Type": "application/json",
//     },
// })
//     .then((response) => response.json())
//     .then((data) => {
//         for (var i = 0; i < data.length; i++) {
//             const jsons = JSON.stringify(data[i].nombreArtista)
//             let element = document.getElementById('elem')
//             const e = document.createElement('p')
//             e.innerHTML = jsons
//             element.appendChild(e)
//             console.log(e)
//         }
//         return data;
//     }
//     ); 


function activarInput() {
    document.getElementById('activate').disabled = false
    document.getElementById('activate2').disabled = false
    document.getElementById('activate3').disabled = false
    document.getElementById('activate4').disabled = false
    document.getElementById('activate5').disabled = false
    document.getElementById('activate6').disabled = false
    document.getElementById('activate7').disabled = false
    document.getElementById('activate8').disabled = false
    document.getElementById('activate9').disabled = false
    document.getElementById('activate10').disabled = false
}




function myFunction() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
            // document.getElementById('sihay').innerHTML = "Mucha suerte en tu busqueda "
            // document.getElementById('sihay').style.display = "none "
            document.getElementById('sihay').style.display = "none"
            document.getElementById('llama').style.display = "none"
        } else {

            li[i].style.display = "none";
            if (li[i].style.display = "none") {
                document.getElementById('sihay').innerHTML = "Buena suerte en tu busqueda"
                document.getElementById('sihay').style.display = ""
                document.getElementById('llama').style.display = ""

            }
        }
    }
}

// document.getElementById('sihay').innerHTML = "HOLA"


