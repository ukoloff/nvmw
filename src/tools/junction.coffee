###
Working with Junction Point(s)
###

module.exports =
run = (id = 'none')->
  sh.run """
    "#{bin = file install2, 'linkd.exe'}" "#{me = link()}" /D
  """, 0, true
  if false == id
    return
  bat id
  sh.run """
    "#{bin}" "#{me}" "#{folder install2, id}"
  """, 0, true

# Path to link
run.$ =
link = ->
  folder install2, 'this'
