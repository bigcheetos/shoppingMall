
//데이터 가져오기
function gfn_common_load_data(url) {
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
function gfn_common_load_data_request(url, received_data, callback_function) {
	gfn_common_load_data(url)
	.then(function (datums) {
		gfn_set_common_data(datums, received_data, callback_function);
	})
	.catch(function (err) {
		console.error(err.statusText);
	});
}

function gfn_set_common_data(datums, received_data, callback_function) {
	for(var data of datums) {
		var new_row = [];
		var keys = Object.keys(data);
		for(var key of keys) {
			new_row[key] = data[key]
		}
		received_data.push(new_row);
	}
	
	if(callback_function != null 
	&& callback_function() != '' 
	&& callback_function() != false) {
		callback_function();
	}
}