$(document).on("ready turbo:load", function() {
  $('.js-filter-multiple').select2();
  
  $(".js-filter-academic-year").select2({
    placeholder: {
      id: '',
      text: 'Academic Year'
    },
    allowClear: false,
    maximumSelectionLength: 1,
    width: '15%'
  });

  $(".js-filter-program").select2({
    placeholder: {
      id: '',
      text: 'Program'
    },
    closeOnSelect: false,
    width: 'fit-content'
  });

  $(".js-filter-quarter").select2({
    placeholder: {
      id: '',
      text: 'Quarter'
    },
    closeOnSelect: false,
    width: 'fit-content'
  });

  $(".js-filter-course-areas").select2({
    placeholder: {
      id: '',
      text: 'Course Areas'
    },
    closeOnSelect: false,
    width: 'fit-content'
  });

  $(".js-filter-meet-days").select2({
    placeholder: {
      id: '',
      text: 'Days'
    },
    closeOnSelect: false,
    width: 'style'
  });

  $(".js-filter-time-of-day").select2({
    placeholder: {
      id: '',
      text: 'Start Time'
    },
    closeOnSelect: false,
    width: 'style'
  });

  $(".js-filter-credits").select2({
    placeholder: {
      id: '',
      text: 'Credits'
    },
    closeOnSelect: false,
    width: 'fit-content'
  });

  $(".js-filter-concentrations").select2({
    placeholder: {
      id: '',
      text: 'Concentrations'
    },
    closeOnSelect: false,
    width: 'fit-content'
  });
});