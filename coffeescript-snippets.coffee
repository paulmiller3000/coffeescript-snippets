## For this particular use case, I had to declare the function within the window object.

# Add or remove asterisk from end of field
window.toggleRequiredIndicator = (ele, active) ->
  label = ele.labels[0]

  # Option 1: Add or remove an asterisk
  labelText = label.innerHTML
  asteriskExists = labelText.endsWith('*')

  switch active
    when true 
      if not asteriskExists 
        label.innerHTML = labelText.concat(' *')
    when false
      if asteriskExists
        label.innerHTML = labelText.slice(0, -1)
        console.log('debug: ', labelText.slice(0, -1))

  # Option 2: Add or remove a class
  # Assumes you have the following class: .required { color: red; }
  window.toggleRequiredIndicator = (ele, active) ->
    label = ele.labels[0]
    className = 'required'
    hasClass = label.classList.contains(className)

     switch active
      when true 
        if not hasClass 
          label.classList.add(className)
      when false
        if hasClass
          label.classList.remove(className)

# Set field as required or optional, then call function to update label
window.toggleRequired = (ele, required) ->
  ele.required = required
  toggleRequiredIndicator(ele, required)
      

# Function to read value from a select field, then set two text fields as required or optional depending on the value of the select field
window.updateFields = () ->
  ele = document.getElementById('my_select_element')
  theValue = ele.options[ele.selectedIndex].text

  fieldsToUpdate = [
    document.getElementById('my_date_field')
    document.getElementById('another_text_field')
    ]

  switch theValue
    when 'Split'
      for e in fieldsToUpdate
        toggleRequired(e, true)
    else
      for e in fieldsToUpdate
        toggleRequired(e, false)

