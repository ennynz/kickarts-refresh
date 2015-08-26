<episode>
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
      <div class="left-panel box-col-3-media-25 box-height">
        <i class="icon-4x fa fa-play-circle-o fa-4x"></i>
        <p>episode { episode }</p>
      </div>
      <div class="player box-col-3-media-50 box-height">
        <audio controls="controls">
          <source src={ ogg } type="audio/ogg">
          <source src={ mp3 } type="audio/ogg">
        </audio>
      </div>
      <div class="box-col-3-media-25 box-height">
        <div class="right-panel">
          <a href={ download }>
            <i class="icon fa fa-arrow-circle-o-down">
              <span class="action">download</span>
            </i>
            <p class="date">{ date }</p>
          </a>
        </div>
      </div>
    </div>
  </div>
  <div class="pagination-area">
    <a class='button left top-pull-up' onclick="{ paginate }" role="button">More episodes</a>
    <a href="#episodes-list" class='button right top-pull-up' role="button">List all</a>
  </div>

  this.episodeList = []
  this.episodes = []
  var episodeIndex = 0
  var self = this
  $.get('episodes.json', function(json) {
    self.episodeList = json
    self.episodes = self.episodeList.slice(0, 3)
    self.update()
  })

  this.paginate = function(e) {
    e.preventDefault();
    episodeIndex += 3
    var more = this.episodeList.slice(episodeIndex, (episodeIndex + 3))
    var self = this;
    more.forEach(function(entry) {
      self.episodes.push(entry)
    })
    this.update()
    return true
  }.bind(this)

</episode>
