import 'antd/lib/alert/style';
import './icon.tag';
import './base/animate.tag';
<alert>
    <div if={!closed} riot-tag="animate" animate={prefixCls + '-slide-up-leave'} class="{prefixCls} {prefixCls+'-'+opts.type} {!!opts.description ? prefixCls+'-with-description' : ''} {!showIcon ? prefixCls + '-no-icon' : ''} {!!opts.banner ? prefixCls + '-banner' : ''}">
      <icon if={showIcon} class="ant-alert-icon" type={iconType}></icon>
      <span class={prefixCls + '-message'}>{parent.opts.message}</span>
      <span class={prefixCls + '-description'}>{parent.opts.description}</span>
      <a if={parent.opts.closable || parent.opts.closeText} onclick={close}>
        {parent.opts.closeText}
        <i if={!parent.opts.closeText} riot-tag="icon" type="cross"></i>
      </a>
    <div>

  const noop = ()=>{}, {
    banner,
    showIcon,
    type = 'info',
    description,
    prefixCls = 'ant-alert',
    closable = false,
    closeText,
    onClose = noop,
  } = opts;

  this.iconType = {
    success: 'check-circle',
    info: 'info-circle',
    error: 'cross-circle',
    warning: 'exclamation-circle',
  }[banner ? 'warning' : type] || 'default';

  this.closed = false;
  this.closable = closable || closeText;
  this.prefixCls = prefixCls;
  this.showIcon = showIcon || banner;

  if (!!description) this.iconType += '-o';

  this.close = (e) =>{
    e.preventDefault();
    console.log(this.tags)
    this.tags.animate.trigger('start', ()=>{
      this.closed = true;
      this.update()
    })
    onClose(e);
  }
</alert>

