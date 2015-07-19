#= require soundmanager2/script/soundmanager2

soundcloudClientId = '7295244789c156c9d08a8424d930eaf9'

updatePlayProgressBar = (percent) ->
  $('.play-bar').css('width', percent + '%')

updateLoadProgressBar = (percent) ->
  $('.load-bar').css('width', percent + '%')

changePlayable = (sound) ->
  $btnPlay = $('.btn-play')
  $btnPlay.text('▶')
  $btnPlay.on 'click', ->
    soundManager.stopAll()
    sound.play()

changePausable = (sound) ->
  $btnPlay = $('.btn-play')
  $btnPlay.text('Ⅱ')
  $btnPlay.on 'click', ->
    sound.pause()

$('.track').on 'click', ->
  streamUrl = $(this).data('stream-url')
  id = 'sc' +  $(this).data('id')

  sound = soundManager.getSoundById(id)

  if sound == undefined
    sound = soundManager.createSound
      id: id
      url: streamUrl + '?consumer_key=' + soundcloudClientId
      autoLoad: true
      autoPlay: false
      volume: 50
      flashVersion: 9
      whileloading: ->
        loadedPercent = (sound.bytesLoaded / sound.bytesTotal) * 100
        updateLoadProgressBar loadedPercent
      whileplaying: ->
        playPercent = (sound.position / sound.durationEstimate) * 100
        updatePlayProgressBar playPercent
      onload: ->
        updateLoadProgressBar(100)
      onpause:  -> changePlayable(sound)
      onstop:   -> changePlayable(sound)
      onplay:   -> changePausable(sound)
      onresume: -> changePausable(sound)
        
  soundManager.stopAll()
  sound.play()
