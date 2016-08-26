<row>
  <yield />

  var root = this.root, style = root.style, classList = root.classList;
  const {type, justify, align, className, gutter} = opts

  if ('flex' == type){
    classList.add('ant-row-flex')
    if (justify) classList.add('ant-row-flex-' + justify)
    if (align) classList.add('ant-row-flex-' + align)
  } else classList.add('ant-row')
  if (className) classList.add(className)

  if (gutter > 0){
    style.marginLeft = style.marginRight = gutter / 2;
    [].concat(this.tags.col).map(col => {
      col.trigger('gutter', gutter)
    })
  }

</row>

<col>
  <yield />

  var root = this.root, style = root.style, classList = root.classList;
  const {className} = opts;

  const setClass = (size, sizeName) => {
    var col = sizeName ? 'col-' + sizeName : 'col';
    if (size.span)
      classList.add(['ant', col, size.span].join('-'));

    ['order', 'offset', 'pull', 'push'].map(name => {
      if (size && size[name])
        classList.add(['ant', col, name, size[name]].join('-'));
    });
  }

  ['xs', 'sm', 'md', 'lg'].forEach(sizeName => {
    var size = (typeof opts[sizeName] === 'number')
      ? {span: opts[sizeName]}
      : opts[sizeName] || {};
      setClass(size)
  });
  setClass({opts})
  if (className) classList.add(className)

  this.on('gutter', gutter => {
    style.paddingLeft = style.paddingRight = gutter / 2;
  })
</col>

