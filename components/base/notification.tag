import './animate.tag'
<notification>
<div class={className} style={style}>
  <animate animate={transition}>
    <notice
      each={notices}
      content={content}
      closable={closable || true}
      prefix-cls={parent.prefixCls}
      on-close={parent.remove(key)}
    />
  </animate>
</div>
let seed = 0;
const now = Date.now(), {
  prefixCls='rc-notification',
  className='',
  animation='fade',
  style='top: 65px;left: 50%;',
  transitionName='',
  notices
} = opts;

this.notices = notices || [];
console.log(notices)
this.prefixCls = prefixCls;
this.className = [prefixCls, className].join(' ')
this.transition = transitionName || (animation ? `${prefixCls}-${animation}` : '')

this.add = (notice) => {
  const key = notice.key = notice.key || `notification_${now}_${++seed}`;
  if (this.notices.filter(v => v.key === key).length == 0){
    this.notices.push(notice);
    this.update();
  }
};
this.remove = (key) => {
  this.notices = this.notices.filter(notice => notice.key != key);
  this.update();
};
</notification>
