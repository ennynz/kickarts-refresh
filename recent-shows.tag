<recent-shows>
  <div each={ episodes } class="entry">
    <div class="cover" style="background-image: linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0.27) 93%,rgba(0,0,0,0.22) 100%), url({ image });">
      <h2>
        { title }
      </h2>
    </div>
    <div class="description">
      <p> <raw content="{ description }"/> </p>
    </div>
    <div class="media">
      <div class="left-panel">
        <i class="icon-4x fa fa-play-circle-o fa-4x"></i>
        <p>episode { episode }</p>
      </div>
      <a href={ download } class="right-panel">
        <i class="icon fa fa-arrow-circle-o-down">
          <span class="action">download</span>
        </i>
        <p class="date">{ date }</p>
      </a>
      <div class="player">
        <audio controls="controls">
          <source src={ ogg } type="audio/ogg">
          <source src={ mp3 } type="audio/ogg">
        </audio>
      </div>
    </div>
  </div>

  this.episodes = []
  var self = this
  $.get('episodes.json', function(json) {
    self.episodes = json.slice(0, 3)
    self.update()
  })

</recent-shows>
