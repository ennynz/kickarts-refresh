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
      <div class="left-panel box-col-3-media-75 box-height">
        <div class="left-panel box-col-3-media-25-no-stack box-height">
          <a href='#' class="player-action" onclick="{ playEpisode }" hide={ playing }>
            <i class="icon-4x fa fa-play-circle-o fa-4x"></i>
          </a>
          <a href='#' class="player-action" onclick="{ pauseEpisode }" show={ playing }>
            <i class="icon-4x fa fa-pause fa-2x circle-icon"></i>
          </a>
          <p>ep. { episode }</p>
        </div>
        <div class="player box-col-3-media-75-no-stack box-height">
          <audio id='audio-{ episode }' preload='auto'>
            <source src={ ogg } type="audio/ogg">
            <source src={ mp3 } type="audio/mp3">
          </audio>
          <div class="custom-player" if={ playerShowing }>
            <div id="timeline-{ episode }" class="timeline">
              <div id="playhead-{ episode }" class="playhead"></div>
            </div>
            <div id='time-{ episode }' class='time'></div>
          </div>
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
  var countDownwards
  var audio
  var duration
  var playhead
  var timeline
  var timelineWidth
  var timer

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
    this.playerShowing = true
    this.playing = true
    this.update()

    countDownwards = false;
    timer = $('#time-'+track)
    audio = $('#audio-'+track)[0]
    playhead = $('#playhead-'+track)[0];
    timeline = $('#timeline-'+track)[0];
    timelineWidth = timeline.offsetWidth - playhead.offsetWidth;

    play();

    audio.addEventListener("timeupdate", timeUpdate, false);

    timeline.addEventListener("click", function (event) {
      moveplayhead(event);
      audio.currentTime = audio.duration * clickPercent(event);
    }, false);

    function clickPercent(e) {
      return (e.pageX - timeline.offsetLeft) / timelineWidth;
    }

    playhead.addEventListener('mousedown', mouseDown, false);
    window.addEventListener('mouseup', mouseUp, false);

    var onplayhead = false;

    function mouseDown() {
      onplayhead = true;
      window.addEventListener('mousemove', moveplayhead, true);
      audio.removeEventListener('timeupdate', timeUpdate, false);
    }

    function mouseUp(e) {
      if (onplayhead == true) {
        moveplayhead(e);
        window.removeEventListener('mousemove', moveplayhead, true);
        audio.currentTime = audio.duration * clickPercent(e);
        audio.addEventListener('timeupdate', timeUpdate, false);
      }
      onplayhead = false;
    }

    function moveplayhead(e) {
      var newMargLeft = e.pageX - timeline.offsetLeft;
      if (newMargLeft >= 0 && newMargLeft <= timelineWidth) {
        playhead.style.marginLeft = newMargLeft + "px";
      }
      if (newMargLeft < 0) {
        playhead.style.marginLeft = "0px";
      }
      if (newMargLeft > timelineWidth) {
        playhead.style.marginLeft = timelineWidth + "px";
      }
    }

    function timeUpdate() {
      var playPercent = timelineWidth * (audio.currentTime / audio.duration);
      playhead.style.marginLeft = playPercent + "px";
    }

    function play() {
      timer.click(function() {
        countDownwards = !countDownwards;
      });
      if (audio.paused) {
        audio.play();
        timer.addClass('show-pointer');
      } else {
        audio.pause();
        timer.removeClass('show-pointer');
      }
    }

    audio.addEventListener("canplaythrough", function () {
      duration = audio.duration;
      timer.html(formatTime(audio.duration));
    }, false);

    audio.addEventListener("timeupdate", progress, false);

    function progress() {
      if(audio.duration == 'Infinity') {
        value = 100;
      }
      else if (audio.currentTime > 0) {
        value = Math.floor((100 / audio.duration) * audio.currentTime);
      }
      if (countDownwards === true) {
        timer.html("-" + formatTime((audio.duration) - (audio.currentTime)));
      }else{
        timer.html(formatTime(audio.currentTime));
      }
    }
  }

  this.pauseEpisode = function(e) {
    e.preventDefault();
    var track = e.item.episode
    var audio = $('#audio-'+track)[0]
    this.playerShowing = true
    this.playing = false
    this.update()
    timer.removeClass('show-pointer');

    audio.pause();
  }

  function formatTime(seconds) {
    minutes = Math.floor(seconds / 60);
    minutes = (minutes >= 10) ? minutes : "" + minutes;
    seconds = Math.floor(seconds % 60);
    seconds = (seconds >= 10) ? seconds : "0" + seconds;
    return minutes + ":" + seconds;
  }

</episode>
