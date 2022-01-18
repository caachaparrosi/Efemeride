// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


//= require jquery3
//= require jquery_ujs
//= require jquery-ui/widgets/autocomplete
//= require bootstrap
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require moment
//= require daterangepicker/daterangepicker
//= require moment/es
//= require bootstrap-datetimepicker
//= require turbolinks
//= require_tree .



$.fn.datepicker.dates['es'] = {
    days: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"],
    daysShort: ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"],
    daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
    months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
    monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
    today: "Hoy",
    monthsTitle: "Meses",
    clear: "Borrar",
    weekStart: 1,
    format: "dd/mm/yyyy"
};
$.fn.datepicker.defaults.language = 'es';

var input = $("#search");
if (typeof input.val() !== 'undefined' ){
    var len = input.val().length;
    input[0].focus();
    input[0].setSelectionRange(len, len);
}

$(document).on('turbolinks:before-cache', function() {
    var dataTable;
    dataTable = $($.fn.dataTable.tables(true)).DataTable();
    if (dataTable !== null) {
        dataTable.destroy();
        return dataTable = null;
    }
});