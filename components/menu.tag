import animate from './base/openAnimation';
<menu>
  <ul class={cls}><yield /></ul>

  const noop = ()=>{};
  const {
    mode='horizontal',
    theme='light',
    prefixCls='ant-menu',
    openAnimation,
    openTransitionName,
    onClick=noop,
    onClose=noop,
    onOpen=noop,
  } = opts;

  this.cls = prefixCls + '-root';

  let switchModeFromInline = false;
  let _openAnimation = openAnimation || openTransitionName;
  if (!_openAnimation){
    switch(mode){
      case 'horizontal':
        _openAnimation = 'slide-up';break;
      case 'vertical':
        if (switchModeFromInline){
          _openAnimation = '';
          switchModeFromInline = false;
        } else _openAnimation = 'zoom-big';
        break;
      case 'inline':
        _openAnimation = animation; break;
      default:
    }
  }
  
</menu>
