// 데이터 불러오기
var gfn_loadData = function(url) {
  return new Promise((resolve, reject) => {
	const xhr = new XMLHttpRequest();
	xhr.responseType = 'json';

	xhr.open('POST',
			url,
			true);
	xhr.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	
	xhr.onload = function() {
		if (this.status >= 200 && this.status < 300) {
			resolve(xhr.response);
		} else {
			reject({
				status: this.status,
				statusText: xhr.statusText
			});
		}
	};
	xhr.onerror = function () {
      reject({
        status: this.status,
        statusText: xhr.statusText
      });
    };
    xhr.send();
  });
}

//데이터 내보내기
var gfn_uploadData = function(updateRows, url) {
  return new Promise((resolve, reject) => {
	const xhr = new XMLHttpRequest();
	//xhr.responseType = 'json';
	
	xhr.open('POST',
			url,
			true);
	xhr.setRequestHeader("Content-Type",
			"application/json");
	xhr.send(JSON.stringify(updateRows));

	xhr.onload = function() {
		if (this.status >= 200 && this.status < 300) {
			resolve(xhr.response);
		} else {
			reject({
				status: this.status,
				statusText: xhr.statusText
			});
		}
	};
	xhr.onerror = function () {
      reject({
        status: this.status,
        statusText: xhr.statusText
      });
    };
    
  });
}


//공통 데이터 가져오기
var gfn_commonLoadData = function(url) {
  return new Promise((resolve, reject) => {
	const xhr = new XMLHttpRequest();
	xhr.responseType = 'json';

	xhr.open('POST',
			url,
			true);
	xhr.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	
	xhr.onload = function() {
		if (this.status >= 200 && this.status < 300) {
			resolve(xhr.response);
		} else {
			reject({
				status: this.status,
				statusText: xhr.statusText
			});
		}
	};
	xhr.onerror = function () {
      reject({
        status: this.status,
        statusText: xhr.statusText
      });
    };
    xhr.send();
  });
}

var gfn_commonLoadDataRequest = function(url, receivedData, callbackFunction) {
	gfn_commonLoadData(url)
	.then(function (datums) {
		gfn_setCommonData(datums, receivedData, callbackFunction);
	})
	.catch(function (err) {
		console.error(err.statusText);
	});
}

var gfn_setCommonData = function(datums, receivedData, callbackFunction) {
	for(var data of datums) {
		var newRow = [];
		var keys = Object.keys(data);
		for(var key of keys) {
			newRow[key] = data[key]
		}
		receivedData.push(newRow);
	}
	
	if(typeof callbackFunction == 'function') {
		callbackFunction();
	}
}