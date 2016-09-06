import util from './util.js';
<notice>
<div class={className} style={style}>
  <div name="contentdiv" class={componentClass + '-content'}>
    <yield/>
    <a if={closable} name="closebtn" tabIndex="0" onclick={close} class={componentClass + '-close'}>
      <span class={componentClass + 'close-x'}></span>
    </a>
  </div>
</div>
const {
  onClose=()=>{},
  duration=1.5,
  style='right: 50%;',
  prefixCls='',
  closable=false,
  className='',
  content=null
} = opts;

var closeTimer = null, clearCloseTimer = () => {
  if (closeTimer) clearTimeout(closeTimer);
};

this.componentClass = prefixCls + '-notice';
this.className = [this.componentClass, closable ? this.componentClass + '-closable' : '', className].join(' ')
this.style = style;

this.close = (e) => {
  clearCloseTimer();
  onClose(e);
};
this.on('mount', ()=>{
  if (duration) {
    closeTimer = setTimeout(() => {
      this.close()
    }, duration * 1000)
  }
  if (content){
    this.contentdiv.insertBefore(util.getContent(content), this.contentdiv.firstChild)
  }
})
this.on('unmount', ()=>{
  clearCloseTimer();
})
</notice>
