import cssAnimate, { isCssAnimationSupported } from 'css-animation';
<animate>

  <yield/>

  const transitionMap = {
    enter: 'transitionEnter',
    appear: 'transitionAppear',
    leave: 'transitionLeave'
  };

  const root = this.root, noop = ()=>{return {}};
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
  const isAppearSupported = () => { return transitionName && allowAppearCallback(); };
  const isEnterSupported  = () => { return transitionName && allowEnterCallback();  };
  const isLeaveSupported  = () => { return transitionName && allowLeaveCallback();  };

  var stoper = null;
  const stop = () => {
    const s = stoper;
    if (stoper){
      s.stop();
      stoper = null;
    }
  }
  const transilate = (animationType, done) => {
    console.log(animationType, isCssAnimationSupported)
    stop();
    const end = ()=>{
      stoper = null;
      done();
    }
    if ((isCssAnimationSupported || !animation[animationType]) && transitionName && transitionMap[animationType]) {
      stoper = cssAnimate(root, {active: transitionName + '-' + animationType}, end);
      console.log(stoper)
    } else {
      stoper = animation[animationType](root, end)
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

  this.on('updated', e => {
    !stoper && (opts.show ? enter : leave)();
  })
  this.on('mount', e => {
    enter();
  })

</animate>
