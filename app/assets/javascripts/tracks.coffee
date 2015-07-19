#= require soundmanager2/script/soundmanager2

soundcloudClientId = '7295244789c156c9d08a8424d930eaf9'

soundManager.setup
  flashVersion: 9

sounds = {}

$('.track').on 'click', ->
  streamUrl = $(this).data('stream-url')
  id        = $(this).data('id')

  soundManager.stopAll()
  sounds[id] =
    soundManager.createSound
      id: id
      url: streamUrl + '?consumer_key=' + soundcloudClientId
      autoLoad: true
      autoPlay: false
      volume: 50
  sounds[id].play()
