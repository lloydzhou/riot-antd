import component from '../components/index'
<test>
  <icon type="inbox"></icon>
  <icon type="notification"></icon>
  <icon type="github"></icon>
  <icon type="download"></icon>
  <icon type="edit"></icon>

  <div riot-tag="row">
    <div riot-tag="col" xs={{span: 10, offset: 4}} span="10" offset="4">
      <icon type="edit"></icon>
    </div>
    <div riot-tag="col" xs={{span: 10}} span="10">
      <icon type="download"></icon>
      <button riot-tag="button" type="primary" size="large">Large</button>
    </div>
    <div riot-tag="col" xs={{span: 10}} span="10">
      <div riot-tag="button-group">
        <button riot-tag="button" type="primary" icon="cloud"></button>
        <button riot-tag="button" type="primary" icon="cloud-download"></button>
      </div>
    </div>
  </div>
  <div riot-tag="card" title="hello" bordered="bordered">
    <breadcrumb routes={['app', 'menu']}>
      <breadcrumb-item href="/home" name="home"/>
      <breadcrumb-item href="/first" name="first"/>
    </breadcrumb>


    <yield to="title">
      <icon type="github"></icon>
    </yield>
    <yield to="extra">
      <icon type="inbox"></icon>
    </yield>
    hello world!!!
    <br />
    <badge count="1001"></badge>
    <br />
    <br />
    <badge dot="dot" count=5>
      <icon type="notification" />
    </badge>
    <br />
    <badge dot="dot">
      <a href="#">一个链接</a>
    </badge>
  </div>

  <alert message="消息提示的文案" type="info" close-text="不再提醒"></alert>
  <alert message="成功提示的文案" type="success" show-icon="true" />

  <alert
    message="成功提示的文案"
    description="成功提示的辅助性文字介绍成功提示的辅助性文字介绍成功提示的辅助性文字介绍成功提示的辅助性文字介绍"
    type="success"
    show-icon="true"
    />

  <notice>test notice</notice>
  <notification notices={notices}></notification>

  <style>
    .anticon {
      font-size: 26px;
    }
  </style>

  var notice = document.createElement('span');
  notice.innerHTML = 'test notice3';
  this.notices = [{content: 'test notice1'}, {content: 'test notice2'}, {content: notice}]
  component.notification.newInstance().notice({content: 'test notice4', closable: true})
  console.log(riot)

</test>

