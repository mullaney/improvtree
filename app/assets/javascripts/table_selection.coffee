$ ->
  $(document).on "change", "table.admin th :checkbox", ->
    checked = $(this).is(':checked')
    $(this).parents('table:first').find('tr :checkbox').each ->
      $(this).prop('checked', checked)
      localStorage.setItem("#{this.id}-checked", $(this).is(':checked'))

  indicateAllToggled = ->
    all = false
    $(this).parents('table:first').find('tbody :checkbox').each ->
      all = $(this).is(':checked')

    $(this).parents('table:first').find('th :checkbox').prop('checked', all)

    localStorage.setItem("#{this.id}-checked", $(this).is(':checked'))

  $(document).on "change", "table.admin tbody :checkbox",  indicateAllToggled

  toggleChecks = ->
    $(':checkbox[id]').each ->
      $(this).prop 'checked', localStorage.getItem("#{this.id}-checked") is 'true'

    $('thead :checkbox').each -> indicateAllToggled.call(this)

  $(document).on Turbolinks.EVENTS.LOAD, toggleChecks

  toggleChecks()

