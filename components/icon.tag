<icon>

  var root = this.root, classList = root.classList, c = 'anticon';

  classList.add(c, c + '-' + opts.type)
  if (opts.className)
    classList.add(opts.className)

  root.onclick = e => {
    (opts.onclick || (e =>{
      //console.log(e, this)
    }))(e)
  }
</icon>

