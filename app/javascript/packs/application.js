require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("bootstrap/dist/js/bootstrap")
window.$ = $;

require("trix")
require("@rails/actiontext")

//変数定義
var navigationOpenFlag = false;
var navButtonFlag = true;
var focusFlag = false;

//ハンバーガーメニュー
    $(function(){

      $(document).on('click','.el_humburger',function(){
        if(navButtonFlag){
          spNavInOut.switch();
          //一時的にボタンを押せなくする
          setTimeout(function(){
            navButtonFlag = true;
          },200);
          navButtonFlag = false;
        }
      });
      $(document).on('click touchend', function(event) {
        if (!$(event.target).closest('.bl_header,.el_humburger').length && $('body').hasClass('js_humburgerOpen') && focusFlag) {
          focusFlag = false;
          //scrollBlocker(false);
          spNavInOut.switch();
        }
      });
    });

//ナビ開く処理
function spNavIn(){
  $('body').removeClass('js_humburgerClose');
  $('body').addClass('js_humburgerOpen');
  setTimeout(function(){
    focusFlag = true;
  },200);
  setTimeout(function(){
    navigationOpenFlag = true;
  },200);
}

//ナビ閉じる処理
function spNavOut(){
  $('body').removeClass('js_humburgerOpen');
  $('body').addClass('js_humburgerClose');
  setTimeout(function(){
    $(".uq_spNavi").removeClass("js_appear");
    focusFlag = false;
  },200);
  navigationOpenFlag = false;
}

//ナビ開閉コントロール
var spNavInOut = {
  switch:function(){
    if($('body.spNavFreez').length){
      return false;
    }
    if($('body').hasClass('js_humburgerOpen')){
     spNavOut();
    } else {
     spNavIn();
    }
  }
};

//アラートを2秒後に削除
$(function(){
  setTimeout("$('.alert').fadeOut('slow')", 2000);
});





    document.addEventListener("turbolinks:load", function() {
            let matches = document.querySelectorAll('.topic_show h1, .topic_show h2.shop_title');
            let contentsList = document.getElementById('toc');
            matches.forEach(function (value, i) {
                if(value.id === '') {
                  let div = document.createElement('div');
                  let ul = document.createElement('ul');
                  let li = document.createElement('li');
                  let a = document.createElement('a');
                  value.id = i;
                  a.innerHTML = value.textContent;
                  a.href = `#${value.id}`
                  li.appendChild(a)
                  ul.appendChild(li);
                  div.appendChild(ul);
                  contentsList.appendChild(div);
                }
            });
        });










        // document.addEventListener("turbolinks:load", function() {
        //     // document.addEventListener('DOMContentLoaded', function () {
        //         // let contentsList = document.getElementById('toc');
        //         // let div = document.createElement('div');
        //         let matches = document.querySelectorAll('.topic_show h1, .topic_show h2.shop_title');
        //         let contentsList = document.getElementById('toc');
        //
        //         matches.forEach(function (value, i) {
        //
        //             if(value.id === '') {
        //               let div = document.createElement('div');
        //                 value.id = i;
        //
        //                 // if(value.tagName === 'H1' || value.tagName === 'H2') {
        //                     let ul = document.createElement('ul');
        //                     let li = document.createElement('li');
        //                     let a = document.createElement('a');
        //                     a.innerHTML =  value.textContent;
        //                     a.href = `#${value.id}`
        //                     li.appendChild(a)
        //                     ul.appendChild(li);
        //                     div.appendChild(ul);
        //                     contentsList.appendChild(div);
        //                 // }
        //
        //                 //
        //                 // if(value.tagName === 'H2') {
        //                 //     let ul = document.createElement('ul');
        //                 //     let li = document.createElement('li');
        //                 //     let a = document.createElement('a');
        //                 //     a.innerHTML = value.textContent;
        //                 //     a.href = `#${value.id}`
        //                 //     li.appendChild(a)
        //                 //     ul.appendChild(li);
        //                 //     div.appendChild(ul);
        //                 //     contentsList.appendChild(div);
        //                 // }
        //
        //             }
        //         });
        //     });
