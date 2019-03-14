$(function(){

$.ajax ({
    url: '/checkj',
    dataType: "json",
    contentType: "application/json",
    success: function (jsonData) {
    try {
            var newData = [];

     for (var i = 0; i < jsonData.myCollection.length; i++) {

      var obj = {
       label: jsonData.myCollection[i].doctor_name,
       value: jsonData.myCollection[i].doctor_name,
       label_patient_name: jsonData.myCollection[i].patient_name,
       value_patient_name: jsonData.myCollection[i].patient_name,
       label_start_time: jsonData.myCollection[i].start_time,
       value_start_time: jsonData.myCollection[i].start_time,
       id: jsonData.myCollection[i].ID
      }

      newData.push(obj);

     };
       try{
       $listSelector = $("#list") //Your list element

$.each(newData, function(i, obj) {
 var li = $('<li>')
    $listSelector.append("<li"+" class='list-group-item active' "+">"+"Patient Name : "+obj.value_patient_name+" "+ "Doctors Name : "+obj.value+" <br>" +"Start time : "+obj.value_start_time+"</li>")
})
         console.log(newData)
         }
        catch(e){
            alert("oops");
          }

       }
        catch(e){
           alert("try again, good luck!");
           }
        // Success callback

    },
    error: function() {
        //any error to be handled
    }
 });

});