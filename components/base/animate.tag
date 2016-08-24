import cssAnimate, { isCssAnimationSupported } from 'css-animation';
<animate>
  <yield/>

  const transitionMap = {
    enter: 'transitionEnter',
    appear: 'transitionAppear',
    leave: 'transitionLeave'
  };

  const root = this.root, noop = ()=>{};
  const {
    show,
    animation = {default: noop},
    transitionName,
    transitionEnter=true,
    transitionAppear=false,
    transitionLeave=true,
    exclusive,
    onEnd=noop,
    onEnter=noop,
    onLeave=noop,
    onAppear=noop
  } = opts;
  
  const allowAppearCallback = () => { return transitionAppear || animation.appear; };
  const allowEnterCallback  = () => { return transitionEnter  || animation.enter;  };
  const allowLeaveCallback  = () => { return transitionLeave  || animation.leave;  };
  const isAppearSupported = () => { return transitionName && allowAppearSupported(); };
  const isEnterSupported  = () => { return transitionName && allowEnterSupported();  };
  const isLeaveSupported  = () => { return transitionName && allowLeaveSupported();  };

  var stoper = null;
  const stop = () => {
    const s = stoper;
    if (stopper){
      s.stop();
      stoper = null;
    }
  }
  const transilate = (animationType, done) => {
    stop();
    const end = ()=>{
      stoper = null;
      done();
    }
    if ((isCssAnimationSupported || !animation[animationType]) && transitionName && transitionMap[animationType]) {
      stopper = cssAnimate(root, transitionName + '-' + animationType, end)
    } else {
      stopper = animation[animationType](root, end)
    }
  }
  const enter = () => {
    root.style.display = '';
    if (isEnterSupported()){
      transilate('enter', ()=>{
        if (allowEnterCallback())
          onEnter(this);
      })
    }
  }
  const leave = () => {
    if (isLeaveSupported()){
      root.style.display = 'block';
      transilate('leave', ()=>{
        if (allowLeaveCallback()){
          root.style.display = '';
          onEnd(this)
        }
      })
    }
  }

  this.on('show', e => {
    this.root.style.display = ''
  })

  this.on('update', e => {
    (show ? enter : leave)();
  })

</animate>
