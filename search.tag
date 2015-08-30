<search>
  <div class='box box-padding-5'>
    <div class='card-title purple'>
      <h3>
        Search
      </h3>
      <div class='card-icon'>
        <div class='fa fa-search'></div>
      </div>
    </div>
    <div class='card-body'>
      <div class='box-col-search-word search-height'>
        <h2>
          Search by Words
        </h2>
        <form onsubmit={ textSubmit }>
          <fieldset>
            <input class='name'>
            <label class='search' for='name'>Type words</label>
          </fieldset>
          <button class='search-btn'>Search</button>
        </form>
      </div>
      <div class='box-col-search-or search-height'>
        <h2 class='or-box'>
          OR
        </h2>
      </div>
      <div class='box-col-search-year search-height'>
        <h2>
          List by Year
        </h2>
        <div class='wrapper-dropdown-1' id='dd' tabindex='1'>
          <span>Select a year</span>
          <form onsubmit={ yearSubmit }>
            <select id="year-select" name="list">
              <option value="all">All Years</option>
              <option value="2015">2015</option>
              <option value="2014">2014</option>
              <option value="2013">2013</option>
              <option value="2012">2012</option>
            </select>
            <button class='search-btn list-btn'>List</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="list-box">
    <div class='card-title purple' if={ results }>
      <h3>
        Search Results
      </h3>
      <div class='card-icon'>
        <div class='fa fa-list'></div>
      </div>
    </div>
    <div class="ep-list-col-left box-height" if={ noResults }>
      <div class="list-title">
        Sorry...No Results...
      </div>
    </div>
    <div each={ searchResults } class="list-entry">
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
          <div class="ep-details-col-left box-height">
            <img src="{ image }" alt="{ episode } photo" class="list-image"/>
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
            <audio class="ep-details-player" controls="controls">
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
  </div>


  this.noResults = false
  textSubmit(e) {
    var searchTerm = e.target[1].value
    var self = this;
    $.get('episodes.json', function(json) {
      var title = JSON.search(json, '//*[contains(title, "'+searchTerm+'")]')
      var description = JSON.search(json, '//*[contains(description, "'+searchTerm+'")]')
      var found = $.unique(title.concat(description))
      self.results = true;
      self.searchResults = found
      self.update()

      if (found.length > 0) {
        self.noResults = false
        self.update()
        $('html,body').animate({scrollTop: $('.list-box').offset().top -75}, 500);
      }else{
        self.noResults = true
        self.update()
      }
    })
    e.target[1].value = ""
  }

  yearSubmit(e) {
    var select = document.getElementById('year-select').value
    var self = this;
    var date = ""
    $.get('episodes.json', function(json) {
      if(select === "all"){
        date = json
      }else{
        date = JSON.search(json, '//*[contains(date, "'+select+'")]')
      }
      self.results = true;
      self.searchResults = date
      self.update()

      if (date.length > 0) {
        self.noResults = false
        self.update()
        $('html,body').animate({scrollTop: $('.list-box').offset().top -75}, 500);
      }else{
        self.noResults = true
        self.update()
      }
    })
  }

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
</search>
