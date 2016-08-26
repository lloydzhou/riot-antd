<badge>
  <span class={prefixCls} title={opts.count}>
    <yield/>
    <sup if={dot} class='{prefixCls}-dot'></sup>
    <sup if={!dot && count} class="{prefixCls}-count">{count}</sup>
  </span>

  const {prefixCls='ant-badge', count, overflowCount=100, dot=false} = opts;
  this.prefixCls = prefixCls;
  this.dot = dot;
  this.count = count > overflowCount ? (overflowCount - 1) + '+' : count;

</badge>

