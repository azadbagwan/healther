 $(document).ready(function(){

     $("#btn_add_patient").click(function(event){
      if($.trim($('#name_of_patient').val()) == ''){
      alert('Input can not be left blank');
   }
   else{
      console.log("form medicine submit initiated")
     $.ajax({
          url :'/add_patient_j',
         type :'POST',
         data : {
                name_of_patient : $('#name_of_patient').val(),
                age_of_patient : $('#age_of_patient').val(),
                birth_date_of_patient : $('#birth_date_of_patient').val(),
                email_of_patient : $('#email_of_patient').val(),

                      phone_number_of_patient : $('#phone_number_of_patient').val(),
                         known_history_of_patient : $('#known_history_of_patient').val()


         }

     })
     .done(function(jsonData){
         if (jsonData.error){
              $('#errorAlert').text(jsonData.error).show();
              $('#successAlert').hide();
              alert("Unsuccessful! Please try again.");
         }
         else {

               $('#successAlert').text(jsonData.success).show();
                 $('#errorAlert').hide();
                 alert("Patient added successfully!");


         }
     });
     }
     event.preventDefault();
     });
});