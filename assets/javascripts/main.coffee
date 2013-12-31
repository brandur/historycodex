colors = [
  '#336699'
]

people = [
  { "name": "Caesar", "start": 130, "end": 530 },
  { "name": "Pompey", "start": 20, "end": 420 },
]

rowSeparatorColor = '#ddd'
timeAxisColor = '#000'

rowHeight = 40
timeAxisTabSpacing = 10
timeAxisTabHeight = 5

$ ->
  canvas = $("canvas")[0]
  context = canvas.getContext("2d")

  context.beginPath()
  for y in (0.5 + i * rowHeight for i in [0...(people.length+1)])
    context.moveTo(0, y)
    context.lineTo(canvas.width, y)
  context.strokeStyle = rowSeparatorColor
  context.stroke()

  for i in [0...people.length]
    person = people[i]
    y = i * rowHeight
    gradient = context.createLinearGradient(person["start"], 0, person["end"], 0)
    gradient.addColorStop(0, "transparent")
    gradient.addColorStop(0.5, colors[i % colors.length])
    gradient.addColorStop(1, "transparent")
    context.fillStyle = gradient
    context.fillRect(person["start"], y, person["end"] - person["start"], rowHeight)

  context.beginPath()
  context.moveTo(0, canvas.height)
  context.lineTo(canvas.width, canvas.height)
  for x in (0.5 + i for i in [0..(canvas.width)] by timeAxisTabSpacing)
    context.moveTo(x, canvas.height)
    context.lineTo(x, canvas.height - timeAxisTabHeight)
  context.strokeStyle = timeAxisColor
  context.stroke()
