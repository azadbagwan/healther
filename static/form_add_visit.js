 $(document).ready(function(){

     $('form').on('submit', function(event){
      if($.trim($('#reason_for_visit').val()) == ''){
      alert('Input can not be left blank');
   }
   else{
      console.log("form submit initiated")
     $.ajax({
          url :'/add_visit_jsont',
         type :'POST',
         data : {
                reason_for_visit : $('#reason_for_visit').val(),
                diagnosis : $('#diagnosis').val(),
                comments : $('#comments').val(),
                systolic_bloodpressure : $('#systolic_bloodpressure').val(),
                diastolic_bloodpressure  : $('#diastolic_bloodpressure').val(),
                temperature : $('#temperature').val(),
                sugar : $('#sugar').val(),
                total_amount : $('#total_amount').val(),
                paid_amount : $('#paid_amount').val(),
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
                 alert("Visit added successfully!");


         }
     });
     }
     event.preventDefault();
     });
});