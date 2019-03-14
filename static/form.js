$(document).ready(function(){

form1();

});

function formvalidate(){
}
function form1(){

$('form').on('submit', function(event){
    event.preventDefault();
       if($.trim($('#patients_name').val()) =='' || $.trim($('#doctors_name').val()) =='' ){
      alert('Inputs can not be left blank');
   }
   else{
    console.log("in form")
     $.ajax({
          url :'/appointment_date',
         type :'POST',
         data : {
                patient_name : $('#patients_name').val(),
                doctors_name : $('#doctors_name').val(),
                start_time : $('#start_time').val() +" "+ $('#start_time_t').val(),
                end_time : $('#end_time').val()+" "+ $('#end_time_t').val(),
                comments : $('#comments').val(),
         }

     })
     .done(function(jsonData){
         if (jsonData.error){
              $('#errorAlert').text(jsonData.error).show();
              $('#successAlert').hide();
         }
         else {

               $('#successAlert').text(jsonData.success).show();
                 $('#errorAlert').hide();
                 console.log("about to load calendar")

               $("#calendar").fullCalendar("refetchEvents");





               }
     });
}
     });

}


function loadcalendar2(){
console.log("trying to load calendar");
$('#calendar').fullCalendar({

			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},

			editable: true,
			eventLimit: true, // allow "more" link when too many events
			eventSources: [

    // your event source
    {
      url: '/fullcalendarjson', // use the `url` property
      color: 'green',    // an option!
      textColor: 'white'  // an option!
    }

    // any other sources...

  ],
			loading: function(bool) {
				$('#loading').toggle(bool);
			}
		});
}