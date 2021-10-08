'use strict';

const domContainer = document.querySelector('#commonSearchDiv_container');
const btn_select_all = React.createElement("button", {type: "button",className: "btn btn-secondary btn-select-all"}, "전체선택");
const btn_deselect_all = React.createElement("button", {type: "button",className: "btn btn-secondary btn-deselect-all"}, "선택취소");
const btn_custom = React.createElement("button", {type: "button",className: "btn btn-secondary"}, domContainer.dataset.btn_custom);
const btn_search = React.createElement("button", {type: "button",className: "btn btn-primary",onClick: onBtSearch}, "조회");
const btn_add = React.createElement("button", {type: "button",className: "btn btn-success",onClick: onBtAddBottom}, "신규");
const btn_save = React.createElement("button", {type: "button",className: "btn btn-warning",onClick: onBtSave}, "저장");
const btn_delete = React.createElement("button", {type: "button",className: "btn btn-danger",onClick: onBtDelete}, "삭제");

class CommonSearchDiv extends React.Component {
  constructor(props) {
    super(props);
    
    this.state = {
    	btn_select_all: domContainer.dataset.btn_select_all,
    	btn_deselect_all: domContainer.dataset.btn_deselect_all,
    	btn_custom: domContainer.dataset.btn_custom,
    	btn_search: domContainer.dataset.btn_search,
    	btn_add: domContainer.dataset.btn_add,
    	btn_save: domContainer.dataset.btn_save,
    	btn_delete: domContainer.dataset.btn_delete,
    }
  }
  
  render() {
    return React.createElement("div", {}, 
    		React.createElement("div", {className: "float_left"},
    				this.state.btn_select_all?btn_select_all:'',
					this.state.btn_deselect_all?btn_deselect_all:'',
					this.state.btn_custom?btn_custom:''),
    		React.createElement("div", {className: "float_right"}, 
    				this.state.btn_search?btn_search:'',
    				this.state.btn_add?btn_add:'', 
    				this.state.btn_save?btn_save:'',
    				this.state.btn_delete?btn_delete:'')
			);
  }
}

ReactDOM.render(React.createElement(CommonSearchDiv, {}, null), domContainer);