var $image;$(document).ready(function(){(function(){var t,e,n,r,a;t=window.jQuery,t.paste=function(t){var n;return"undefined"!=typeof console&&null!==console&&console.log("DEPRECATED: This method is deprecated. Please use $.fn.pastableNonInputable() instead."),n=e.mountNonInputable(t),n._container},t.fn.pastableNonInputable=function(){var n,r,a,o;for(o=this,r=0,a=o.length;r<a;r++)n=o[r],n._pastable||t(n).is("textarea, input:text, [contenteditable]")||(e.mountNonInputable(n),n._pastable=!0);return this},t.fn.pastableTextarea=function(){var n,r,a,o;for(o=this,r=0,a=o.length;r<a;r++)n=o[r],n._pastable||t(n).is(":not(textarea, input:text)")||(e.mountTextarea(n),n._pastable=!0);return this},t.fn.pastableContenteditable=function(){var n,r,a,o;for(o=this,r=0,a=o.length;r<a;r++)n=o[r],n._pastable||t(n).is(":not([contenteditable])")||(e.mountContenteditable(n),n._pastable=!0);return this},r=function(t,e){var n,r,a,o,i,u,s,l,c,f,g;if(null==e&&(e=512),!(l=t.match(/^data\:([^\;]+)\;base64\,(.+)$/)))return null;for(f=l,l=f[0],u=f[1],n=f[2],o=atob(n),a=[],c=0;c<o.length;){for(g=o.slice(c,c+e),i=new Array(g.length),s=0;s<g.length;)i[s]=g.charCodeAt(s),s++;r=new Uint8Array(i),a.push(r),c+=e}return new Blob(a,{type:u})},n=function(){return t(document.createElement("div")).attr("contenteditable",!0).attr("aria-hidden",!0).attr("tabindex",-1).css({width:1,height:1,position:"fixed",left:-100,overflow:"hidden"})},a=function(e,n){var r,a,o,i,u,s;return i=void 0,u=void 0,o=void 0,a=void 0,r=void 0,"area"===(s=e.nodeName.toLowerCase())?(i=e.parentNode,u=i.name,!(!e.href||!u||"map"!==i.nodeName.toLowerCase())&&(o=t("img[usemap='#"+u+"']"),o.length>0&&o.is(":visible"))):(/^(input|select|textarea|button|object)$/.test(s)?(a=!e.disabled)&&(r=t(e).closest("fieldset")[0])&&(a=!r.disabled):a="a"===s?e.href||n:n,(a=a||t(e).is("[contenteditable]"))&&t(e).is(":visible"))},e=function(){function e(e,n){this._container=e,this._target=n,this._container=t(this._container),this._target=t(this._target).addClass("pastable"),this._container.on("paste",function(t){return function(e){var n,r,a,o,i,u,s,l,c,f,g,d,p;if(e.currentTarget!==e.target)return e.preventDefault();if(t._paste_event_fired=!0,null!=(null!=(c=e.originalEvent)?c.clipboardData:void 0))if(n=e.originalEvent.clipboardData,n.items)for(f=n.items,o=0,u=f.length;o<u;o++){if(a=f[o],a.type.match(/^image\//)){l=new FileReader,l.onload=function(e){return t._handleImage(e.target.result)};try{l.readAsDataURL(a.getAsFile())}catch(t){}e.preventDefault();break}"text/plain"===a.type&&a.getAsString(function(e){return t._target.trigger("pasteText",{text:e})})}else-1!==Array.prototype.indexOf.call(n.types,"text/plain")&&(p=n.getData("Text"),setTimeout(function(){return t._target.trigger("pasteText",{text:p})},1)),t._checkImagesInContainer(function(e){return t._handleImage(e)});if(n=window.clipboardData)if(null!=(g=p=n.getData("Text"))?g.length:void 0)setTimeout(function(){return t._target.trigger("pasteText",{text:p}),t._target.trigger("_pasteCheckContainerDone")},1);else{for(d=n.files,i=0,s=d.length;i<s;i++)r=d[i],t._handleImage(URL.createObjectURL(r));t._checkImagesInContainer(function(){})}return null}}(this))}return e.prototype._target=null,e.prototype._container=null,e.mountNonInputable=function(r){var o;return o=new e(n().appendTo(r),r),t(r).on("click",function(){return function(t){if(!a(t.target,!1))return o._container.focus()}}()),o._container.on("focus",function(){return function(){return t(r).addClass("pastable-focus")}}()),o._container.on("blur",function(){return function(){return t(r).removeClass("pastable-focus")}}())},e.mountTextarea=function(r){var a,o,i,u;return("undefined"!=typeof DataTransfer&&null!==DataTransfer?DataTransfer.prototype:void 0)&&(null!=(i=Object.getOwnPropertyDescriptor)&&null!=(u=i.call(Object,DataTransfer.prototype,"items"))?u.get:void 0)?this.mountContenteditable(r):(o=new e(n().insertBefore(r),r),a=!1,t(r).on("keyup",function(t){var e;return 17!==(e=t.keyCode)&&224!==e||(a=!1),null}),t(r).on("keydown",function(e){var n;return 17!==(n=e.keyCode)&&224!==n||(a=!0),null!=e.ctrlKey&&null!=e.metaKey&&(a=e.ctrlKey||e.metaKey),a&&86===e.keyCode&&(o._textarea_focus_stolen=!0,o._container.focus(),o._paste_event_fired=!1,setTimeout(function(){return function(){if(!o._paste_event_fired)return t(r).focus(),o._textarea_focus_stolen=!1}}(),1)),null}),t(r).on("paste",function(){return function(){}}()),t(r).on("focus",function(){return function(){if(!o._textarea_focus_stolen)return t(r).addClass("pastable-focus")}}()),t(r).on("blur",function(){return function(){if(!o._textarea_focus_stolen)return t(r).removeClass("pastable-focus")}}()),t(o._target).on("_pasteCheckContainerDone",function(){return function(){return t(r).focus(),o._textarea_focus_stolen=!1}}()),t(o._target).on("pasteText",function(){return function(e,n){var a,o,i;return i=t(r).prop("selectionStart"),o=t(r).prop("selectionEnd"),a=t(r).val(),t(r).val(""+a.slice(0,i)+n.text+a.slice(o)),t(r)[0].setSelectionRange(i+n.text.length,i+n.text.length),t(r).trigger("change")}}()))},e.mountContenteditable=function(n){return new e(n,n),t(n).on("focus",function(){return function(){return t(n).addClass("pastable-focus")}}()),t(n).on("blur",function(){return function(){return t(n).removeClass("pastable-focus")}}())},e.prototype._handleImage=function(t){var e;return t.match(/^webkit\-fake\-url\:\/\//)?this._target.trigger("pasteImageError",{message:"You are trying to paste an image in Safari, however we are unable to retieve its data."}):(e=new Image,e.crossOrigin="anonymous",e.onload=function(t){return function(){var n,a,o,i;a=document.createElement("canvas"),a.width=e.width,a.height=e.height,o=a.getContext("2d"),o.drawImage(e,0,0,a.width,a.height),i=null;try{i=a.toDataURL("image/png"),n=r(i)}catch(t){}if(i)return t._target.trigger("pasteImage",{blob:n,dataURL:i,width:e.width,height:e.height})}}(this),e.onerror=function(e){return function(){return e._target.trigger("pasteImageError",{message:"Failed to get image from: "+t,url:t})}}(this),e.src=t)},e.prototype._checkImagesInContainer=function(e){var n,r,a,o,i;for(i=Math.floor(1e3*Math.random()),o=this._container.find("img"),r=0,a=o.length;r<a;r++)n=o[r],n["_paste_marked_"+i]=!0;return setTimeout(function(r){return function(){var a,o,u;for(u=r._container.find("img"),a=0,o=u.length;a<o;a++)n=u[a],n["_paste_marked_"+i]||(e(n.src),t(n).remove());return r._target.trigger("_pasteCheckContainerDone")}}(this),1)},e}()}).call(this)});