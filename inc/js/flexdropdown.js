/* Flex Level Drop Down Menu
* Created: Jan 5th, 2010 by DynamicDrive.com. This notice must stay intact for usage 
* Author: Dynamic Drive at http://www.dynamicdrive.com/
* Visit http://www.dynamicdrive.com/ for full source code
*/

//Version 1.1 (Feb 19th, 2010): Each flex menu (UL) can now be associated with a link dynamically, and/or defined using JavaScript instead of as markup.
//Version 1.2 (July 2nd, 2011): Menu updated to work properly in popular mobile devices such as iPad/iPhone and Android tablets.
//Version 1.3 (Nov 28th, 2011): Script now dynamically adds a class of "selected" to the anchor link while its drop down menu is expanded, for easy styling of the anchor link during its "open" state.
//Version 2.0 (April 16th, 2015): Adds mobile friendly, overlay version of menu that's activated in mobile and small screen browsers. Refines drop down menu behaviour when there's neither space to the right nor left to accommodate sub menu; in that case sub menu overlaps parent menu. Requires jquery 1.8+

//Usage: $(elementselector).addflexmenu('menuid', options)
//ie:
//jQuery(document).ready(function($){
	//$('a.mylinks').addflexmenu('flexmenu1') //apply flex menu with ID "flexmenu1" to links with class="mylinks"
//})

jQuery.noConflict()

var flexdropdownmenu={
	arrowpath: 'http://localhost/smkn5samarinda/img/arrow.gif', //full URL or path to right arrow image
	backarrowpath: 'http://localhost/smkn5samarinda/img/left.gif', //full URL or path to back arrow image
	animspeed: 200, //reveal animation speed (in milliseconds)
	showhidedelay: [150, 150], //delay before menu appears and disappears when mouse rolls over it, in milliseconds
	mobilemediaquery: "screen and (max-width: 600px)", // CSS media query string that when matched activates mobile menu (while hiding default)

	//***** NO NEED TO EDIT BEYOND HERE
	mobilemql: null,
	startzindex:1000,
	mobilezindex: 1001,
	ismobile:navigator.userAgent.match(/(iPad)|(iPhone)|(iPod)|(android)|(webOS)/i) != null, //boolean check for popular mobile browsers
	builtflexmenuids: [], //ids of flex menus already built (to prevent repeated building of same flex menu)
	ulclones: {}, // object holding clone of each drop down menu UL
	hidemenuevent: navigator.userAgent.match(/(iPad)|(iPhone)|(iPod)/i)? 'touchstart' : 'click', // Mac doesn't seem to support click on body

	css3animation: (function(){ // check for CSS3 animation support
		var elstyle = document.createElement('p').style
		return 'animation' in elstyle || 'WebkitAnimation' in elstyle || 'MozAnimation' in elstyle
	})(),

	positionul:function($, $ul, e, $anchor){
		var istoplevel=$ul.hasClass('jqflexmenu') || $ul.hasClass('flexmenumobile') //Bool indicating whether $ul is top level flex menu or main mobile container
		var docrightedge=$(document).scrollLeft()+$(window).width()-40 //40 is to account for shadows in FF
		var docbottomedge=$(document).scrollTop()+$(window).height()-40
		if (istoplevel){ //if main flex menu DIV
			var offsets=$anchor.offset()
			var anchorsetting=this.mobilemql.matches? $anchor.data('mobilesetting') : $anchor.data('setting')
			var x=offsets.left+anchorsetting.useroffsets[0]+(anchorsetting.dir=="h"? $anchor.outerWidth() : 0) //x pos of main flex menu UL
			var y=offsets.top+anchorsetting.useroffsets[1]+(anchorsetting.dir=="h"? 0 : $anchor.outerHeight())
			x=(x+$ul.data('dimensions').w > docrightedge)? x-(anchorsetting.useroffsets[0]*2)-$ul.data('dimensions').w+$anchor.outerWidth()+(anchorsetting.dir=="h"? -($anchor.outerWidth()*2) : 0) : x //if not enough horizontal room to the ridge of the cursor
			y=(y+$ul.data('dimensions').h > docbottomedge)? y-(anchorsetting.useroffsets[1]*2)-$ul.data('dimensions').h-$anchor.outerHeight()+(anchorsetting.dir=="h"? ($anchor.outerHeight()*2) : 0) : y
		}
		else{ //if sub level flex menu UL
			var $parentli=$ul.data('$parentliref')
			var parentlioffset=$parentli.offset()
			var x=$ul.data('dimensions').parentliw //x pos of sub UL
			var y=0
			if ( (parentlioffset.left+x+$ul.data('dimensions').w) > docrightedge ){ //if not enough horizontal room to the ridge parent LI
				if ($ul.data('dimensions').w > (parentlioffset.left - $(document).scrollLeft())) // no room to left either?
					x = 0
				else
					x = x-$ul.data('dimensions').parentliw-$ul.data('dimensions').w
			}
			if ( parentlioffset.top+$ul.data('dimensions').h > docbottomedge ){ //if not enough vertical room to the bottom of parent LI
				if ($ul.data('dimensions').h > (parentlioffset.top - $(document).scrollTop())) // no room upwards either?
					y = $(document).scrollTop() - parentlioffset.top
				else
					y = y-$ul.data('dimensions').h+$ul.data('dimensions').parentlih
			}
		}

		$ul.css({left:x, top:y})
	},
	
	showbox:function($, $target, $flexmenu, e){
		clearTimeout($flexmenu.data('timers').hidetimer)
		$flexmenu.data('timers').showtimer=setTimeout(function(){$target.addClass('selected'); $flexmenu.show(flexdropdownmenu.animspeed)}, this.showhidedelay[0])
	},

	hidebox:function($, $target, $flexmenu){
		clearTimeout($flexmenu.data('timers').showtimer)
		$flexmenu.data('timers').hidetimer=setTimeout(function(){$target.removeClass('selected'); $flexmenu.hide(100)}, this.showhidedelay[1]) //hide flex menu plus all of its sub ULs
	},

	buildmobilemenu:function($, mainulid, $target){
		var $menu = this.ulclones[mainulid]
		function flattenuls($mainul, cloneulBol, callback, finalcall){
			var callback = callback || function(){}
			var finalcall = finalcall || function(){}
			var $headers = $mainul.find('ul').parent()
			var $mainulcopy = cloneulBol? $mainul.clone() : $mainul
			var $flattened = jQuery(document.createDocumentFragment())
			var $headers = $mainulcopy.find('ul').parent()
			for (var i=$headers.length-1; i>=0; i--){ // loop through headers backwards, so we end up with topmost UL last
				var $header = $headers.eq(i)
				var $subul = $header.find('>ul').prependTo($flattened)
				callback(i, $header, $subul)
			}
			$mainulcopy.prependTo($flattened) // Add top most UL to collection
			finalcall($mainulcopy)
			return $flattened
		}
		var $flattened = flattenuls($menu, false,
			function(i, $header, $subul){
				var $breadcrumb = $('<li class="breadcrumb" />')
					.html('<img src="' + flexdropdownmenu.backarrowpath + '" class="backarrow" />' + $header.text())
					.prependTo($subul)
				$subul.css({display:'block', left:0, top:0})
				$header.find('a:eq(0)').append('<img src="' + flexdropdownmenu.arrowpath +'" class="rightarrow" />')
				$header.bind('click', function(e){
					$mobilecontainer.data('h', $subul.outerHeight())
					var $headermenu = $(this).parent('ul')
					$headermenu.css({zIndex: flexdropdownmenu.mobilezindex++}).animate({left:'-100%', opacity: 0}, function(){this.style.visibility='hidden'})
					$subul.css({zIndex: flexdropdownmenu.mobilezindex++, left: '100%', visibility:'visible'}).animate({left:0, opacity: 1})
					e.stopPropagation()
					e.preventDefault()
				})
				$breadcrumb.bind('click', function(e){
					var $headermenu = $header.parent('ul')
					$mobilecontainer.data('h', $headermenu.outerHeight())
					$subul.css({zIndex: flexdropdownmenu.mobilezindex++}).animate({left:'100%', opacity: 0}, function(){this.style.visibility='hidden'})
					$headermenu.css({zIndex: flexdropdownmenu.mobilezindex++, left: '-100%', visibility:'visible'}).animate({left:0, opacity: 1})
					e.stopPropagation()
					e.preventDefault()
				})
			},
			function($topul){
				$topul.removeAttr("id class").css({zIndex: flexdropdownmenu.mobilezindex++, visibility:'visible', opacity:1, left:0, top:0, display:'block'})
			}
		)

		var $mobilecontainer = $('<div class="flexmenumobile" id="' + mainulid + '-mobile"/>').append($flattened).appendTo(document.body)
		$mobilecontainer.css('display', 'block')
		$mobilecontainer.data('dimensions', {w:$mobilecontainer.outerWidth(), h:$mobilecontainer.find('ul:eq(0)').outerHeight()}) //remember mobile menu's dimensions
		$mobilecontainer.css('display', 'none')
		$mobilecontainer.bind('touchstart', function(e){
			e.stopPropagation()
		})
		this.builtflexmenuids.push(mainulid + '-mobile') //remember id of mobile flex menu that was just built

	},

	buildflexmenu:function($, $menu, $target){
		$menu.css({display:'block', visibility:'hidden', zIndex:this.startzindex}).addClass('jqflexmenu').appendTo(document.body)
		$menu.bind('mouseenter', function(){
			clearTimeout($menu.data('timers').hidetimer)
		})		
		$menu.bind('mouseleave', function(){ //hide menu when mouse moves out of it
			flexdropdownmenu.hidebox($, $target, $menu)
		})
		$menu.bind(this.hidemenuevent, function(e){ //hide menu when mouse moves out of it
			e.stopPropagation()
		})
		$menu.data('dimensions', {w:$menu.outerWidth(), h:$menu.outerHeight()}) //remember main menu's dimensions
		$menu.data('timers', {})
		var $lis=$menu.find("ul").parent() //find all LIs within menu with a sub UL
		$lis.each(function(i){
			var $li=$(this).css({zIndex: 1000+i})
			var $subul=$li.find('ul:eq(0)').css({display:'block'}) //set sub UL to "block" so we can get dimensions
			$subul.data('dimensions', {w:$subul.outerWidth(), h:$subul.outerHeight(), parentliw:this.offsetWidth, parentlih:this.offsetHeight})
			$subul.data('$parentliref', $li) //cache parent LI of each sub UL
			$subul.data('timers', {})
			$li.data('$subulref', $subul) //cache sub UL of each parent LI
			$li.children("a:eq(0)").append( //add arrow images
				'<img src="'+flexdropdownmenu.arrowpath+'" class="rightarrowclass" style="border:0;" />'
			)
			$li.bind(flexdropdownmenu.triggerevt, function(e){ //show sub UL when mouse moves over parent LI
				var $targetul=$(this).css('zIndex', ++flexdropdownmenu.startzindex).addClass("selected").data('$subulref')
				if ($targetul.queue().length<=1){ //if 1 or less queued animations
					clearTimeout($targetul.data('timers').hidetimer)
					$targetul.data('timers').showtimer=setTimeout(function(){
						flexdropdownmenu.positionul($, $targetul, e)
						$targetul.show(flexdropdownmenu.animspeed)
					}, flexdropdownmenu.showhidedelay[0])
					if (flexdropdownmenu.triggerevt=="click" && $(e.target).next('ul').length==1) //if LI being clicked on is a menu header
						return false
				}
			})

			$li.bind('mouseleave', function(e){ //hide sub UL when mouse moves out of parent LI
				var $targetul=$(this).data('$subulref')
				clearTimeout($targetul.data('timers').showtimer)
				$targetul.data('timers').hidetimer=setTimeout(function(){$targetul.hide(100).data('$parentliref').removeClass('selected')}, flexdropdownmenu.showhidedelay[1])
			})

		})
		$menu.find('ul').andSelf().css({display:'none', visibility:'visible'}) //collapse all ULs again
		this.builtflexmenuids.push($menu.get(0).id) //remember id of flex menu that was just built
	},

	

	init:function($, $target, $flexmenu){
		var mobilemenucheck = this.mobilemql.matches
		this.triggerevt=(this.ismobile)? "click" : "mouseenter"
		this.showhidedelay[0]=(this.ismobile)? 0 : this.showhidedelay[0]
		if (this.builtflexmenuids.length==0){ //only bind click event to document, create overlay div once
			$(document.body).bind(this.hidemenuevent, function(e){
				$('.jqflexmenu').find('ul').andSelf().hide()
			})
			$('<div class="flexoverlay" />')
				.bind('click', function(e){
					$('div.flexmenumobile').hide()
					$('div.flexoverlay').css('display', 'none')
				})
				.appendTo(document.body)
		}
		if ($target.parents().filter('ul.jqflexmenu').length>0) //if $target matches an element within the flex menu markup, don't bind onflexmenu to that element
			return
		if (!mobilemenucheck){ // if REGULAR MENU MODE (non mobile)
			if (!this.ulclones[$flexmenu.get(0).id]) // if drop down menu hasn't been cloned yet (for mobile menu usage)
				this.ulclones[$flexmenu.get(0).id] = $flexmenu.clone()
			$('div.flexmenumobile').css('display', 'none')
			$('div.flexoverlay').css('display', 'none')			
			if (jQuery.inArray($flexmenu.get(0).id, this.builtflexmenuids)==-1){ //if this flex menu hasn't been built yet
				this.buildflexmenu($, $flexmenu, $target)
			}
			if (!$target.data('setting')){ // if this $target doesn't have a regular flex menu associated with it yet
				var useroffsets=$target.attr('data-offsets')? $target.attr('data-offsets').split(',') : [0,0] //get additional user offsets of menu
				useroffsets=[parseInt(useroffsets[0]), parseInt(useroffsets[1])]
				$target.data('setting', {dir: $target.attr('data-dir'), useroffsets: useroffsets}) //store direction (drop right or down) of menu plus user offsets
				$target.bind(flexdropdownmenu.triggerevt, function(e){
					if (!flexdropdownmenu.mobilemql.matches){ // if not in mobile menu mode
						$flexmenu.css('zIndex', ++flexdropdownmenu.startzindex)
						flexdropdownmenu.positionul($, $flexmenu, e, $target)
						flexdropdownmenu.showbox($, $target, $flexmenu, e)
						if (flexdropdownmenu.triggerevt=="click")
							e.preventDefault()
					}
				})
				$target.bind("mouseleave", function(e){
					if (!flexdropdownmenu.mobilemql.matches){ // if not in mobile menu mode
						flexdropdownmenu.hidebox($, $target, $flexmenu)
						e.preventDefault()
					}
				})
			}
		}
		else{ // if MOBILE MENU MODE
			if (!this.ulclones[$flexmenu.get(0).id]) // if drop down menu hasn't been cloned yet (for mobile menu usage)
				this.ulclones[$flexmenu.get(0).id] = $flexmenu.clone()
			$('.jqflexmenu').find('ul').andSelf().hide()
				if (jQuery.inArray($flexmenu.get(0).id + '-mobile', this.builtflexmenuids)==-1){ //if this mobile flex menu hasn't been built yet
					this.buildmobilemenu($, $flexmenu.get(0).id, $target)
				}
				var $mobilemenu = $('div#' + $flexmenu.get(0).id + '-mobile')
				if (!$target.data('mobilesetting')){ // if this $target doesn't have a regular flex menu associated with it yet
					$target.data('mobilesetting', {dir: $target.attr('data-dir'), useroffsets: [0,0]}) 
					$target.bind('click', function(e){
						if (flexdropdownmenu.mobilemql.matches){ // if in mobile menu mode
							$('div.flexoverlay').css('display', 'block')
							var winwidth = $(window).width()
							var winheight = $(window).height()
							var marginLeft = (winwidth/2 - $mobilemenu.data('dimensions').w/2 < 0)? -winwidth/2 : -$mobilemenu.data('dimensions').w/2
							var marginTop = (winheight/2 - $mobilemenu.data('dimensions').h/2 < 0)? -winheight/2 : -$mobilemenu.data('dimensions').h/2
							$mobilemenu.css({left:'50%', top:'50%', marginLeft: marginLeft, marginTop: marginTop})
							$mobilemenu.css({zIndex: flexdropdownmenu.mobilezindex++, display:'block'})
							return false
						}
					})
				}

		}
	}
}

jQuery.fn.addflexmenu=function(flexmenuid, options){
	var $=jQuery
	flexdropdownmenu.mobilemql = (window.matchMedia)? window.matchMedia(flexdropdownmenu.mobilemediaquery) : {matches: false, addListener: function(){}}
	return this.each(function(){ //return jQuery obj
		var $target=$(this)
		if (typeof options=="object"){ //if options parameter defined
			if (options.dir)
				$target.attr('data-dir', options.dir) //set/overwrite data-dir attr with defined value
			if (options.offsets)
				$target.attr('data-offsets', options.offsets) //set/overwrite data-offsets attr with defined value
		}
		if ($('#'+flexmenuid).length==1){ //check flex menu is defined
			flexdropdownmenu.init($, $target, $('#'+flexmenuid))
			if (window.matchMedia){
				window.matchMedia(flexdropdownmenu.mobilemediaquery).addListener(function(){
					flexdropdownmenu.init($, $target, $('#'+flexmenuid))
				})
			}
		}
	})
};

//By default, add flex menu to anchor links with attribute "data-flexmenu"
jQuery(document).ready(function($){
	var $anchors=$('*[data-flexmenu]')
	$anchors.each(function(){
		$(this).addflexmenu(this.getAttribute('data-flexmenu'))
	})
})


//ddlistmenu: Function to define a UL list menu dynamically

function ddlistmenu(id, className){
	var menu=document.createElement('ul')
	if (id)
		menu.id=id
	if (className)
		menu.className=className
	this.menu=menu
}

ddlistmenu.prototype={
	addItem:function(url, text, target){
		var li=document.createElement('li')
		li.innerHTML='<a href="'+url+'" target="'+target+'">'+text+'</a>'
		this.menu.appendChild(li)
		this.li=li
		return this
	},
	addSubMenu:function(){
		var s=new ddlistmenu(null, null)
		this.li.appendChild(s.menu)
		return s

	}
}