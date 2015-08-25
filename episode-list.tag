<episode-list>
  <div each={ episode } class="list-entry">
    <div class="list-title" onclick="{ expand }" role="button">
      <a href="#" class="title-link"> { title }</a>
      <div class="list-info right">
        <p class='list-ep-number'>Episode { episode }</p>
        <p class='list-date'>{ date }</p>
      </div>
    </div>
    <span class='right list-close' onclick="{ close }" role="button" if={ isExpanded }><i class="fa fa-times-circle-o fa-2x"></i></span>
    <div id="{ episode }" class="list-details" if={ isExpanded } }>
      <div class="list-description">
        <img src="{ image }" alt="{ episode } photo" class="list-image"/>
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
  </div>

  this.episode = []
  var self = this
  $.get('episodes.json', function(json) {
    self.episode = json
    self.update()
  })

  this.expand = function(e) {
    e.preventDefault();
    if(this.isExpanded === true) {
      this.isExpanded = false
      this.update()
    }
    else if(e.item.episode === this.episode) {
      this.isExpanded = true
      this.update()
    }
  }

  this.close = function(e) {
    e.preventDefault();
    console.log('pushed')
    if(e.item.episode === this.episode) {
      this.isExpanded = false
      this.update()
    }
  }

</episode-list>
