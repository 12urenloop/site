# WiNA Spotlight Countdown Clock
# Ticks away the time until the first day of school!

# @author Pieter De Baets
# @author Thomas Meire

# @copyright Copyright &copy; 2010 WiNA Devteam

countdown = ->
  weeks = 0
  days = 0
  hours = 0
  minutes = 0
  strings = {}
  diff = Math.round(moment('2020042909', 'YYYYMMDDHH').diff(moment()) / 1000)

  weeks = Math.floor diff / 604800
  strings.weeks = pad(weeks.toString(), 2).split('')

  # Substract weeks from diff)
  diff = diff - (weeks * 604800)

  # Days
  days = Math.floor diff / 86400
  strings.days = pad(days.toString(), 2).split('')

  # Substract days from diff
  diff = diff - (days * 86400)

  # Hours
  hours = Math.floor diff / 3600
  strings.hours = pad(hours.toString(), 2).split('')

  # Subtract hours from diff
  diff = diff - (hours * 3600)

  # Minutes
  minutes = Math.round diff / 60
  strings.minutes = pad(minutes.toString(), 2).split('')

  $.each strings, (key, value) ->
    numbers = $("#countdown-#{key}").find('.number')

    $.each value, (key, number) ->
      $(numbers[key]).text number

  # No idea why
  days = hours = minutes = strings = diff = null

pad = (number, length) ->
  str = "#{number}"
  while str.length < length
      str = "0#{str}"
  return str

$(document).ready ->
  # Countdown
  setInterval countdown, 30000
  countdown()
