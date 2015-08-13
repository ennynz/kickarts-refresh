<episode>
  <div each={ episodes } class="entry">
    <div class="cover158">{ image }
      <h2>
        { title }
      </h2>
    </div>
    <div class="description">
      <p>
        { description }
      </p>
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

  var self = this;
  episodes = []
  $.getJSON('episodes.json', function(data) {
    self.episodes = data;
    console.log(data);
  })
</episode>
