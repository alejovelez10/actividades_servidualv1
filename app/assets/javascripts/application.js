// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require chosen-jquery
//= require twitter/bootstrap
//= require ckeditor-jquery
//= require turbolinks
//= require moment 
//= require fullcalendar
//= require config
//= require_tree .


$(document).on('turbolinks:load',function() {
$('.ck').ckeditor({
  // optional config
});
$("#calendar").fullCalendar({

    



    selectable:true,
    selectHelper:true,
    editable:true,
     events: "/actividads/get_events",
     timeFormat: "h:mm t{ - h:mm t} ",
     monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
         dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
    dayNamesShort: ['Dom','Lun','Mar','Mié','Jue','Vie','Sáb'],
    buttonText: ['Hoy', 'month', 'week', 'day', 'list'],
header: {
                left: 'prev,next Hoy',
                center: 'title',
                right: 'month,agendaWeek,today'
            },
buttonText:{
    today:    'Hoy',
    month:    'Mes',
    week:     'Semana',
    day:      'Dia',
    list:     'Lista'
},
eventClick: function(event, jsEvent, view) {
        window.location.href = "/actividads/" + event.id;

      }




  });


    $('.sh1').chosen(
          {
      
            allow_single_deselect: true,
            no_results_text: 'No hay resultados',
            width: '200px',
            placeholder_text_single: "Responsable",
            placeholder_text_multiple: "Seleccione una varias opciones"
      
          });

      $('.sh2').chosen(
          {
      
            allow_single_deselect: true,
            no_results_text: 'No hay resultados',
            width: '200px',
            placeholder_text_single: "Estado",
            placeholder_text_multiple: "Seleccione una varias opciones"
      
          });
$('.sh').chosen(
          {
      
            allow_single_deselect: true,
            no_results_text: 'No hay resultados',
            width: '200px',
            placeholder_text_single: "Obra",
            placeholder_text_multiple: "Seleccione una varias opciones"
      
          });
$('.sh11').chosen(
          {
      
            allow_single_deselect: true,
            no_results_text: 'No hay resultados',
            width: '200px',
            placeholder_text_single: "Tipo",
            placeholder_text_multiple: "Seleccione una varias opciones"
      
          });

      $('.sh22').chosen(
          {
      
            allow_single_deselect: true,
            no_results_text: 'No hay resultados',
            width: '200px',
            placeholder_text_single: "Usuario",
            placeholder_text_multiple: "Seleccione una varias opciones"
      
          });


});

