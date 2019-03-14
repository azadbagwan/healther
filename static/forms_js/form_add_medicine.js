 $(document).ready(function(){

     $('form').on('submit', function(event){
      if($.trim($('#name_of_medicine').val()) == ''){
      alert('Input can not be left blank');
   }
   else{
      console.log("form medicine submit initiated")
     $.ajax({
          url :'/add_medicine_j',
         type :'POST',
         data : {
                name_of_medicine : $('#name_of_medicine').val(),
                name_of_manufacturer : $('#name_of_manufacturer').val(),
                for_treatment_of : $('#for_treatment_of').val(),
                composition_of_medicine : $('#composition_of_medicine').val(),


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
                 alert("Medicine added successfully!");


         }
     });
     }
     event.preventDefault();
     });
});