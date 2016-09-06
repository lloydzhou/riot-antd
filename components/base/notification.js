
import "./notification.tag";

export default {
  newInstance: function(opts){
    const div = document.createElement('div');
    document.body.appendChild(div);
    const notification = riot.mount(div, 'notification', opts||{})[0];
    return {
      notice(noticeProps) {
        notification.add(noticeProps);
      },
      removeNotice(key) {
        notification.remove(key);
      },
      component: notification,
      destroy() {
        riot.unmount(div);
        document.body.removeChild(div);
      }
    };
  }
};
