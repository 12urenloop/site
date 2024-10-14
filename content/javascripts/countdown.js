const countdown = () => {
  let strings = {}
  let diff = Math.max(0, Math.round(moment('2025042909', 'YYYYMMDDHH').diff(moment()) / 1000))

  // Days
  const days = Math.floor(diff / 86400)
  strings.days = pad(days, 2).split('')
  diff = diff - (days * 86400)

  // Hours
  const hours = Math.floor(diff / 3600)
  strings.hours = pad(hours, 2).split('')
  diff = diff - (hours * 3600)

  strings.minutes = pad(Math.round(diff / 60).toString(), 2).split('')

  $.each(strings, (k, v) => {
    $(`#countdown-${k}`).empty();
    $.each(v, (i, n) => {
      $(`#countdown-${k}`).append(`<span class='number'>${n}</span>`)
    })
  })
}

const pad = (num, length) => {
  let str = new String(num);
  while (str.length < length) {
    str = `0${str}`
  }
  return str;
}

$(document).on("ready", () => {
  setInterval(() => {
    countdown()
  }, 30000);
  countdown();
})
