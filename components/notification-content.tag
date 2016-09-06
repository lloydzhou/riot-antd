import util from './util';
import './icon.tag';
<notification-content>
  <i if={opts.type} riot-tag="icon" type={opts.iconType} class-name={iconCls} />
  <div class={messageCls}>{opts.message}</div>
  <div class={descCls}>{opts.description}</div>
  <span name="btnspan" if={typeof opts.btn} class={btnCls}></span>

  
  var root = this.root, classList = root.classList, {prefixCls, iconType, type, btn} = opts;
  classList.add(`${prefixCls}-content`);
  if (iconType) classList.add(`${prefixCls}-with-icon`);
  this.iconCls = `${prefixCls}-icon ${prefixCls}-icon-${type}`
  this.messageCls = `${prefixCls}-message`
  this.descCls = `${prefixCls}-description`
  this.btnCls = `${prefixCls}-btn`

  this.on('mount', ()=>{
    if (btn){
      this.btnspan.insertBefore(util.getContent(btn), this.btnspan.firstChild)
    }
  })
</notification-content>

