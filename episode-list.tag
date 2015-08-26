<episode-list>
  <div class='card-title purple'>
    <h3>
      Episode List
    </h3>
    <div class='card-icon'>
      <div class='fa fa-list'></div>
    </div>
  </div>
  <div each={ episode } class="list-entry">
    <div class="ep-list-col-left box-height">
      <div class="list-title" onclick="{ expand }" role="button">
        <a href="#" class="title-link"> { title }</a>
      </div>
    </div>
    <div class="ep-list-col-right box-height">
      <p class='list-ep-number'>Episode { episode }</p>
      <p class='list-date'>{ date }</p>
    </div>
    <span class='right list-close' onclick="{ close }" role="button" if={ isExpanded }><i class="fa fa-times-circle-o fa-2x"></i></span>
    <div id="{ episode }" class="list-details" if={ isExpanded } }>
      <div class="description-bg">
        <div class="list-description">
          <div class="ep-details-col-left box-height">
            <img src="{ image }" alt="{ episode } photo" class="list-image"/>
          </div>
          <div class="ep-details-col-right box-height">
            <p> <raw content="{ description }"/> </p>
          </div>
        </div>
        <div class="media">
          <div class="left-panel box-col-3-media-25 box-height">
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
              </a>
            </div>
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
