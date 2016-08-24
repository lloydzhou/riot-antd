import 'antd/lib/alert/style';
import './icon.tag';
import cssAnimate from 'css-animation';
<alert>
    <div if={!closed} name="animate" class="{prefixCls} {prefixCls+'-'+opts.type} {!!opts.description ? prefixCls+'-with-description' : ''} {!showIcon ? prefixCls + '-no-icon' : ''} {!!opts.banner ? prefixCls + '-banner' : ''}">
      <icon if={showIcon} class="ant-alert-icon" type={iconType}></icon>
      <span class={prefixCls + '-message'}>{opts.message}</span>
      <span class={prefixCls + '-description'}>{opts.description}</span>
      <a if={opts.closable || opts.closeText} onclick={close}>
        {opts.closeText}
        <i if={!opts.closeText} riot-tag="icon" type="cross"></i>
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
    cssAnimate(this.animate, {name: prefixCls + '-slide-up-leave'}, ()=>{
      console.log('end')
      this.closed = true;
      this.update()
    })
    onClose(e);
  }

</alert>
