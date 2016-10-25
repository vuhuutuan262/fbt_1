jQuery.easing.def = "easeOutQuad";

$(document).ready(function()
{
  $(".projectThumbnail").on("mouseenter", function(e)
    {
      $(this).children(".projectThumbnailHover").fadeIn(300);
		
      $(this).children(
        ".projectThumbnailHover").find("h4").css("display", "block");
      $(this).children(
        ".projectThumbnailHover").find("h4").css("opacity", "0");
      $(this).children(
        ".projectThumbnailHover").find("h4").delay(200).animate(
        {left: '30', opacity: 1}, 200);

      $(this).children(
        ".projectThumbnailHover").find("h5").css("display", "block");
      $(this).children(
        ".projectThumbnailHover").find("h5").css("opacity", "0");
      $(this).children(
        ".projectThumbnailHover").find("h5").delay(350).animate(
        {left: '30', opacity: 1}, 200);
	})
	
	$(".projectThumbnail").on("mouseleave", function(e)
	{
      $(this).children(".projectThumbnailHover").fadeOut(200);
      $(this).children(
        ".projectThumbnailHover").find("h4").animate(
        {left: '0', opacity: 0}, 0);
      $(this).children(
        ".projectThumbnailHover").find("h5").animate(
        {left: '0', opacity: 0}, 0);
	})
	
	if (Modernizr.touch) {
      $(".projectThumbnailHover").css("display", "none");
      $(".projectThumbnailHover").css("visibility", "hidden");
      $(".projectThumbnail").unbind("mouseenter");
      $(".projectThumbnail").unbind("mouseleave");
	}


	$(".projectThumbnail").click(function(e) {
      if(isAnimating) {
        return;
      }
      isAnimating = true;
		
      var firstImgLoaded = false,
      projectEl = $(this).parent('.project'),
      projectNav = projectEl.find('.projectNav'),

      projectInfo = projectEl.find('.projectInfo'),

      newOpenProjectInfo = projectEl.find(".projectInfo"),
      currEl = $(this).find(".thumbnailImage");
				
      if( !projectEl.data('slider-inited') ) {
        var portfolioSliderData = projectEl.find('.portfolioSliderData'),
        imgPreloaderOverlay;
		
        if(portfolioSliderData.length > 0) {
          imgPreloaderOverlay = $(
            '<div class="first-img-preloader">' +
            '<div class="preloader-graphics"></d</div>');
          projectEl.append(imgPreloaderOverlay);

          portfolioSliderData
            .addClass('portfolioSlidesContainer')
            .wrap($('<div class="portfolioSlider"></div>'))
            .find('li').addClass('portfolioSlide');
			
          var sliderEl = projectEl.find('.portfolioSlider');
          currEl.clone().addClass(
            'portfolioImage myImage').appendTo(
            sliderEl.find('li').eq(0).removeAttr('data-src'));
          var imgLoadCounter = 0;
				
          var sliderInstance =
            sliderEl.portfolioSlider(sliderProps).data('portfolioSlider');
          var numSlides = sliderInstance.numSlides;
				
          $("#logo, #workPage").click(function() {
            function bugFix() {
              sliderInstance.updateSliderSize();
              $(".projectThumbnailHover").fadeOut(800);
            }
            setTimeout(bugFix, 710);
          });
				
          var currItemCounter = projectInfo.find('.projectNavCounter'),
            arrowNext = projectNav.find('.projectNavButtons .next'),
            arrowPrev = projectNav.find('.projectNavButtons .prev'),
            arrowPrevBlocked = false,
            arrowNextBlocked = false;

          function updateNextPrevButtons() {
            if(sliderInstance.currentSlideId <= 0) {
              arrowPrev.addClass('projectNavInactive');
              arrowPrevBlocked = true;
            } else {
              arrowPrev.removeClass('projectNavInactive');
              arrowPrevBlocked = false;
            }

            if(sliderInstance.currentSlideId >= numSlides - 1) {
              arrowNext.addClass('projectNavInactive');
              arrowNextBlocked = true;
            } else {
              arrowNext.removeClass('projectNavInactive');
              arrowNextBlocked = false;
            }
          }

          sliderInstance.settings.beforeSlideChange = function() {
            currItemCounter.text(
            (sliderInstance.currentSlideId + 1) + ' of ' + numSlides );
            updateNextPrevButtons();
          };
				
          arrowNext.click(function() {
            if(!arrowNextBlocked) {
              sliderInstance.next();
            }
          });
          arrowPrev.click(function() {
            if(!arrowPrevBlocked) {
              sliderInstance.prev();
            }
          });

          sliderInstance.settings.beforeSlideChange.call();
          updateNextPrevButtons();
          projectEl.data('slider-inited', true);
				
          imgPreloaderOverlay.css({
            width: currEl.width(),
            height: currEl.height()
          }).fadeIn();

          sliderInstance.settings.imgLoadComplete = function() {
            imgLoadCounter++;

            if(imgLoadCounter >= 2) {
              sliderInstance.settings.imgLoadComplete = false;
              setTimeout(function() {
                sliderInstance.goTo(1);
                isAnimating = false;
                currEl.css('visibility', 'hidden');
                imgPreloaderOverlay.stop().fadeOut();
              }, 400);
            }
          };

        } else {
          if(projectNav.length > 0) {
            var currItemCounter = projectInfo.find('.projectNavCounter'),
            arrowNext = projectNav.find('.projectNavButtons .next'),
            arrowPrev = projectNav.find('.projectNavButtons .prev'),
            arrowPrevBlocked = false,
            arrowNextBlocked = false;
            arrowNext.addClass('projectNavInactive');
            arrowPrev.addClass('projectNavInactive');
          }
            projectEl.data('slider-inited', true);
            isAnimating = false;
        }
      } else {
        var sliderEl = projectEl.find('.portfolioSlider');
        if(sliderEl.length > 0) {
          sliderEl.data('portfolioSlider').goToSilent(0);
          imgPreloaderOverlay = projectEl.find('.first-img-preloader');
          imgPreloaderOverlay.css({
            width: currEl.width(),
            height: currEl.height()
          }).fadeIn();

          setTimeout(function() {
            sliderEl.show();
					
            setTimeout(function() {
              currEl.css({'visibility': 'hidden'});
              imgPreloaderOverlay.stop().fadeOut();
              sliderEl.data('portfolioSlider').isAnimating = false;
              sliderEl.data('portfolioSlider').goTo(1);
              isAnimating = false;
              }, 400);
					
          }, 450);
				
        } else {
          isAnimating = false;
        }

      }

      if(openedProjectInfo) {
        if(newOpenProjectInfo.is(openedProjectInfo)) {
          closeOpenedProject(currOpenProject.find(".thumbnailImage"));
          currOpenProject.find(
          ".projectThumbnailHover").fadeOut(800,
          function(){currOpenProject.find(
          ".projectThumbnailHover").css("visibility", "visible")});
          return false;
        } else {
          closeOpenedProject(currOpenProject.find(".thumbnailImage"));
          currOpenProject.find(
          ".projectThumbnailHover").fadeOut(800,
          function(){currOpenProject.find(
          ".projectThumbnailHover").css("visibility", "visible")});
          }
      }
      currOpenProject =projectEl;
      openedProjectInfo =
        newOpenProjectInfo.stop().delay(200).slideDown(900).
        data('project-open', true);
      currOpenProject.find(".projectThumbnailHover").fadeOut(200,
        function(){currOpenProject.find(
        ".projectThumbnailHover").css("visibility", "hidden")});
    });
});
