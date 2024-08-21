extends Node

var url = "http://127.0.0.1:11231/messages/add"
var headers = ["Content-Type: application/json"]

func post_message(text, function):
	var body = {"token": "test", "text": text}
	var request = HTTPRequest.new()
	add_child(request)
	request.connect("request_completed", function)
	request.request(self.url, self.headers, HTTPClient.METHOD_POST, JSON.stringify(body))

