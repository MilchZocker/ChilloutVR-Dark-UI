var cvr = function (params) {
    return new Library(params);
};
var Library = function (params) {
    var selector = document.querySelectorAll(params),
        i = 0;
    this.length = selector.length;
    for (; i < this.length; i++) {
        this[i] = selector[i];
    }
    return this;
};
cvr.fn = Library.prototype = {
    hide: function () {
        var len = this.length;
        while (len--) {
            if (this[len].style.display !== "none") this[len].setAttribute("data-default-display", cvr.defVal(this[len].style.display, "block"));
            this[len].style.display = "none";
        }
        return this;
    },
    show: function () {
        var len = this.length;
        while (len--) {
            var display = cvr.defVal(this[len].getAttribute("data-default-display"), "block");
            this[len].style.display = display;
        }
        return this;
    },
    innerHTML: function (html) {
        var len = this.length;
        while (len--) {
            this[len].innerHTML = html;
        }
        return this;
    },
    addHTMLLegacy: function (html) {
        var len = this.length;
        while (len--) {
            this[len].innerHTML += html;
        }
        return this;
    },
    addHTML: function (html) {
        var len = this.length;
        while (len--) {
            this[len].insertAdjacentHTML("beforeend", html);
        }
        return this;
    },
    load: function (url) {
        var len = this.length;
        while (len--) {
            var target = this[len];
            cvr.ajax({
                url: url, success: function (e) {
                    target.innerHTML = e.result;
                }
            });
        }
        return this;
    },
    attr: function (name, value) {
        var len = this.length;
        while (len--) {
            this[len].setAttribute(name, value);
        }
        return this;
    },
    event: function (triggerEvent, TriggerFunction) {
        var len = this.length;
        while (len--) {
            if (!this[len].addEventListener) {
                this[len].attachEvent("on" + triggerEvent, TriggerFunction);
            } else {
                this[len].addEventListener(triggerEvent, TriggerFunction, false);
            }
        }
        return this;
    },
    addClass: function (className) {
        var len = this.length;
        while (len--) {
            if ((" " + this[len].className + " ").indexOf(" " + className + " ") === -1) {
                this[len].className = (this[len].className + " " + className).trim();
            }
        }
        return this;
    },
    removeClass: function (className) {
        var len = this.length;
        while (len--) {
            var localClassName = this[len].className;
            localClassName = localClassName.replace(new RegExp("(?:^|\\s)" + className + "(?!\\S)"), "");
            this[len].className = localClassName.trim();
        }
        return this;
    },
    className: function (className) {
        var len = this.length;
        while (len--) {
            this[len].className = className;
        }
        return this;
    },
    getClassName: function () {
        var len = this.length;
        if (len > 0) {
            return this[0].className;
        } else {
            return "";
        }
    },
    getAttr: function (name) {
        var len = this.length;
        if (len > 0) {
            return this[0].getAttribute(name);
        } else {
            return "";
        }
    },
    appendChild: function (child) {
        var len = this.length;
        if (len > 0) {
            this[0].appendChild(child);
            return this;
        } else {
            return this;
        }
    },
    first: function () {
        var len = this.length;
        if (len > 0) {
            return this[0];
        } else {
            return false;
        }
    },
    remove: function () {
        var len = this.length;
        if (len > 0) {
            this[0].parentNode.removeChild(this[0]);
            return this;
        } else {
            return this;
        }
    }
};
cvr.defVal = function (_val, _defVal) {
    return (typeof(_val) !== "undefined") ? (_val !== "" ? _val : _defVal) : _defVal;
};
cvr.ajax = function (config) {
    var async = cvr.defVal(config.async, true);
    var url = config.url;
    var data = cvr.defVal(config.data, "");
    var method = cvr.defVal(config.method, "GET");
    var http;
    var dataString = "";
    if (method === "FILE") {
        dataString = data;
    } else if (typeof(data) === "string") {
        dataString = data;
    } else if (typeof(data) === "object") {
        var i = 0;
        for (var index in data) {
            if (i > 0) dataString += "&";
            dataString += index + "=" + data[index];
            i++;
        }
    }
    if (method === "GET") {
        url = (dataString === "") ? url : url + "?" + dataString;
    }
    if (window.XMLHttpRequest) {
        http = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        http = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (http !== null) {
        if (typeof(config.progress) !== "undefined") {
            http.upload.addEventListener("progress", config.progress);
        }
        http.open((method === "FILE" ? "POST" : method), url, async);
        http.onreadystatechange = function () {
            if (http.readyState === 4) {
                http.result = http.response;
                if (http.status === 200) {
                    if (typeof(config.success) !== "undefined") config.success(http);
                } else {
                    if (typeof(config.error) !== "undefined") config.error(http);
                }
            }
        };
        if (method === "POST") http.setRequestHeader("Content-Type",
            "application/x-www-form-urlencoded");
        for (var h in config.header) {
            http.setRequestHeader(h, config.header[h]);
        }
        http.send(dataString);
    }
};
cvr.simpleRequest = function(url, method, data){
    var dataString = "";
    if (typeof(data) === "string") {
        dataString = data;
    } else if (typeof(data) === "object") {
        var i = 0;
        for (var index in data) {
            if (i > 0) dataString += "&";
            dataString += index + "=" + data[index];
            i++;
        }
    }
    engine.call('CVRAppCallSendRequest', url, method, dataString);
};
function escapeHtml(text) {
    var map = {
        '&': '&amp;',
        '<': '&lt;',
        '>': '&gt;',
        '"': '&quot;',
        "'": '&#039;',
        "(": '&lpar;',
        ")": '&rpar;'
    };
    return text.replace(/[&<>"'\(\)]/g, function(m) { return map[m]; });
}
function escapeForParameter(text) {
    var map = {
        "'": '\\\'',
    };
    return text.replace(/[']/g, function(m) { return map[m]; });
}
Object.defineProperty(String.prototype, "makeSafe", {
    value: function makeSafe() {
        return escapeHtml(this);
    },
    writable: true,
    configurable: true
});
Object.defineProperty(String.prototype, "makeParameterSafe", {
    value: function makeParameterSafe() {
        return escapeForParameter(this);
    },
    writable: true,
    configurable: true
});