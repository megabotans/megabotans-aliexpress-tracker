loadException = ->
  return (if localStorage['vkCommentBlocker'] then JSON.parse(localStorage['vkCommentBlocker']) else JSON.parse('{"items":[]}'))

viewException = (data) ->
  tbody = document.createElement('tbody')
  for i in [0...data['items'].length]
    item = data['items'][i]
    row = tbody.insertRow(0)
    row.insertCell(0).innerHTML = i + 1
    row.insertCell(1).innerHTML = item.title
    row.insertCell(2).innerHTML = item.url
    row.insertCell(3).innerHTML = '<button type="button" class="btn btn-remove" data-tools="remove" data-i18n="remove" data-id=' + (i + 1) + '></button>'
    tbody.appendChild(row)

  return tbody

saveException = (title, url) ->
  if localStorage['vkCommentBlocker']
    data = loadException()
  else
    data = JSON.parse('{"items":[]}')

  data['items'].push
    title: title
    url: url

  localStorage['vkCommentBlocker'] = JSON.stringify(data)
  return

saveListException = (file) ->
  reader = new FileReader()
  reader.onload = (e) ->
    text = reader.result
    localStorage['vkCommentBlocker'] = text
    return
  reader.readAsText(file)
  return

removeException = (id) ->
  data = loadException()
  data['items'].splice(id, 1)
  localStorage['vkCommentBlocker'] = JSON.stringify(data)
  return