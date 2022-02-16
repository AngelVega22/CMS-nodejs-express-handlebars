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


$(document).ready(function () {

    var current_fs, next_fs, previous_fs; //fieldsets
    var opacity;

    $(".next").click(function () {

        current_fs = $(this).parent();
        next_fs = $(this).parent().next();

        //Add Class Active
        $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

        //show the next fieldset
        next_fs.show();
        //hide the current fieldset with style
        current_fs.animate({ opacity: 0 }, {
            step: function (now) {
                // for making fielset appear animation
                opacity = 1 - now;

                current_fs.css({
                    'display': 'none',
                    'position': 'relative'
                });
                next_fs.css({ 'opacity': opacity });
            },
            duration: 600
        });
    });

    $(".previous").click(function () {

        current_fs = $(this).parent();
        previous_fs = $(this).parent().prev();

        //Remove class active
        $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

        //show the previous fieldset
        previous_fs.show();

        //hide the current fieldset with style
        current_fs.animate({ opacity: 0 }, {
            step: function (now) {
                // for making fielset appear animation
                opacity = 1 - now;

                current_fs.css({
                    'display': 'none',
                    'position': 'relative'
                });
                previous_fs.css({ 'opacity': opacity });
            },
            duration: 600
        });
    });

    $('.radio-group .radio').click(function () {
        $(this).parent().find('.radio').removeClass('selected');
        $(this).addClass('selected');
    });

    $(".submit").click(function () {
        return false;
    })

});