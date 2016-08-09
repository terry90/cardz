window.smartlook || (function(d) {
    var o = smartlook = function() {
            o.api.push(arguments)
        },
        h = d.getElementsByTagName('head')[0];
    var c = d.createElement('script');
    o.api = new Array();
    c.async = true;
    c.type = 'text/javascript';
    c.charset = 'utf-8';
    c.src = '//rec.getsmartlook.com/recorder.js';
    h.appendChild(c);
})(document);
smartlook('init', '75b02cf5cb5022e0875ce1fded0509d4c099eae4');