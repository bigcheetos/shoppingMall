'use strict';

class CommonSearchDiv extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return /*#__PURE__*/React.createElement("div", {
      /*style: "padding: 2px;"*/
    }, /*#__PURE__*/React.createElement("div", {
    	className: "float_left"
      /*style: "float: left"*/
    }, /*#__PURE__*/React.createElement("button", {
      type: "button",
      className: "btn btn-secondary btn-select-all"
      /*onClick: onBtSelectAll*/
    }, "전체선택"), /*#__PURE__*/React.createElement("button", {
      type: "button",
      className: "btn btn-secondary btn-deselect-all"
      /*onClick: onBtDeselectAll*/
    }, "선택취소")), /*#__PURE__*/React.createElement("div", {
    	className: "float_right"
      /*style: "float: right"*/
    }, /*#__PURE__*/React.createElement("button", {
      type: "button",
      className: "btn btn-primary",
      onClick: onBtSearch
    }, "조회"), /*#__PURE__*/React.createElement("button", {
      type: "button",
      className: "btn btn-success",
      onClick: onBtAddBottom
    }, "신규"), /*#__PURE__*/React.createElement("button", {
      type: "button",
      className: "btn btn-warning",
      onClick: onBtSave
    }, "저장"), /*#__PURE__*/React.createElement("button", {
      type: "button",
      className: "btn btn-danger",
      onClick: onBtDelete
    }, "삭제")));
  }

}

const domContainer = document.querySelector('#commonSearchDiv_container');
ReactDOM.render(React.createElement(CommonSearchDiv, {}, null), domContainer);