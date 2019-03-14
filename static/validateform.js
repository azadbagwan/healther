$(document).ready(function () {



});


function validation(){
$('#formbook').validate({ // initialize the plugin
        rules: {
            patients_name: {
                required: true,
                email: true
            },
            doctors_name: {
                required: true,
                minlength: 5
            }
        }
    });
}