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



filterSelection("all")
function filterSelection(c) {
    var x, i;
    x = document.getElementsByClassName("filterDiv");
    if (c == "all") c = "";
    for (i = 0; i < x.length; i++) {
        w3RemoveClass(x[i], "show");
        if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
    }
}

function w3AddClass(element, name) {
    var i, arr1, arr2;
    arr1 = element.className.split(" ");
    arr2 = name.split(" ");
    for (i = 0; i < arr2.length; i++) {
        if (arr1.indexOf(arr2[i]) == -1) { element.className += " " + arr2[i]; }
    }
}

function w3RemoveClass(element, name) {
    var i, arr1, arr2;
    arr1 = element.className.split(" ");
    arr2 = name.split(" ");
    for (i = 0; i < arr2.length; i++) {
        while (arr1.indexOf(arr2[i]) > -1) {
            arr1.splice(arr1.indexOf(arr2[i]), 1);
        }
    }
    element.className = arr1.join(" ");
}

// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function () {
        var current = document.getElementsByClassName("active");
        current[0].className = current[0].className.replace(" active", "");
        this.className += " active";
    });
}


