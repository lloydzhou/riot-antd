import './icon.tag';
<button> 
  <i if={iconType} riot-tag="icon" type={iconType}></i>
  <yield/>

  var root = this.root, classList = root.classList;
  const {type, shape, size, className, htmlType, icon, loading = false, prefixCls = 'ant-btn', onMouseUp, onClick} = opts;
  const clickClassName = prefixCls + '-clicked';

  const clearButton = () => {
    root.classList.remove(clickClassName)
  }

  var clickedTimeout, timeout;

  classList.add(prefixCls);
  if (type) classList.add(prefixCls + '-' + type);
  if (shape) classList.add(prefixCls + '-' + shape);
  if (icon) classList.add(prefixCls + '-icon-only');
  if (loading) classList.add(prefixCls + '-loading');
  if ('large' == size || 'small' == size)
    classList.add(prefixCls + ('large' == size ? '-lg' : '-sm'));
  if (className) classList.add(className);

  root.setAttribute('type', htmlType || 'button');

  this.iconType = loading ? 'loading' : icon;

  this.on('unmount', e=>{
    if (clickedTimeout) clearTimeout(clickedTimeout);
    if (timeout) clearTimeout(timeout);
  })
  root.onmouseup = (e => {
    root.blur();
    onMouseUp && onMouseUp(e)
  }).bind(this)

  root.onclick = (e => {
    clearButton()

    clickedTimeout = setTimeout(()=>{
      root.classList.add(clickClassName)
    }, 10);

    if (timeout) clearTimeout(timeout);
    clickedTimeout = setTimeout(()=>{
      clearButton()
    }, 500);

    onClick && onClick(e)

  }).bind(this);

</button>

<button-group>
  <yield/>

  var root = this.root, classList = root.classList, prefixCls = 'ant-btn-group';
  const {size, className} = opts;

  classList.add(prefixCls);
  if ('large' == size || 'small' == size)
    classList.add(prefixCls + ('large' == size ? '-lg' : '-sm'));

  if (className) classList.add(className);

</button-group>


