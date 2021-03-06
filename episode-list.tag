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

      <div class="list-description">
        <div id='episode-list-picture-{ episode }' class="ep-details-col-left box-height">

        </div>
        <div class="ep-details-col-right box-height">
          <p> <raw content="{ description }"/> </p>
        </div>
      </div>
      <div class="ep-list-media">
        <div class="ep-list-empty-left-panel ep-details-col-left box-height">
          <p>&nbsp;</p>
        </div>
        <div class="player ep-details-col-right box-height">
          <audio class="ep-details-player" controls="controls" preload='none'>
            <source src={ ogg } type="audio/ogg">
            <source src={ mp3 } type="audio/ogg">
          </audio>
          <div class="ep-list-download-button">
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
      $('#episode-list-picture-' + e.item.episode).empty()
      this.update()
    }
    else {
      this.isExpanded = true
      this.update()
      $('#episode-list-picture-' + e.item.episode).append('<img src="' + e.item.image + '" alt="episode photo" class="list-image" id="image-' + e.item.episode + '" />').hide().fadeIn('slow')
    }
  }

  this.close = function(e) {
    e.preventDefault();
    var episodeDetails = $('#episode-list-picture-' + e.item.episode)
    if(e.item.episode === this.episode) {
      this.isExpanded = false
      $('#episode-list-picture-' + e.item.episode).empty()
      this.update()
    }
  }

</episode-list>
