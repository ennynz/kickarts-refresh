<<<<<<< HEAD
$(document).ready(function(){function n(n){this.dd=n,this.placeholder=this.dd.children("span"),this.opts=this.dd.find("ul.dropdown > li"),this.val="",this.index=-1,this.initEvents()}$("#our-team-section").hide(),$("#contact-section").hide(),$(".player").hide(),$(".icon-4x").click(function(){$(".player").fadeIn("slow")}),$(".menu-link").click(function(){$(".active").removeClass("active"),$(this).addClass("active")}),$(function(){$(".box-height").matchHeight()}),$(".menu-button, ul a").click(function(){$("ul").toggleClass("show-menu"),$(".menu-button").toggleClass("menu-open"),$(".menu-button").toggleClass("menu-close")}),$(function(){$(".contact-box").click(function(){$(this).find("iframe").css("pointer-events","all")}).mouseleave(function(){$(this).find("iframe").css("pointer-events","none")})}),$(document).scroll(function(){var n=$(this).scrollTop();n>200?($(".top-bar").removeClass("is-hidden").addClass("is-showing"),$("nav").removeClass("is-hidden").addClass("is-showing")):($(".top-bar").removeClass("is-showing").addClass("is-hidden"),$("nav").removeClass("is-showing").addClass("is-hidden"))}),$(function(){$("#includeNav").load("nav.html")}),n.prototype={initEvents:function(){var n=this;n.dd.on("click",function(n){return $(this).toggleClass("active"),!1}),n.opts.on("click",function(){var t=$(this);n.val=t.text(),n.index=t.index(),n.placeholder.text(n.val)})},getValue:function(){return this.val},getIndex:function(){return this.index}},$(function(){var t=new n($("#dd"));$(document).click(function(){$(".wrapper-dropdown-1").removeClass("active")})}),$(".name").on("blur",function(){$(this).val().length>0?$(this).next().addClass("stay"):$(this).next().removeClass("stay")})});
=======
$(document).ready(function(){function n(n){this.dd=n,this.placeholder=this.dd.children("span"),this.opts=this.dd.find("ul.dropdown > li"),this.val="",this.index=-1,this.initEvents()}$("#our-team-section").hide(),$("#contact-section").hide(),$("#search-section").hide(),$(".player").hide(),$(".icon-4x").click(function(){$(".player").fadeIn("slow")}),$(".menu-link").click(function(){$(".active").removeClass("active"),$(this).addClass("active")}),$(function(){$(".box-height").matchHeight()}),$(".menu-button, ul a").click(function(){$("ul").toggleClass("show-menu"),$(".menu-button").toggleClass("menu-open"),$(".menu-button").toggleClass("menu-close")}),$(function(){$(".contact-box").click(function(){$(this).find("iframe").css("pointer-events","all")}).mouseleave(function(){$(this).find("iframe").css("pointer-events","none")})}),$(document).scroll(function(){var n=$(this).scrollTop();140>n&&($(".top-bar").removeClass("is-showing").addClass("is-hidden"),$("nav").removeClass("is-showing").addClass("is-hidden")),n>140&&($(".top-bar").removeClass("is-hidden").addClass("is-showing"),$("nav").removeClass("is-hidden").addClass("is-showing"))}),window.onscroll=function(n){window.innerHeight+window.scrollY>=document.body.scrollHeight&&($(".top-bar").removeClass("is-hidden").addClass("is-showing"),$("nav").removeClass("is-hidden").addClass("is-showing"))},$(function(){$("#includeNav").load("nav.html")}),n.prototype={initEvents:function(){var n=this;n.dd.on("click",function(n){return $(this).toggleClass("active"),!1}),n.opts.on("click",function(){var i=$(this);n.val=i.text(),n.index=i.index(),n.placeholder.text(n.val)})},getValue:function(){return this.val},getIndex:function(){return this.index}},$(function(){var i=new n($("#dd")),e=new n($("#dd2")),s=new n($("#dd3")),t=new n($("#dd4"));$(document).click(function(){$(".wrapper-dropdown-1").removeClass("active")})}),$(".name").on("blur",function(){$(this).val().length>0?$(this).next().addClass("stay"):$(this).next().removeClass("stay")})});
>>>>>>> 3665b6661e022def531413e58b225b024fca884d
