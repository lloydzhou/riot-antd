import '../index'
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

  <style>
    .anticon {
      font-size: 26px;
    }
  </style>

</test>

