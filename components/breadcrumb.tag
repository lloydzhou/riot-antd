<breadcrumb>
  <virtual each={routes}>
    <breadcrumb-item prefix-cls={prefixCls} separator={separator} href={href} name={name} />
  </virtual>
  <yield/>

  var root = this.root, classList = root.classList, style=root.style;
  const {
    prefixCls='ant-breadcrumb',
    separator='/',
    routes=[]
  } = opts;

  classList.add(prefixCls);
  style.display = 'block';
  this.routes = routes.map(route => {
    if (typeof route == 'string') route = {name: route};
    route.prefixCls = route.prefixCls || prefixCls;
    route.separator = route.separator || separator;
    return route;
  });

</breadcrumb>

<breadcrumb-item>
  <a if={opts.href} href={opts.href} class={prefixCls+'-link'}>
    {opts.name}
    <yield />
  </a>
  <span if={!opts.href} class={prefixCls+'-link'}>
    {opts.name}
    <yield />
  </span>
  <span class={prefixCls+'-separator'}>{opts.separator || '/'}</span>
  this.prefixCls = opts.prefixCls || 'ant-breadcrumb';
</breadcrumb-item>

