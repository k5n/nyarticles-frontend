var http = require('http');

var server = http.createServer(function(req, res) {
    if (req.method == 'GET') {
        console.log("GET: " + req.url);
        var json = "";
        var statusCode = 200;
        switch (req.url) {
            case '/page/0':
                var json = '[{ "id": "068a262b70630d7fb1fcf12e63c0fd51", "posted": "2017-01-29", "updated": "2017-01-29", "title": "Qiitaを脱出するぞ！", "tags": [ {"id": "nyarticles", "name": "Nyarticles"} ] }, { "id": "4dd52d7e44ff30928f5143b2436a83e1", "posted": "2017-01-30", "updated": "2017-01-30", "title": "Nyarticles作成計画", "tags": [ {"id": "nyarticles", "name": "Nyarticles"} ] } ]';
                console.log("JSON: " + json);
                break;
            default:
                statusCode = 404;
                break;
        }
        res.statusCode = statusCode;
        res.setHeader('Access-Control-Allow-Origin', '*')
        res.write(json);
        res.end();
    } else {
        res.statusCode = 404;
        res.end("Not Found!!");
    }
});

server.listen(8080);
