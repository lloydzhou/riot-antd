import 'antd/lib/card/style';
<card>
  <div if={title} class={prefixCls + '-head'}>
    <h3 class={prefixCls + '-head-title'}>{title}
      <yield from="title"/>
    </h3>
  </div>
  <div class={prefixCls + '-extra'}>{extra}
    <yield from="extra"/>
  </div>
  <div if={loading} class={prefixCls + '-body'} style={opts.bodyStyle}>
    <div if={loading} riot-tag="spin"></div>
  </div>
  <div if={!loading} class={prefixCls + '-body'} style={opts.bodyStyle}>
    <yield from="body"/>
    <yield />
  </div>

  this.prefixCls = opts.prefixCls || 'ant-card';
  this.title = opts.title;
  this.extra = opts.extra;
  this.loading = opts.loading;

  const root = this.root, classList = root.classList;

  classList.add(this.prefixCls)
  if (opts.loading) classList.add(this.prefixCls + '-loading');
  if (opts.bordered) classList.add(this.prefixCls + '-bordered');
  if (opts.className) classList.add(opts.className);

</card>
