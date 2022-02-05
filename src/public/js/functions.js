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
}


