<animate>

  <yield/>

  var root = this.root, style = root.style, classList = root.classList;
  var {
    animate='riot-animate',
    delay=0,
    duration=0,
    onend=((e)=>{}),
    autoStart=false,
  } = opts;

  this.on('start', (end)=>{
    root.removeEventListener('animationend', onend, false)
    root.removeEventListener('transitionend', onend, false)
    onend = end || onend;
    root.addEventListener('animationend', onend, false)
    root.addEventListener('transitionend', onend, false)
    if (delay) style.animateDelay = style.transitionDelay = delay;
    if (duration) style.animateDuration = style.transitionDuration = duration;
    classList.remove(animate);
    classList.add(animate);
  });

</animate>
