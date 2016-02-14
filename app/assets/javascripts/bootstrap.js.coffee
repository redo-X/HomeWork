jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

jQuery -> $('[data-provide~=datepicker]').datepicker({
    format: "dd.mm.yyyy",
    language: "de",
    calendarWeeks: true,
    autoclose: true,
    todayHighlight: true
  });