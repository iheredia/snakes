# Ignacio Heredia
# ignacio.nh@gmail.com
# Buenos Aires, Argentina

_currentColor = -1
nextColor = ->
  colors = [
    '#bc2424',
    '#2abc24',
    '#2461bc',
    '#6c24bc',
    '#b6bc24',
    '#24bca3',
    '#0e2ba6',
    '#a60e93'
  ]
  _currentColor = (_currentColor + 1) % colors.length
  colors[_currentColor]

equiprobable = (min, max) ->
  Math.floor(Math.random() * (1+max-min)) + min

distance = (onePosition, anotherPosition) ->
  xDiff = onePosition.x - anotherPosition.x
  yDiff = onePosition.y - anotherPosition.y
  Math.sqrt(xDiff*xDiff + yDiff*yDiff)

randomPosition = (gridWidth, gridHeight)->
  {
    x: equiprobable(0, gridWidth),
    y: equiprobable(0, gridHeight)
  }

intersect = (oneList, anotherList) ->
  for element in oneList
    for anotherElement in anotherList
      if element.x == anotherElement.x and element.y == anotherElement.y
        return true
  false

shiftPositionFarFrom = (snake) ->
  shiftPosition = snake.position
  while distance(snake.position, shiftPosition) < 20
    shiftPosition = randomPosition(snake.drawingCanvas.gridWidth, snake.drawingCanvas.gridHeight)
    shiftPosition.x = snake.drawingCanvas.normalizeWidth(shiftPosition.x + snake.history[0].x)
    shiftPosition.y = snake.drawingCanvas.normalizeHeight(shiftPosition.y + snake.history[0].y)
  shiftPosition