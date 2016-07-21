#= require trix
Trix.config.blockAttributes.heading = tagName: 'h2'
Trix.config.blockAttributes.subHeading = tagName: 'h3'

addEventListener 'DOMContentLoaded', ->
  Array::forEach.call document.querySelectorAll('trix-toolbar .block_tools'), (tools) ->
    tools.innerHTML += """
      <button type="button" class="heading" data-trix-attribute="heading" title="Heading">Heading</button>
      <button type="button" class="subheading" data-trix-attribute="subHeading" title="SubHeading">SubHeading</button>
    """

