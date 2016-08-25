<animate>

  <yield/>

  var root = this.root, style = root.style, classList = root.classList;
  var {
    animate='riot-animate',
    delay=0,
    duration=0,
    onend=(()=>{}),
    autoStart=false,
  } = opts;

  this.on('start', (end)=>{
    if (delay) style.animateDelay = style.transitionDelay = delay;
    if (duration) style.animateDuration = style.transitionDuration = duration;
    classList.add(animate);
    onend = end || onend;
  });

  const animationend = (e) => {
    classList.remove(animate);
    onend(this);
  };

  
  this.on('mount', (e)=>{
    root.addEventListener('animationend', animationend, false)
    root.addEventListener('transitionend', animationend, false)
    if (autoStart)
      this.trigger('start');
  });

</animate>
