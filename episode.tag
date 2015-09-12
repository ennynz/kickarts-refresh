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
        <a href='#' class="player-action" onclick="{ playEpisode }" hide={ playing }>
          <i id='{ episode }' class="icon-4x fa fa-play-circle-o fa-4x"></i>
        </a>
        <a href='#' class="player-action" onclick="{ pauseEpisode }" show={ playing }>
          <i id='{ episode }' class="icon-4x fa fa-pause fa-2x"></i>
        </a>
        <p>episode { episode }</p>
      </div>
      <div class="player box-col-3-media-50 box-height">
        <audio id='audio-{ episode }' preload="auto">
          <source src={ ogg } type="audio/ogg">
          <source src={ mp3 } type="audio/ogg">
        </audio>
        <div class="custom-player" show={ playerShowing }>
          <div class="timeline">
            <div class="playhead"></div>
          </div>
          <div class='time'></div>
        </div>
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

  this.playEpisode = function(e) {
    e.preventDefault();
    var track = e.item.episode
    var audioPlayer = $('#audio-'+track)[0]
    this.playerShowing = true
    this.playing = true
    this.update()
  }

  this.pauseEpisode = function(e) {
    e.preventDefault();
    var track = e.item.episode
    var audioPlayer = $('#audio-'+track)[0]
    this.playerShowing = true
    this.playing = false
    this.update()
  }

</episode>
