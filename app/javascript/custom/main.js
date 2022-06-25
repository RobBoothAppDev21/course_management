$(document).on("ready turbo:load", function() {
  $('.js-search-multiple').select2();
  
  $(".js-search-academic-year").select2({
    placeholder: {
      id: '',
      text: 'Academic Year'
    },
    allowClear: false,
  });

  $(".js-search-program").select2({
    placeholder: {
      id: '',
      text: 'Program'
    }
  });

  $(".js-search-quarter").select2({
    placeholder: {
      id: '',
      text: 'Quarter'
    }
  });

  $(".js-search-meet-days").select2({
    placeholder: {
      id: '',
      text: 'Days'
    }
  });

  $(".js-search-time-of-day").select2({
    placeholder: {
      id: '',
      text: 'Start Time'
    }
  });

  $(".js-search-credits").select2({
    placeholder: {
      id: '',
      text: 'Credits'
    }
  });
});