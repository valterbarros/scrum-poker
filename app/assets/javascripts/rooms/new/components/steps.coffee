class @StepsSection
  @handler_events: ->
    handle_add_step_on_click()

  handle_add_step_on_click = ->
    $('#add_new_step').on 'click', ->
      form = $(@).data('target')
      $(form).append(step_section_html)

  step_section_html = ->
    html = 
      """
        <div class='form-group step-inputs'>
          <label for='room_steps_attributes_title'>Title</label>
          <input type='text' name='room[steps_attributes][][title]' id='room_steps_attributes_title' class='form-control'>
          <label for='room_steps_attributes_title'>Cards Values eg: (1,2,3,4,5,6)</label>
          <input type='text' name='room[steps_attributes][][cards_attributes]' id='room_steps_attributes_cards_attributes_all_values' class='form-control'>
        </div>
      """

$(document).on 'turbolinks:load', ->
  StepsSection.handler_events()
